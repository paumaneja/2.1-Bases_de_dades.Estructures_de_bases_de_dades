SELECT * FROM invoice i
JOIN customer c ON i.customer_id = c.id_customer
WHERE i.customer_id = 1 AND i.invoice_date BETWEEN '2023-01-01' AND '2024-12-15';