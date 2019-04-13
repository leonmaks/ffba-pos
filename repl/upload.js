"use strict"

/* eslint-disable no-restricted-syntax */
/* eslint-disable no-await-in-loop */

const { sjoin, dicarray, array } = require("tittles")

const {
  pg_select,
  pg_insert,
  pg_update,
  pg_delete,
  pg_insert_ver,
  columns
} = require("pg-utl")

const {

  REPL_COLS,
  REPL_COL_ID,
  REPL_COL_OP,
  REPL_COL_CREATE_DT,

  SRV_REPL_UP_TABLE_PFX,
  SRV_UPLD_TABLE_PFX,

  REPL_OP_NEW,
  REPL_OP_UPDATE,
  REPL_OP_DELETE,
  REPL_OP_INIT,

  UPLD_RECS_LIMIT,

  SITEGUID,

  VER_FD_COL,
  VER_TD_COL,
  VER_TABLE_SFX,

} = require("./defs")

const pos = require("@pos/dal/pos")

const {
  select_by_pos_with_def,
  select_on_upload_4u,
  update_on_upload,
} = require("./srv/dal/repl_table")


const __upload_table = (db, params, limit = UPLD_RECS_LIMIT) => db.tx("upload_table", async tx_ => {

  // Select (+lock for update) last uploaded id from 'ffba_pos_repl_table'
  const { ctid, last_upld_srv_id } = await select_on_upload_4u(tx_, {
    pos_id: params.pos.id,
    table_name: params.table.table_name
  })

  // Check if exist records to upload
  if (params.upld_id_max <= last_upld_srv_id) return

  // Select from source table
  const records_ = await pg_select.any(tx_, {
    columns: params.col_names,
    from_items: [params.repl_table_name],
    where: [
      `${REPL_COL_ID.col_name} > ${last_upld_srv_id}`,
    ],
    order_by: [REPL_COL_ID.col_name],
    limit,
  })

  // Extract table ident columns + ensure SITEGUID is in place
  const id_cols_ = params.table.ident_cols.match(/\w+/g)
  if (!id_cols_.includes(SITEGUID)) id_cols_.push(SITEGUID)

  let rows_
  let cd_
  let last_id_ = -1

  // Do Insert / Update / Delete -operations
  for await (const r_ of records_) {

    if (!r_[SITEGUID]) r_[SITEGUID] = params.pos.siteguid

    last_id_ = r_[REPL_COL_ID.col_name]

    switch (r_.r$_op) {

      case REPL_OP_INIT:
      case REPL_OP_NEW:

        cd_ = r_[REPL_COL_CREATE_DT.col_name]

        delete r_[REPL_COL_ID.col_name]
        delete r_[REPL_COL_OP.col_name]
        delete r_[REPL_COL_CREATE_DT.col_name]

        if (params.table.versions) {

          rows_ = await pg_insert_ver.one(tx_, {
            table_name: params.upld_table_name,
            record: r_,
            cur_date: cd_,
            id_cols: id_cols_,
            fd_col: VER_FD_COL,
            td_col: VER_TD_COL,
          })

        } else {
          rows_ = await pg_insert(tx_, params.upld_table_name, [r_])
        }

        if (rows_ !== 1) throw new Error(`Wrong number of records inserted (${rows_})!`)

        break

      case REPL_OP_UPDATE:

        rows_ = await pg_update(tx_, params.upld_table_name, {
          set: array.diff(Object.keys(r_), [...id_cols_, ...REPL_COLS]),
          where: id_cols_.map(c_ => [c_, "${".concat(c_, "}")].join(" = ")),
          ...r_,
        })

        if (rows_ !== 1) throw new Error(`Wrong number of records updated (${rows_})!`)

        break

      case REPL_OP_DELETE:

        rows_ = await pg_delete(tx_, params.upld_table_name, {
          where: id_cols_.map(c_ => [c_, "${".concat(c_, "}")].join(" = ")),
          ...r_,
        })

        if (rows_ !== 1) throw new Error(`Wrong number of records deleted (${rows_})!`)

        break

      default:
        break
    }
  }

  await update_on_upload(tx_, {
    last_upld_srv_id: last_id_,
    ctid,
  })

  // last uploaded ID
  return last_id_
})



module.exports = async (db, params) => db.task("upload", async ts_ => {

  // WHERE for POS
  const where_p_ = ["p.is_active IS TRUE"]
  if (params.points) {
    where_p_.push(`p.id in (${sjoin(params.points)})`)
  }
  const points_ = await pos.selectAll(ts_, { where: where_p_ })

  // Loop through fetched Points
  for await (const p_ of points_) {

    // WHERE for Tables
    // sep = ", ", fore = "", tail = "", dflt = ""
    const where_t_ = ["r.last_repl_up_id > coalesce(r.last_upld_srv_id, 0)"]
    if (params.tables) {
      where_t_.push(`r.table_name in (${sjoin(params.tables, { sep: "', '", fore: "'", tail: "'" })})`)
    }
    const tables_ = await select_by_pos_with_def(ts_, {
      pos_id: p_.id,
      where: where_t_,
    })

    // Loop through fetched Tables
    for await (const t_ of tables_) {

      // REPL UP table name
      const repl_tname_ = `${SRV_REPL_UP_TABLE_PFX}${p_.srv_table_pfx}_${t_.table_name}`
      // UPLOAD table name
      const upld_tname_ = `${SRV_UPLD_TABLE_PFX}${t_.table_name}${t_.versions ? VER_TABLE_SFX : ""}`

      // Last replicated ID
      let last_id_ = t_.last_upld_srv_id
      // Max record ID to be replicated
      const upld_id_max_ = (await pg_select.one(ts_, {
        columns: [`max(${REPL_COL_ID.col_name})`],
        from_items: [repl_tname_]
      })).max || -1

      // Table column names
      const col_names_ = dicarray.lv(await columns(ts_, repl_tname_), "col_name")

      // Upload through iterations
      while (upld_id_max_ > last_id_) {

        last_id_ = await __upload_table(db, {
          pos: p_,
          table: t_,
          upld_id_max: upld_id_max_,
          col_names: col_names_,
          repl_table_name: repl_tname_,
          upld_table_name: upld_tname_,
        })
      }
    }
  }
})
