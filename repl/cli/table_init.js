// table_init.js /repl/cli 190126_1800

"use strict"

const sjoin = require("@tittles/sjoin")

const insert_select = require("@db/helpers/insert_select")

const {
  CLI_REPL_TABLE_PFX,
  REPL_COL_OP,
  REPL_COL_CREATE_DT,
  REPL_OP_INIT,
} = require("../defs")



module.exports = async (db, params) => {

  return insert_select(db, {

    insert_table_name: `${CLI_REPL_TABLE_PFX}${params.table_name}`,

    insert_columns: sjoin([
      ...params.column_names,
      REPL_COL_OP.col_name,
      REPL_COL_CREATE_DT.col_name,
    ]),

    select_table_name: params.table_name,

    select_columns: sjoin([
      ...params.column_names,
      `'${REPL_OP_INIT}'`,
      "current_timestamp",
    ]),
  })
}
