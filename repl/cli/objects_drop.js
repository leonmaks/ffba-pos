// objects_drop.js (repl/cli) 190116_1800

/* eslint-disable no-restricted-syntax */

"use strict"

const importLazy = require("import-lazy")(require)

const repl_existing_list = importLazy("./repl_existing_list")
const table_objects_drop = importLazy("./table_objects_drop")



// Drop replication objects for all (selected - if 'tables' defined) user tables
module.exports = async (db, tables) => {

  const dropped_ = []

  const tableNames_ = await repl_existing_list(db, tables)

  for await (const tn_ of tableNames_) {

    await table_objects_drop(db, tn_)

    dropped_.push({
      name: tn_,
    })

  }

  return dropped_

}
