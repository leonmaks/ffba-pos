// sync_up.js /repl 190126_1020

/* eslint-disable no-restricted-syntax */

"use strict"

const importLazy = require("import-lazy")(require)

const columns = importLazy("@db/cat/columns")
const insertRecords = importLazy("@db/helpers/insert_records")

const {
  REPL_COL_ID,
  CLI_REPL_TABLE_PFX,
} = importLazy("./defs")

const repl_table_list = importLazy("./srv/repl_table_with_def_list")



module.exports = async (ctx) => {

  await ctx.srv.db.tx("sync_up.srv", async srv_tx_ => {

    const repl_table_list_ = await repl_table_list(srv_tx_, ctx.cli.pos)

    await ctx.cli.db.tx("sync_up.cli", async cli_tx_ => {

      // TODO: limit max records to replicate in one operation !!!
      for await (const t_ of repl_table_list_) {

        t_.cli_repl_table_name = `${CLI_REPL_TABLE_PFX}${t_.table_name}`

        const exist_ = await cli_tx_.one(
          "SELECT coalesce(max(${repl_col_id^}), -1) AS max_id FROM ${cli_repl_table_name^}", {
            repl_col_id: REPL_COL_ID.col_name,
            cli_repl_table_name: t_.cli_repl_table_name,
          }
        )

        if (exist_.max_id > t_.last_repl_up_id) {

          const columns_ = await columns(cli_tx_, [t_.cli_repl_table_name])
          const colnames_ = columns_.map(c_ => c_.col_name)

          const recs_ = await cli_tx_.any(
            "SELECT ${columns^} FROM ${table_name^} WHERE ${repl_col_id^} between (${last_repl_id#} + 1) AND ${max_repl_id}",
            {
              columns: colnames_.join(", "),
              table_name: t_.cli_repl_table_name,
              repl_col_id: REPL_COL_ID.col_name,
              last_repl_id: t_.last_repl_up_id,
              max_repl_id: exist_.max_id,
            }
          )

          await insertRecords(srv_tx_, t_.repl_up_table_name, recs_)

          await srv_tx_.none(
            "UPDATE ffba_pos_repl_table SET last_repl_up_id = ${last_repl_up_id}, last_repl_up_dt = now() WHERE id = ${id}",
            {
              last_repl_up_id: exist_.max_id,
              id: t_.id,
            }
          )

        }

        // TODO: limit one iteration to MAX number of records
        // if max_repl_id_ <= t_["last_repl_id"]: continue

      }
    })
  })

}
