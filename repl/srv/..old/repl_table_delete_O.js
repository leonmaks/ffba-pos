module.exports = async (db, params) => (
  db.none("DELETE FROM ffba_cashreg_repl_table r WHERE r.id = ${id}", params)
)
