module.exports = async (db, params) => (
  db.none("INSERT INTO ffba_cashreg_repl_table (cashreg_id, table_name) VALUES (${pos_id}, ${table_name})", params)
)
