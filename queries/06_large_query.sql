-- Donation summary by donor type and time
SELECT d.donor_type, YEAR(p.created_date) AS donation_year, SUM(p.total_amount) AS total_donated
FROM payment p
JOIN donors d ON p.donor_id = d.id
GROUP BY d.donor_type, YEAR(p.created_date);
