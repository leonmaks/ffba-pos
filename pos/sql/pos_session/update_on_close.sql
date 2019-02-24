UPDATE
  ffba_pos_session
SET
  end_dt = now(),
  code = ${code},
  out = ${out},
  err = ${err}
WHERE
  id = ${id}
