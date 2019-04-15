// objects_drop.js (repl/srv) 190116_1730

/* eslint-disable no-restricted-syntax */

"use strict"

const { select_by_pos } = require("./dal/repl_table")
const table_objects_drop = require("./table_objects_drop")



module.exports = async (db, pos) => {
// module.exports = async (db, pos, tables) => {

  const tables_ = await select_by_pos(db, { pos_id: pos.id })

  for await (const t_ of tables_) {

    await table_objects_drop(db, pos, t_)

  }

}
