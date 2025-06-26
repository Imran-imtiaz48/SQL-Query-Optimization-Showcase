# 📌 SQL Query Writing Tips

1. **Avoid SELECT *** — Always select only the required columns.
2. **Use Proper Indexes** — Index frequently filtered/joined columns.
3. **Avoid Functions on Indexed Columns** — This kills index usage.
4. **Prefer EXISTS over IN** — Especially with subqueries.
5. **Use JOINs instead of Subqueries** — Where possible.
6. **Aggregate Smartly** — Don’t use GROUP BY on unnecessary columns.
7. **Filter Early** — Push filters close to the data source.
8. **Avoid Implicit Type Conversion** — Use consistent datatypes.
9. **Review Execution Plans** — Always validate performance.
10. **Use CTEs for Readability** — Common Table Expressions (WITH) help a lot.
