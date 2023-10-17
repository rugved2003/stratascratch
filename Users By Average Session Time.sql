select user_id, AVG(TIMESTAMPDIFF(second, load_time,exit_time)) AS session_time
FROM (
SELECT DATE(timestamp), user_id, 
  MAX(IF(action = 'page_load', timestamp, NULL))as load_time,
  MIN(IF(action = 'page_exit',timestamp, NULL)) as exit_time 
  FROM facebook_web_log GROUP BY 1, 2) t 
  GROUP BY user_id 
  HAVING session_time IS NOT NULL
