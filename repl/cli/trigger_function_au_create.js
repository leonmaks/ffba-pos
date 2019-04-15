// trigger_function_au_create.js (repl/cli) 190116_1800

"use strict"

const trigger_function_create = require("@db/cat/trigger_function_create")

const {
  CLI_REPL_TABLE_PFX,
  REPL_COL_OP,
  REPL_COL_CREATE_DT,
  REPL_FUNC_AU_PFX,
  REPL_OP_UPDATE,
} = require("../defs")



module.exports = async (db, tableName, columnNames) => {

  const cols_ = `${columnNames.join(", ")}, ${REPL_COL_OP.col_name}, ${REPL_COL_CREATE_DT.col_name}`

  const prefixed_cols_ = columnNames.map(c_ => `NEW.${c_}`)
  const vals_ = `${prefixed_cols_.join(", ")}, '${REPL_OP_UPDATE}', current_timestamp`


  return trigger_function_create(db, {
    name: `${REPL_FUNC_AU_PFX}${tableName}`,
    replace: true,
    args: null,
    body: `INSERT INTO ${CLI_REPL_TABLE_PFX}${tableName} (${cols_}) VALUES (${vals_});`,
    retval: "NEW"
  })

}
