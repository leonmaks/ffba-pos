// table_objects_create.js (repl/cli) 190116_1800

"use strict"

const columns = require("@db/cat/columns")
const table_create = require("@db/cat/table_create")

const table_init = require("./table_init")

const trigger_function_ai_create = require("./trigger_function_ai_create")
const trigger_function_au_create = require("./trigger_function_au_create")
const trigger_function_bd_create = require("./trigger_function_bd_create")

const trigger_ai_create = require("./trigger_ai_create")
const trigger_au_create = require("./trigger_au_create")
const trigger_bd_create = require("./trigger_bd_create")

const {
  CLI_REPL_TABLE_PFX,
  REPL_COL_ID,
  REPL_COL_OP,
  REPL_COL_CREATE_DT,
} = require("../defs")



// Create replication objects for (selected - if 'tables' defined) user tables
module.exports = async (db, tableName) => {

  const columns_ = await columns(db, [tableName])
  const columnNames_ = columns_.map(c_ => c_.col_name)

  //
  // REPLICATION TABLE
  //
  await table_create(db, {
    name: `${CLI_REPL_TABLE_PFX}${tableName}`,
    columns: columns_.concat([REPL_COL_ID, REPL_COL_OP, REPL_COL_CREATE_DT]),
  })

  //
  // INIT REPLICATION DATA
  //
  await table_init(db, { table_name: tableName, column_names: columnNames_ })

  //
  // AFTER INSERT
  //
  await trigger_function_ai_create(db, tableName, columnNames_)
  await trigger_ai_create(db, tableName)

  //
  // AFTER UPDATE
  //
  await trigger_function_au_create(db, tableName, columnNames_)
  await trigger_au_create(db, tableName)

  //
  // BEFORE DELETE
  //
  await trigger_function_bd_create(db, tableName, columnNames_)
  await trigger_bd_create(db, tableName)

  return columns_
}
