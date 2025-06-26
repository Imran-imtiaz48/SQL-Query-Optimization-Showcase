-- Aggregation of key KPIs
SELECT 
  (SELECT COUNT(*) FROM customers) AS total_customers,
  (SELECT COUNT(*) FROM orders WHERE order_date >= CURDATE() - INTERVAL 30 DAY) AS orders_last_30_days,
  (SELECT AVG(total_amount) FROM payment) AS avg_payment,
  (SELECT SUM(stock) FROM inventory) AS total_stock
FROM dual;
