SELECT
  l.path,
  l.content_actual AS content
FROM
  ffba_pos_deploy_log l
WHERE
  l.deploy_id = ${deploy_id}
  and l.status_id in (${status_id_array:csv})
ORDER BY
  id
