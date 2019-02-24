SELECT
  r.id,
  r.action_id,
  a.name,
  a.type_id,
  a.module,
  a.command,
  r.mode_id,
  r.status_id
FROM
  ffba_pos_action AS a,
  ffba_pos_action_run AS r
WHERE
  r.pos_id = ${pos_id}
  AND r.action_id = a.id
  AND r.status_id in (${status_id_array:csv})
