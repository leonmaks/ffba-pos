// pos_deploy.js (pos/dal) 190116_1800

/* eslint-disable no-restricted-syntax */

"use strict"

const importLazy = require("import-lazy")(require)

const path = importLazy("path")

const {
  pathType,
} = importLazy("../defs")

const {
  deploy_select,
  deployed_packages_select,
  package_files_select,
  deploy_status_update,
  path_tree_select,
  log_insert
} = importLazy("../sql/pos_deploy")


const deploySelect = async (db, params) => db.any(deploy_select, params)

const deployedPackagesSelect = async (db, params) => db.any(deployed_packages_select, params)

const packageFilesSelect = async (db, params) => db.any(package_files_select, params)

const deployStatusUpdate = async (db, params) => db.none(deploy_status_update, params)

const pathTreeSelectRaw = async (db, params) => db.any(path_tree_select, params)


const pathTreeSelect = async (db, params) => {

  const raw = await pathTreeSelectRaw(db, params)

  const
    flat = {},
    dirs = [],
    files = []

  for await (const p_ of raw) {

    flat[p_.id] = p_

    p_.path = path.join(
      p_.up_id ? flat[p_.up_id].path : "",
      p_.dir_last || "",
      p_.file || ""
    )

    if (p_.type_id === pathType.DIRECTORY) {
      dirs.push(p_)
    } else {
      files.push(p_)
    }
  }

  return {
    raw, flat, dirs, files
  }
}


const log = async (db, params) => db.none(log_insert, params)



module.exports = {

  deploySelect,
  deployStatusUpdate,

  deployedPackagesSelect,
  packageFilesSelect,

  pathTreeSelectRaw,
  pathTreeSelect,

  log,

}
