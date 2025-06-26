-- Optimized: replace YEAR() with DATE_FORMAT if needed, and indexed date fields
SELECT d.donor_type, DATE_FORMAT(p.created_date, '%Y') AS donation_year, SUM(p.total_amount) AS total_donated
FROM payment p
JOIN donors d ON p.donor_id = d.id
GROUP BY d.donor_type, DATE_FORMAT(p.created_date, '%Y');
