/* eslint-disable no-restricted-syntax */

"use strict"

const path = require("path")
const fs = require("fs")
const fs_extra = require("fs-extra")

const { pathType, deployStatus } = require("./defs")

const { statusUpdate, pathTree, log: deployLog } = require("./dal/deploy")


const drop = async (db, pos, home, paths) => {

  const
    flat_ = {},
    dirs_ = [],
    deploy_id_array_ = []

  let deploy_id_ = null

  for await (const p_ of paths) {

    if (!(deploy_id_ === p_.deploy_id)) {
      deploy_id_ = p_.deploy_id
      deploy_id_array_.push(deploy_id_)
    }

    flat_[p_.id] = p_

    p_.path = path.join(
      p_.up_id ? flat_[p_.up_id].path : "",
      p_.dir_last ? p_.dir_last : "",
      p_.file ? p_.file : ""
    )

    if (p_.type_id === pathType.DIRECTORY) {
      dirs_.push(p_)

    } else {

      let error_ = ""

      if (p_.type_id === pathType.FILE) {
        try {
          fs.unlinkSync(path.join(home, p_.path))
        } catch (e_) {
          error_ = e_
        }

      } else {
        error_ = `Wrong type ${p_.type_id} of '${p_.path}': path.id=${p_.id}, deploy_id=${p_.deploy_id}`
      }

      await deployLog(db, {
        session_id: pos.session.id,
        deploy_id: p_.deploy_id,
        path_id: p_.id,
        status_id: error_ === "" ? deployStatus.DELETED : deployStatus.ERROR,
        path: p_.path,
        content: "",
        error_text: error_,
      })
    }
  }

  if (dirs_.length > 0) {

    //
    // Reverse directory list order
    //
    dirs_.reverse()

    //
    // Remove empty directories
    //
    for await (const d_ of dirs_) {
      let error_ = ""
      try {
        await fs_extra.rmdir(path.join(home, d_.path))
      } catch (e_) {
        error_ = e_
      }
      await deployLog(db, {
        session_id: pos.session.id,
        deploy_id: d_.deploy_id,
        path_id: d_.id,
        status_id: error_ === "" ? deployStatus.DELETED : deployStatus.ERROR,
        path: d_.path,
        content: "",
        error_text: error_,
      })
    }
  }

  if (deploy_id_array_.length > 0) {
    await statusUpdate(db, {
      status_id: deployStatus.DELETED,
      id: deploy_id_array_,
    })
  }
}


const deploy = async (db, pos, home, paths) => {

  console.log("DEPLOY: paths=", paths)

  const
    flat_ = {},
    deploy_id_array_ = []

  let deploy_id_ = null

  for await (const p_ of paths) {

    if (!(deploy_id_ === p_.deploy_id)) {
      deploy_id_ = p_.deploy_id
      deploy_id_array_.push(deploy_id_)
    }

    flat_[p_.id] = p_

    p_.path = path.join(
      p_.up_id ? flat_[p_.up_id].path : "",
      p_.dir_last ? p_.dir_last : "",
      p_.file ? p_.file : ""
    )

    let error_ = ""

    if (p_.type_id === pathType.FILE) {
      try {
        // TODO:
        // fs.unlinkSync(path.join(home, p_.path))
      } catch (e_) {
        error_ = e_
      }
    }

    await deployLog(db, {
      session_id: pos.session.id,
      deploy_id: p_.deploy_id,
      path_id: p_.id,
      status_id: error_ === "" ? deployStatus.DELETED : deployStatus.ERROR,
      path: p_.path,
      content: "",
      error_text: error_,
    })
  }

  if (deploy_id_array_.length > 0) {
    await statusUpdate(db, {
      status_id: deployStatus.DELETED,
      id: deploy_id_array_,
    })
  }
}


const update = async (db, pos, home) => db.task(async task => {

  //
  // Fetch deploy path tree
  //
  const all_ = await pathTree(task, {
    pos_id: pos.id,
    status_list: [deployStatus.TO_DEPLOY, deployStatus.TO_DELETE]
  })

  //
  // Split: to_delete[], to_deploy[]
  //
  const
    to_drop_ = [],
    to_deploy_ = []

  all_.forEach(p_ => {

    switch (p_.status_id) {

      case deployStatus.TO_DELETE:
        to_drop_.push(p_)
        break

      case deployStatus.TO_DEPLOY:
        to_deploy_.push(p_)
        break

      default:
        throw new Error(`Wrong deploy status ${p_.status_id}: path.id=${p_.id}, deploy_id=${p_.deploy_id}`)
    }
  })

  // console.log("XXX: to_drop=", to_drop_)
  // console.log("XXX: to_deploy=", to_deploy_)

  if (to_drop_.length > 0) {
    await drop(task, pos, home, to_drop_)
  }

  if (to_deploy_.length > 0) {
    await deploy(task, pos, home, to_deploy_)
  }

  // const flat_ = {}
  // const tree_ = {}

  // for await (const p_ of paths_) {

  //   console.log("XXX: p.id=", p_.id, "p.up_id", p_.up_id)

  //   flat_[p_.id] = p_

  //   p_.children = []

  //   if (!p_.up_id) {

  //     tree_[p_.id] = p_

  //     p_.path = path.join(p_.dir_last ? p_.dir_last : "", p_.file ? p_.file : "")

  //     console.log("000: path=", p_.path)

  //   } else {

  //     const parent_ = flat_[p_.up_id]

  //     p_.path = path.join(
  //       parent_.path ? parent_.path : "",
  //       p_.dir_last ? p_.dir_last : "",
  //       p_.file ? p_.file : ""
  //     )

  //     flat_[p_.up_id].children.push(p_)

  //   }

  //   if (p_.type_id === pathType.FILE) {

  //     // TODO: write file
  //     console.log("000: write file! path=", p_.path)

  //     const content_ = p_.content ? p_.content : ""

  //     await fs_extra.outputFile(path.join(home, p_.path), content_)

  //     await deployLog(task, {
  //       session_id: pos.session.id,
  //       deploy_id: p_.deploy_id,
  //       path_id: p_.id,
  //       status_id: deployStatus.DEPLOYED,
  //       path: p_.path,
  //       content: content_,
  //     })

  //   }

  // }

})


module.exports = {

  update,

}
