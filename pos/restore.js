// restore.js /pos 190122_1540

/* eslint-disable no-restricted-syntax */

"use strict"

const fs_extra = require("fs-extra")
const path = require("path")

const {
  deployStatus,
} = require("./defs")

const {
  deployedPackagesSelect,
  packageFilesSelect,
} = require("./dal/pos_deploy")


const restore = async (db, ctx) => {

  // Ensure defs.POS_HOME directory exists
  await fs_extra.ensureDir(ctx.home)

  const deployedPackages_ = await deployedPackagesSelect(db, { pos_id: ctx.pos.id })

  for await (const p_ of deployedPackages_) {

    const files_ = await packageFilesSelect(db, {
      deploy_id: p_.deploy_id,
      status_id_array: [deployStatus.DEPLOYED],
    })

    for await (const f_ of files_) {

      const path_ = path.join(ctx.home, f_.path)

      await fs_extra.outputFile(path_, f_.content)

      console.log(`File '${path_}' restored`)

    }

    // try {

    //   await fs_extra.outputFile(path.join(params.home, params.path), params.content)

    // } catch (e_) {
    //   error_ = e_
    // }

  }

  // 1. Select latest deploys
  // 2. Loop through each deploy
  //    - for each file get path and content
  //    - write file to disk



}



module.exports = {
  restore,
}
