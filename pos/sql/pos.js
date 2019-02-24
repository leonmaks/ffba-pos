"use strict"

const path = require("path")

const { stmt } = require("pg-utl")



module.exports = {

  select_all: stmt(path.join(__dirname, "pos/select_all.sql"), { minify: true }),
  select_by_ident: stmt(path.join(__dirname, "pos/select_by_ident.sql"), { minify: true }),
}
