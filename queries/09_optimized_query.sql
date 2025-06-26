-- Optimized: this depends on pre-aggregated materialized views or separate indexed queries
-- Keep as separate queries in application logic or use WITH clauses for clarity
WITH
  customer_count AS (SELECT COUNT(*) AS cnt FROM customers),
  recent_orders AS (SELECT COUNT(*) AS cnt FROM orders WHERE order_date >= CURDATE() - INTERVAL 30 DAY),
  average_payment AS (SELECT AVG(total_amount) AS avg FROM payment),
  total_inventory AS (SELECT SUM(stock) AS total FROM inventory)
SELECT
  cc.cnt AS total_customers,
  ro.cnt AS orders_last_30_days,
  ap.avg AS avg_payment,
  ti.total AS total_stock
FROM customer_count cc, recent_orders ro, average_payment ap, total_inventory ti;
