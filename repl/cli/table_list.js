// table_list.js (repl/cli) 190116_1800

"use strict"

const own_tables = require("@db/cat/own_tables")

const {
  CLI_REPL_TABLE_PFX,
  CLI_REPL_TABLE_PFX_LEN
} = require("../defs")



module.exports = async (db, tableNames) => {

  const
    // Normal Tables
    nt_ = [],
    // Replication Tables
    rt_ = [],
    // Where condition
    where_ = []

  if (tableNames && tableNames.length > 0) {
    tableNames.forEach(t_ => {
      where_.push(t_)
      where_.push(`${CLI_REPL_TABLE_PFX}${t_}`)
    })
  }

  (await own_tables(db, where_)).forEach(t_ => {

    if (t_.relname.substring(0, CLI_REPL_TABLE_PFX_LEN) === CLI_REPL_TABLE_PFX) {

      t_.orig_table_name = t_.relname.substring(CLI_REPL_TABLE_PFX_LEN)
      rt_.push(t_)

    } else {

      nt_.push(t_)

    }

  })

  return { nt: nt_, rt: rt_ }
}
