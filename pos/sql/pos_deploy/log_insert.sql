INSERT INTO
  ffba_pos_deploy_log
  (session_id, deploy_id, path_id, status_id, path, content_actual, error_text, event_dt)
VALUES
  (${session_id}, ${deploy_id}, ${path_id}, ${status_id}, ${path}, ${content}, ${error_text}, now())
