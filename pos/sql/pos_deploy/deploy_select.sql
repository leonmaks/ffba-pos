SELECT
  id,
  pos_id,
  package_id,
  path_id,
  status_id
FROM
  ffba_pos_deploy
WHERE
  pos_id = ${pos_id}
  AND status_id in (${status_id_array:csv})
ORDER BY
  id
