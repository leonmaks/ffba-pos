"use strict"

const path = require("path")

const { stmt } = require("pg-utl")



module.exports = {

  run_select: stmt(path.join(__dirname, "pos_action/run_select.sql"), { minify: true }),

  run_update: stmt(path.join(__dirname, "pos_action/run_update.sql"), { minify: true }),

  run_log_insert: stmt(path.join(__dirname, "pos_action/run_log_insert.sql"), { minify: true }),

}
