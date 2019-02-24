// pos_action.js (pos/dal) 190116_1800

/* eslint-disable no-restricted-syntax */

"use strict"

const importLazy = require("import-lazy")(require)

const {
  run_select,
  run_update,
  run_log_insert,
} = importLazy("../sql/pos_action")


const runSelect = async (db, params) => db.any(run_select, params)

const runUpdate = async (db, params) => db.none(run_update, params)

const runLogInsert = async (db, params) => {

  const params_ = {
    ...params,
    code: params.code || null,
    out: params.out || null,
    err: params.err || null,
  }

  return db.none(run_log_insert, params_)
}



module.exports = {
  runSelect,
  runUpdate,
  runLogInsert,
}
