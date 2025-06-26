-- Optimized using LEFT JOIN and conditional aggregation
SELECT c.id, c.name,
       COUNT(CASE WHEN o.order_date >= '2024-01-01' THEN 1 END) AS orders_this_year,
       COUNT(CASE WHEN o.order_date < '2024-01-01' THEN 1 END) AS orders_previous
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE c.status = 'active'
GROUP BY c.id, c.name;
