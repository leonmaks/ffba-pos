// repl_table_with_def_list.js repl/srv 190123_1230

"use strict"

const { select_by_pos_with_def } = require("./dal/repl_table")



module.exports = async (db, pos) => select_by_pos_with_def(db, { pos_id: pos.id })
