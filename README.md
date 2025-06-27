# SQL Query Optimization Showcase

The project contains a collection of complex SQL queries followed by their optimized versions. It's intended to help database professionals understand performance bottlenecks and apply optimization techniques.

## 📁 Folder Structure
- `queries/`: Original and optimized SQL query pairs.
- `tips/sql_query_tips.md`: Best practices and tips for writing efficient SQL.
- `README.md`: Overview and instructions.

## 📋 About the Queries

1. **Query 01:**  
   Complex join to retrieve active customers’ orders along with product details.

2. **Query 02:**  
   Payroll calculation combining employee details, departments, bonuses, and salaries.

3. **Query 03:**  
   Monthly top-selling products report with aggregated sales quantities.

4. **Query 04:**  
   Customer retention analysis comparing orders made this year vs previous years.

5. **Query 05:**  
   Inventory restocking suggestions for products below reorder level.

6. **Query 06:**  
   Donation summary grouped by donor type and donation year.

7. **Query 07:**  
   Report of overdue invoices including days overdue and customer info.

8. **Query 08:**  
   Daily and weekly user login counts to monitor activity.

9. **Query 09:**  
   Aggregation of key KPIs such as total customers, recent orders, average payment, and total stock.
   
### 🛠️ Setup Sample Data

To test queries, first create tables and insert sample data by running:

```sql
source sample_data.sql;

## ⚡ Performance Benchmarks

| Query No. | Description                                   | Original Execution Time | Optimized Execution Time | Improvement (%) |
|-----------|-----------------------------------------------|-------------------------|--------------------------|-----------------|
| 01        | Customer orders with product details           | 1200 ms                 | 450 ms                   | 62.5%           |
| 02        | Payroll calculation with bonuses and salary   | 1500 ms                 | 600 ms                   | 60.0%           |
| 03        | Monthly top-selling products                    | 1000 ms                 | 350 ms                   | 65.0%           |
| 04        | Customer retention analysis                      | 1300 ms                 | 520 ms                   | 60.0%           |
| 05        | Inventory restocking suggestions                 | 900 ms                  | 400 ms                   | 55.5%           |
| 06        | Donation summary by donor and year               | 1100 ms                 | 430 ms                   | 60.9%           |
| 07        | Overdue invoice report with days overdue         | 1250 ms                 | 480 ms                   | 61.6%           |
| 08        | Daily and weekly user login counts                | 1000 ms                 | 370 ms                   | 63.0%           |
| 09        | Aggregation of key KPIs                            | 1400 ms                 | 520 ms                   | 62.8%           |

*Execution times are illustrative and may vary depending on data volume and environment.*

## 🔧 How to Access (Using Git Bash)

```bash
git clone https://github.com/yourusername/SQL-Query-Optimization-Showcase.git
cd SQL-Query-Optimization-Showcase
cat queries/01_large_query.sql
```

## ⚡ Performance Benchmarking

This project includes a SQL script `benchmark_queries.sql` to measure and record execution times of all queries.

### How to use:

1. Make sure your database is set up with the sample data (see `sample_data.sql`).
2. Open and review `benchmark_queries.sql`.
3. Replace the placeholder queries with your actual SQL queries if needed.
4. Run the script in your SQL Server environment.
5. View the results in the `QueryBenchmarkResults` table, which stores execution times for each query.

You can run this script for both original and optimized queries to compare performance improvements.

You can also open these files in any SQL IDE like DBeaver, SSMS, or DataGrip.

## 🎯 Use Cases

- Performance tuning practice  
- SQL portfolio for job interviews  
- Teaching and internal workshops  
- Learning query design patterns  
- Benchmarking and performance analysis

## 📌 Tips
See [sql_query_tips.md](tips/sql_query_tips.md) for useful query writing guidelines.

## 📬 Contributions
Feel free to fork, optimize more queries, or add examples!
