module.exports = async (db, params) => db.any(
  "SELECT * FROM ffba_cashreg_repl_table WHERE cashreg_id = ${pos_id}", params
)
