INSERT INTO
  ffba_pos_session
  (pos_id, begin_dt)
VALUES
  (${pos_id}, now())
RETURNING
  id
