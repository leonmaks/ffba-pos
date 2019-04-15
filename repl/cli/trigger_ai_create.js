// trigger_ai_create.js (repl/cli) 190116_1800

"use strict"

const trigger_create = require("@db/cat/trigger_create")

const {
  REPL_TRIG_AI_PFX,
  REPL_FUNC_AI_PFX,
} = require("../defs")



module.exports = async (db, tableName) => (

  trigger_create(db, {

    name: `${REPL_TRIG_AI_PFX}${tableName}`,
    when: "AFTER",
    event: "INSERT",
    table: tableName,
    trigger: "FOR EACH ROW",
    function: `${REPL_FUNC_AI_PFX}${tableName}`,
    args: null,

  })

)
