// objects_create.js (repl/cli) 190116_1800

/* eslint-disable no-restricted-syntax */

"use strict"

const importLazy = require("import-lazy")(require)

const repl_missing_list = importLazy("./repl_missing_list")
const table_objects_create = importLazy("./table_objects_create")



// Create replication objects for (selected - if 'tables' defined) user tables
module.exports = async (db, tables) => {

  const created_ = []

  const tableNames_ = await repl_missing_list(db, tables)

  for await (const tn_ of tableNames_) {

    const columns_ = await table_objects_create(db, tn_)

    created_.push({
      name: tn_,
      columns: columns_,
    })

  }

  return created_

}
