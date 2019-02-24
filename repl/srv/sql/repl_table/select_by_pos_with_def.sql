SELECT
  r.id,
  r.table_name,
  coalesce(r.last_repl_up_id, -1) AS last_repl_up_id,
  coalesce(r.last_repl_down_id, -1) AS last_repl_down_id,
  coalesce(r.last_upld_srv_id, -1) AS last_upld_srv_id,
  d.insert_order,
  d.ident_cols,
  r.repl_up_table_name,
  r.repl_down_table_name,
  d.versions
FROM
  ffba_pos_repl_table AS r
LEFT JOIN
  ffba_pos_table_def AS d
ON
  r.table_name = d.table_name
WHERE
  r.pos_id = ${pos_id}${where^}
ORDER BY
  d.insert_order
