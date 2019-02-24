INSERT INTO
  ffba_pos_repl_table
  (pos_id, table_name, repl_up_table_name, repl_down_table_name)
VALUES
  (${pos_id}, ${name}, ${repl_up_table_name}, ${repl_down_table_name})
RETURNING
  id
