// pos_session.js (pos/dal) 190116_1800

"use strict"

const { pos_session } = require("../sql/pos_session")


const begin = async (db, params) => db.one(pos_session.insert_on_open, params)

const end = async (db, params) => db.none(pos_session.update_on_close, {
  ...params,
  code: params.code || null,
  out: params.out || null,
  err: params.err || null,
})



module.exports = {
  begin,
  end,
}
