// table_objects_drop.js repl/srv 190122_0800

"use strict"

const { errors } = require("@db/defs")
const table_drop = require("@db/cat/table_drop")

const { delete: repl_table_delete } = require("./dal/repl_table")



module.exports = async (db, pos, table) => {

  // console.log("DDD - table=", table)

  //
  // REPL UP TABLE
  //
  await table_drop(db,
    { name: table.repl_up_table_name },
    { ignoreErrors: [errors.REL_NOT_EXIST] })

  //
  // REPL DOWN TABLE
  //
  await table_drop(db,
    { name: table.repl_down_table_name },
    { ignoreErrors: [errors.REL_NOT_EXIST] })

  //
  // POS_REPL_TABLE record
  //
  await repl_table_delete(db, table)

}
