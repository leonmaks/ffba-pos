// repl_existing_list.js (repl/cli) 190116_1800

"use strict"

const importLazy = require("import-lazy")(require)

const da = importLazy("@tittles/dicarray")

const table_list = importLazy("./table_list")



module.exports = async (db, tables) => da.lv((await table_list(db, tables)).rt, "orig_table_name")
