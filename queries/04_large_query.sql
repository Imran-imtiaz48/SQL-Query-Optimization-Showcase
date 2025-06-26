-- Customer retention analysis using subqueries
SELECT c.id, c.name,
  (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.id AND o.order_date >= '2024-01-01') AS orders_this_year,
  (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.id AND o.order_date < '2024-01-01') AS orders_previous
FROM customers c
WHERE c.status = 'active';
