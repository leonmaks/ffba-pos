"use strict"

const path = require("path")

const { stmt } = require("pg-utl")



module.exports = {

  deploy_select: stmt(path.join(__dirname, "pos_deploy/deploy_select.sql"), { minify: true }),

  deployed_packages_select: stmt(path.join(__dirname, "pos_deploy/deployed_packages_select.sql"), { minify: true }),

  package_files_select: stmt(path.join(__dirname, "pos_deploy/package_files_select.sql"), { minify: true }),

  deploy_status_update: stmt(path.join(__dirname, "pos_deploy/deploy_status_update.sql"), { minify: true }),

  path_tree_select: stmt(path.join(__dirname, "pos_deploy/path_tree_select.sql"), { minify: true }),

  log_insert: stmt(path.join(__dirname, "pos_deploy/log_insert.sql"), { minify: true }),

}
