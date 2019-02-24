UPDATE
  ffba_pos_repl_table
SET
  last_repl_down_id = ${last_repl_down_id},
  last_repl_down_dt = now()
WHERE
  id = ${id}
