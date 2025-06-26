-- Optimized with indexed due_date and status columns
SELECT i.id, i.invoice_date, i.due_date, DATEDIFF(CURDATE(), i.due_date) AS days_overdue, c.name AS customer
FROM invoices i
JOIN customers c ON i.customer_id = c.id
WHERE i.status = 'unpaid' AND i.due_date < CURDATE()
ORDER BY days_overdue DESC;
