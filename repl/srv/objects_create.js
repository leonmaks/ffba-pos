// objects_create (repl/srv) 190116_1730

/* eslint-disable no-restricted-syntax */

const table_objects_create = require("./table_objects_create")


module.exports = async (db, pos, tables) => {

  for await (const t_ of tables) {

    await table_objects_create(db, pos, t_)

  }

}
