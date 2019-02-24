// repl_table_with_def_list.js repl/srv 190123_1230

"use strict"

const importLazy = require("import-lazy")(require)

const { select_by_pos_with_def } = importLazy("./dal/repl_table")



module.exports = async (db, pos) => select_by_pos_with_def(db, { pos_id: pos.id })
