-- Daily and weekly user login counts
SELECT u.id, u.username,
  (SELECT COUNT(*) FROM logins l WHERE l.user_id = u.id AND l.login_date = CURDATE()) AS today_logins,
  (SELECT COUNT(*) FROM logins l WHERE l.user_id = u.id AND l.login_date >= CURDATE() - INTERVAL 7 DAY) AS week_logins
FROM users u;
