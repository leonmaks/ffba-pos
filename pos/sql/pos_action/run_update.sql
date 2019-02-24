UPDATE
  ffba_pos_action_run
SET
  status_id = ${status_id},
  exec_dt = now()
WHERE
  id = ${id}
