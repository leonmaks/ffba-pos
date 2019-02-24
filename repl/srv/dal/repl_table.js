"use strict"

const { sjoin } = require("tittles")

const repl_table = require("../sql/repl_table")



module.exports = {

  select_by_pos: async (db, params) => db.any(repl_table.select_by_pos, params),

  select_by_pos_with_def: async (db, params) => db.any(repl_table.select_by_pos_with_def, {
    ...params,
    where: sjoin(params.where, " AND ", " AND "),
  }),

  select_on_upload_4u: async (db, params) => db.one(repl_table.select_on_upload_4u, params),

  insert: async (db, params) => db.one(repl_table.insert, params),

  update_on_sync_down: async (db, params) => db.none(repl_table.update_on_sync_down, params),
  update_on_upload: async (db, params) => db.none(repl_table.update_on_upload, params),

  delete: async (db, params) => db.none(repl_table.delete, params),
}
