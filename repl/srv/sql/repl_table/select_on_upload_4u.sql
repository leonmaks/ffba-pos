SELECT
  ctid,
  coalesce(last_upld_srv_id, -1) AS last_upld_srv_id
FROM
  ffba_pos_repl_table
WHERE
  pos_id = ${pos_id}
  AND table_name = ${table_name}
FOR UPDATE
