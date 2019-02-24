"use strict"

const path = require("path")

const { stmt } = require("pg-utl")



module.exports = {

  // SELECT
  select_by_pos: stmt(path.join(__dirname, "repl_table/select_by_pos.sql"), { minify: true }),
  select_by_pos_with_def: stmt(path.join(__dirname, "repl_table/select_by_pos_with_def.sql"), { minify: true }),
  select_on_upload_4u: stmt(path.join(__dirname, "repl_table/select_on_upload_4u.sql"), { minify: true }),

  // INSERT
  insert: stmt(path.join(__dirname, "repl_table/insert.sql"), { minify: true }),

  // UPDATE
  update_on_sync_down: stmt(path.join(__dirname, "repl_table/update_on_sync_down.sql"), { minify: true }),
  update_on_upload: stmt(path.join(__dirname, "repl_table/update_on_upload.sql"), { minify: true }),

  // DELETE
  delete: stmt(path.join(__dirname, "repl_table/delete.sql"), { minify: true }),

}
