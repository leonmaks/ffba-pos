// table_objects_create.js repl/srv 190122_0800

"use strict"

const importLazy = require("import-lazy")(require)

const table_create = importLazy("@db/cat/table_create")
const { insert: repl_table_insert } = importLazy("./dal/repl_table")


const {

  SRV_REPL_UP_TABLE_PFX,
  SRV_REPL_DOWN_TABLE_PFX,

  REPL_COL_ID,
  REPL_COL_ID_NO_SEQ,
  REPL_COL_OP,
  REPL_COL_CREATE_DT,

} = require("../defs")



module.exports = async (db, pos, table) => {

  // console.log("III - table_name=", table.name, "table_columns=", table.columns)

  table.pos_id = pos.id
  table.repl_up_table_name = `${SRV_REPL_UP_TABLE_PFX}${pos.srv_table_pfx}_${table.name}`
  table.repl_down_table_name = `${SRV_REPL_DOWN_TABLE_PFX}${pos.srv_table_pfx}_${table.name}`

  //
  // REPL UP TABLE
  //
  await table_create(db, {
    name: table.repl_up_table_name,
    columns: table.columns.concat([REPL_COL_ID_NO_SEQ, REPL_COL_OP, REPL_COL_CREATE_DT]),
  })

  //
  // REPL DOWN TABLE
  //
  await table_create(db, {
    name: table.repl_down_table_name,
    columns: table.columns.concat([REPL_COL_ID, REPL_COL_OP, REPL_COL_CREATE_DT]),
  })

  //
  // REPL TABLE RECORD (INSERT)
  //
  await repl_table_insert(db, table)

}
