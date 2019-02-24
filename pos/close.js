// close.js (pos) 190116_1800

"use strict"

const importLazy = require("import-lazy")(require)

const pos_session = importLazy("./dal/pos_session")



module.exports = async (db, params) => pos_session.end(db, params)
