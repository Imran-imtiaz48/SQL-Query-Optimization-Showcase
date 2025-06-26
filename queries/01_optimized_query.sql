-- Optimized version using indexed columns
-- Assume indexes: customers(status), orders(customer_id), order_items(order_id), products(id)

SELECT c.id, c.name, o.id AS order_id, o.order_date, p.name AS product, oi.quantity, p.price
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE c.status = 'active'
ORDER BY o.order_date DESC;
