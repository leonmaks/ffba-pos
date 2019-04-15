// table_objects_drop.js (repl/cli) 190116_1800

"use strict"

const { errors } = require("@db/defs")
const table_drop = require("@db/cat/table_drop")
const function_drop = require("@db/cat/function_drop")
const trigger_drop = require("@db/cat/trigger_drop")

const {
  CLI_REPL_TABLE_PFX,
  REPL_FUNC_AI_PFX,
  REPL_FUNC_AU_PFX,
  REPL_FUNC_BD_PFX,
  REPL_TRIG_AI_PFX,
  REPL_TRIG_AU_PFX,
  REPL_TRIG_BD_PFX,
} = require("../defs")


// Drop the replication objects for the table
module.exports = async (db, tableName) => {

  //
  // TRIGGERS
  //
  await trigger_drop(db, { name: `${REPL_TRIG_AI_PFX}${tableName}`, table: tableName }, { ignoreErrors: [errors.UNDEF_OBJECT] })
  await trigger_drop(db, { name: `${REPL_TRIG_AU_PFX}${tableName}`, table: tableName }, { ignoreErrors: [errors.UNDEF_OBJECT] })
  await trigger_drop(db, { name: `${REPL_TRIG_BD_PFX}${tableName}`, table: tableName }, { ignoreErrors: [errors.UNDEF_OBJECT] })

  //
  // TRIGGER FUNCTIONS
  //
  await function_drop(db, { name: `${REPL_FUNC_AI_PFX}${tableName}`, args: "" }, { ignoreErrors: [errors.FUNC_DOES_NOT_EXIST] })
  await function_drop(db, { name: `${REPL_FUNC_AU_PFX}${tableName}`, args: "" }, { ignoreErrors: [errors.FUNC_DOES_NOT_EXIST] })
  await function_drop(db, { name: `${REPL_FUNC_BD_PFX}${tableName}`, args: "" }, { ignoreErrors: [errors.FUNC_DOES_NOT_EXIST] })

  //
  // TABLE
  //
  await table_drop(db, { name: `${CLI_REPL_TABLE_PFX}${tableName}` }, { ignoreErrors: [errors.REL_NOT_EXIST] })

}
