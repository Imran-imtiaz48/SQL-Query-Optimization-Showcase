-- Top selling products per month
SELECT MONTH(o.order_date) AS order_month, p.name, SUM(oi.quantity) AS total_sold
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY MONTH(o.order_date), p.name
ORDER BY total_sold DESC;
