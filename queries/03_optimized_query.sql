-- Optimized with DATE_FORMAT, indexed order_date
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS order_month, p.name, SUM(oi.quantity) AS total_sold
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m'), p.name
ORDER BY total_sold DESC;
