UPDATE
  ffba_pos_deploy
SET
  status_id = ${status_id}
WHERE
  id in (${id:csv})
