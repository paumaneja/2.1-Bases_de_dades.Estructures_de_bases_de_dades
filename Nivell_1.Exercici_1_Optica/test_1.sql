SELECT customer.name AS customer_name,
	COUNT(invoice.id_invoice) AS total_invoices
FROM invoice
JOIN customer ON invoice.customer_id = customer.id_customer
WHERE invoice.invoice_date BETWEEN '2023-01-01' AND '2024-12-15'
GROUP BY customer.id_customer;