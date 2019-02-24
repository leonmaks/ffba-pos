SELECT
  d.pos_id,
  d.package_id,
  max(d.id) AS deploy_id
FROM
  ffba_pos_deploy d
WHERE
  d.pos_id = ${pos_id}
GROUP BY
  d.pos_id, d.package_id
ORDER BY
  deploy_id
