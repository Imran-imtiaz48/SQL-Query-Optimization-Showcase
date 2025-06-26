-- Optimized using conditional aggregation and LEFT JOIN
SELECT u.id, u.username,
       COUNT(CASE WHEN l.login_date = CURDATE() THEN 1 END) AS today_logins,
       COUNT(CASE WHEN l.login_date >= CURDATE() - INTERVAL 7 DAY THEN 1 END) AS week_logins
FROM users u
LEFT JOIN logins l ON u.id = l.user_id
GROUP BY u.id, u.username;
