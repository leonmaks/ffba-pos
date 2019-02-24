"use strict"

const path = require("path")

const { stmt } = require("pg-utl")



module.exports = {

  insert_on_open: stmt(path.join(__dirname, "pos_session/insert_on_open.sql"), { minify: true }),
  update_on_close: stmt(path.join(__dirname, "pos_session/update_on_close.sql"), { minify: true }),
}
