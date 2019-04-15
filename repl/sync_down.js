// sync_down.js (repl) 190119_1730

/* eslint-disable no-restricted-syntax */

"use strict"

const { diff } = require("@tittles/array")

const selectRecords = require("@db/helpers/select_records")
const insertRecords = require("@db/helpers/insert_records")
const updateRecords = require("@db/helpers/update_records")
const deleteRecords = require("@db/helpers/delete_records")

const {
  REPL_COL_ID,
  REPL_COL_OP,
  REPL_COL_CREATE_DT,
  REPL_OP_INIT,
  REPL_OP_NEW,
  REPL_OP_UPDATE,
  REPL_OP_DELETE,
} = require("./defs")

const repl_table_list = require("./srv/repl_table_with_def_list")
const { update_on_sync_down } = require("./srv/dal/repl_table")


const repl_cols__ = [
  REPL_COL_ID.col_name,
  REPL_COL_OP.col_name,
  REPL_COL_CREATE_DT.col_name,
]


const table_sync_down = async (ctx, repl_table) => {

  await ctx.srv.db.tx("table_sync_down.srv", async srv_tx_ => {

    console.log("SSS: repl_table=", repl_table.repl_down_table_name)

    const down_recs_ = await selectRecords.any(srv_tx_, repl_table.repl_down_table_name, {
      where: [
        `${REPL_COL_ID.col_name} between (${repl_table.last_repl_down_id} + 1) and ${repl_table.max_repl_down_id}`,
      ],
      order_by: [
        REPL_COL_ID.col_name,
      ],
    })

    // TODO: + if repl_table.ident_cols is null
    const id_cols_ = repl_table.ident_cols.match(/\w+/g)
    console.log("III: id_cols=", id_cols_)

    await ctx.cli.db.tx("table_sync_down.cli", async cli_tx_ => {

      for await (const r_ of down_recs_) {

        console.log("XXX: repl_id=", r_.r$_id, "op=", r_.r$_op)

        // console.log("XXX: R=", r_)

        switch (r_.r$_op) {

          case REPL_OP_INIT:
          case REPL_OP_NEW:

            console.log("NEW record")

            delete r_[REPL_COL_ID.col_name]
            delete r_[REPL_COL_OP.col_name]
            delete r_[REPL_COL_CREATE_DT.col_name]

            await insertRecords(cli_tx_, repl_table.table_name, [r_])

            break

          case REPL_OP_UPDATE:

            await updateRecords(cli_tx_, repl_table.table_name, {
              set: diff(Object.keys(r_), [...id_cols_, ...repl_cols__]),
              where: id_cols_.map(c_ => [c_, "${".concat(c_, "}")].join(" = ")),
              ...r_,
            })

            break

          case REPL_OP_DELETE:

            await deleteRecords(cli_tx_, repl_table.table_name, {
              where: id_cols_.map(c_ => [c_, "${".concat(c_, "}")].join(" = ")),
              ...r_,
            })

            break

          default:
            break
        }

      }

      await update_on_sync_down(srv_tx_, {
        last_repl_down_id: repl_table.max_repl_down_id,
        id: repl_table.id,
      })

    })

  })

}









// await ctx.cli.db.tx("table_sync_down.cli", async cli_tx_ => {

// for await (const r_ of down_recs_) {

// console.log("XXX: repl_id=", r_.r$_id, "op=", r_.r$_op)

//   //     switch (r_.r$_op) {

//   //       case REPL_OP_DELETE:

//   //         await delete (cli_tx_, t.table_name)

//   //         console.log("DDD: repl_id=", r_.r$_id, "op=", r_.r$_op)


//   //         break

//   //       default:
//   //         break
//   //     }

// }

//   //     })
// })

//   // await ctx.srv.db.tx("sync_down.srv", async srv_tx_ => {



// Create replication objects for (selected - if 'tables' defined) user tables
module.exports = async (ctx) => {

  await ctx.srv.db.task("sync_down.srv", async srv_task_ => {

    const repl_table_list_ = await repl_table_list(srv_task_, ctx.cli.pos)

    for await (const t_ of repl_table_list_) {

      t_.max_repl_down_id = (await selectRecords.one(srv_task_, t_.repl_down_table_name, {
        columns: [`coalesce(max(${REPL_COL_ID.col_name}), -1) AS max_id`],
      })).max_id
      // srv_task_.one(
      //   "SELECT coalesce(max(${repl_col_id^}), -1) AS max_id FROM ${repl_down_table_name^}", {
      //     repl_col_id: REPL_COL_ID.col_name,
      //     repl_down_table_name: t_.repl_down_table_name,
      //   }
      // )

      if (t_.max_repl_down_id > t_.last_repl_down_id) {

        // console.log("XXX: down_table=", t_.repl_down_table_name, "max_id=", t_.max_repl_down_id, "last_id=", t_.last_repl_down_id)

        await table_sync_down(ctx, t_)

      }

    }

  })

}
