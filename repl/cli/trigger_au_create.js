// trigger_au_create.js (repl/cli) 190116_1800

"use strict"

const trigger_create = require("@db/cat/trigger_create")

const {
  REPL_FUNC_AU_PFX,
  REPL_TRIG_AU_PFX,
} = require("../defs")



module.exports = async (db, tableName) => (

  trigger_create(db, {

    name: `${REPL_TRIG_AU_PFX}${tableName}`,
    when: "AFTER",
    event: "UPDATE",
    table: tableName,
    trigger: "FOR EACH ROW",
    function: `${REPL_FUNC_AU_PFX}${tableName}`,
    args: null,
  })

)
