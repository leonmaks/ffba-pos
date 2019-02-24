// open.js (pos) 190116_1800

"use strict"

const importLazy = require("import-lazy")(require)

const pos = importLazy("./dal/pos")
const pos_session = importLazy("./dal/pos_session")



module.exports = async (db, ident) => db.tx("pos.open", async tx => {

  // Get POS information from server DB
  const pos_ = await pos.selectByIdent(tx, { ident })

  if (!pos_.is_active) {
    console.log("pos.open: POS record is NOT active")
    return null
  }

  // Update POS info on Open
  // await pos.updateOnOpen(tx, pos_)

  // Begin session
  pos_.session = await pos_session.begin(tx, { pos_id: pos_.id })

  return pos_
})
