// deploy.js (pos) 190116_1800

/* eslint-disable no-restricted-syntax */

"use strict"

const importLazy = require("import-lazy")(require)

const path = importLazy("path")
const fs = importLazy("fs")
const fs_extra = importLazy("fs-extra")

const {
  deployStatus,
} = importLazy("./defs")

const {
  deploySelect,
  deployStatusUpdate,
  pathTreeSelect,
  log
} = importLazy("./dal/pos_deploy")


const deployFile = async (db, params) => {

  // session_id
  // deploy_id
  // id (path.id)
  // home
  // path
  // content

  let error_ = ""

  try {

    await fs_extra.outputFile(path.join(params.home, params.path), params.content)

  } catch (e_) {
    error_ = e_
  }

  await log(db, {
    session_id: params.session_id,
    deploy_id: params.deploy_id,
    path_id: params.id,
    status_id: error_ === "" ? deployStatus.DEPLOYED : deployStatus.ERROR,
    path: params.path,
    content: params.content,
    error_text: error_,
  })

}


const deleteFile = async (db, params) => {

  // session_id
  // deploy_id
  // id (path.id)
  // home
  // path

  let error_ = ""

  try {

    fs.unlinkSync(path.join(params.home, params.path))

  } catch (e_) {
    error_ = e_
  }

  await log(db, {
    session_id: params.session_id,
    deploy_id: params.deploy_id,
    path_id: params.id,
    status_id: error_ === "" ? deployStatus.DELETED : deployStatus.ERROR,
    path: params.path,
    content: "",
    error_text: error_,
  })

}


const deleteDir = async (db, params) => {

  // session_id
  // deploy_id
  // id (path.id)
  // home
  // path

  let error_ = ""

  try {

    await fs_extra.rmdir(path.join(params.home, params.path))

  } catch (e_) {
    error_ = e_
  }

  await log(db, {
    session_id: params.session_id,
    deploy_id: params.deploy_id,
    path_id: params.id,
    status_id: error_ === "" ? deployStatus.DELETED : deployStatus.ERROR,
    path: params.path,
    content: "",
    error_text: error_,
  })

}


const processFiles = async (db, params, callback) => {

  for await (const p_ of params.tree.files) {

    await callback(db, {
      ...params,
      id: p_.id,
      path: p_.path,
      content: p_.content
    })
  }
}


const deploy = async (db, pos, home) => db.task("pos.deploy", async task => {

  const deploy_array_ = await deploySelect(task, {
    pos_id: pos.id,
    status_id_array: [
      deployStatus.TO_DELETE,
      deployStatus.TO_DEPLOY,
    ],
  })

  const tree_cash_ = {}

  for await (const deploy_ of deploy_array_) {

    let deploy_status_id_ = deployStatus.NO_ACTION

    let tree_ = tree_cash_[deploy_.package_id]
    if (!tree_) {

      tree_ = await pathTreeSelect(task, {
        package_id: deploy_.package_id
      })
      tree_cash_[deploy_.package_id] = tree_
    }

    if (deploy_.status_id === deployStatus.TO_DEPLOY) {

      if (!deploy_.path_id) {

        await processFiles(task, {
          home,
          session_id: pos.session.id,
          tree: tree_,
          deploy_id: deploy_.id,
        }, deployFile)

      } else {

        // TODO: deploy path!
        console.log("DEPLOY PATH: path_id=", deploy_.path_id)
      }

      deploy_status_id_ = deployStatus.DEPLOYED
    }

    if (deploy_.status_id === deployStatus.TO_DELETE) {

      if (!deploy_.path_id) {

        await processFiles(task, {
          home,
          session_id: pos.session.id,
          tree: tree_,
          deploy_id: deploy_.id,
        }, deleteFile)

        //
        // Reverse directory list order
        //
        tree_.dirs.reverse()

        //
        // Remove empty directories
        //
        for await (const d_ of tree_.dirs) {

          await deleteDir(db, {
            home,
            session_id: pos.session.id,
            deploy_id: deploy_.id,
            id: d_.id,
            path: d_.path,
          })

        }

      } else {

        // TODO: delete path!
        console.log("DELETE PATH: path_id=", deploy_.path_id)
      }

      deploy_status_id_ = deployStatus.DELETED
    }

    await deployStatusUpdate(task, {
      status_id: deploy_status_id_,
      id: deploy_.id,
    })

  }

})



module.exports = {
  deploy,
}
