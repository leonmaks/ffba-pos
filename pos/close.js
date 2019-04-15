// close.js (pos) 190116_1800

"use strict"

const pos_session = require("./dal/pos_session")



module.exports = async (db, params) => pos_session.end(db, params)
