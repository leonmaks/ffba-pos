// repl_existing_list.js (repl/cli) 190116_1800

"use strict"

const da = require("@tittles/dicarray")

const table_list = require("./table_list")



module.exports = async (db, tables) => da.lv((await table_list(db, tables)).rt, "orig_table_name")
