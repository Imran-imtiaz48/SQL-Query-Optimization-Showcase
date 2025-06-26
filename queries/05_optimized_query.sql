-- Optimized: assumes indexes on inventory.product_id and products.reorder_level
SELECT p.id, p.name, i.stock, p.reorder_level
FROM products p
JOIN inventory i ON p.id = i.product_id
WHERE i.stock < p.reorder_level
ORDER BY i.stock ASC;
