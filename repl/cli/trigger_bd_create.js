// trigger_bd_create.js (repl/cli) 190116_1800

"use strict"

const importLazy = require("import-lazy")(require)

const trigger_create = importLazy("@db/cat/trigger_create")

const {
  REPL_FUNC_BD_PFX,
  REPL_TRIG_BD_PFX,
} = importLazy("../defs")



module.exports = async (db, tableName) => (

  trigger_create(db, {

    name: `${REPL_TRIG_BD_PFX}${tableName}`,
    when: "BEFORE",
    event: "DELETE",
    table: tableName,
    trigger: "FOR EACH ROW",
    function: `${REPL_FUNC_BD_PFX}${tableName}`,
    args: null,
  })

)
