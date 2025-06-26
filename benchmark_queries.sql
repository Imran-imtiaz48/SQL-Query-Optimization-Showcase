-- Drop existing benchmark table if exists
IF OBJECT_ID('dbo.QueryBenchmarkResults', 'U') IS NOT NULL
    DROP TABLE dbo.QueryBenchmarkResults;
GO

-- Create table to store execution times
CREATE TABLE dbo.QueryBenchmarkResults (
    QueryNumber INT PRIMARY KEY,
    Description NVARCHAR(255),
    ExecutionTimeMs INT,
    RunDate DATETIME DEFAULT GETDATE()
);
GO

-- Variables for timing
DECLARE @StartTime DATETIME2, @EndTime DATETIME2, @DurationMs INT;

-- Helper to clear previous results if re-running
TRUNCATE TABLE dbo.QueryBenchmarkResults;
GO

-- ===== QUERY 1 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 1 below
SELECT * FROM customers WHERE status = 'active';

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (1, 'Active customers query', @DurationMs);

-- ===== QUERY 2 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 2 below
SELECT e.name, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (2, 'Employee department join', @DurationMs);

-- ===== QUERY 3 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 3 below
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id;

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (3, 'Total products sold', @DurationMs);

-- ===== QUERY 4 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 4 below
SELECT c.id, COUNT(o.id) AS orders_last_year
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id AND o.order_date >= DATEADD(year, -1, GETDATE())
GROUP BY c.id;

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (4, 'Customer retention last year', @DurationMs);

-- ===== QUERY 5 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 5 below
SELECT p.id, p.name, i.stock
FROM products p
JOIN inventory i ON p.id = i.product_id
WHERE i.stock < p.reorder_level;

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (5, 'Inventory below reorder level', @DurationMs);

-- ===== QUERY 6 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 6 below
SELECT donor_id, SUM(total_amount) AS total_donations
FROM payment
GROUP BY donor_id;

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (6, 'Donation summary by donor', @DurationMs);

-- ===== QUERY 7 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 7 below
SELECT id, DATEDIFF(day, due_date, GETDATE()) AS days_overdue
FROM invoices
WHERE status = 'unpaid' AND due_date < GETDATE();

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (7, 'Overdue invoices', @DurationMs);

-- ===== QUERY 8 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 8 below
SELECT login_date, COUNT(*) AS login_count
FROM logins
GROUP BY login_date;

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (8, 'User logins per day', @DurationMs);

-- ===== QUERY 9 =====
SET @StartTime = SYSDATETIME();

-- Paste your original Query 9 below
SELECT 
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM orders WHERE order_date >= DATEADD(month, -1, GETDATE())) AS recent_orders,
    (SELECT AVG(total_amount) FROM payment) AS avg_payment,
    (SELECT SUM(stock) FROM inventory) AS total_stock;

SET @EndTime = SYSDATETIME();
SET @DurationMs = DATEDIFF(MILLISECOND, @StartTime, @EndTime);

INSERT INTO dbo.QueryBenchmarkResults VALUES (9, 'Key KPIs aggregation', @DurationMs);

-- Show all results
SELECT * FROM dbo.QueryBenchmarkResults ORDER BY QueryNumber;
