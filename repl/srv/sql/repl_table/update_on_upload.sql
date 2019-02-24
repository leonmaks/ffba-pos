UPDATE
  ffba_pos_repl_table
SET
  last_upld_srv_id = ${last_upld_srv_id},
  last_upld_srv_dt = now()
WHERE
  ctid = ${ctid}
