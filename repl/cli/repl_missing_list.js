// repl_missing_list.js (repl/cli) 190116_1800

"use strict"

const array = require("@tittles/array")
const da = require("@tittles/dicarray")

const table_list = require("./table_list")



module.exports = async (db, tables) => {

  const table_list_ = await table_list(db, tables)

  return array.diff(da.lv(table_list_.nt, "relname"), da.lv(table_list_.rt, "orig_table_name"))

}
