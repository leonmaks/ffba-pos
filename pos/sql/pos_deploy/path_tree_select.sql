SELECT
  t.id,
  t.up_id,
  t.package_id,
  t.dir_last,
  t.dir_full,
  t.file,
  t.type_id,
  t.content,
  t.depth,
  t.dir_id
FROM
  v$_pos_path_tree t
WHERE
  t.package_id = ${package_id}
ORDER BY
  t.package_id,
  t.depth,
  t.dir_id
