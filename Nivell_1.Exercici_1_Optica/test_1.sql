SELECT 
    i.id_invoice,
    i.invoice_date,
    g.price AS glass_price,
    c.name AS customer_name,
    e.name AS employee_name
FROM 
    invoice i
JOIN 
    customer c ON i.customer_id = c.id_customer
JOIN 
    glass g ON i.glass_id = g.id_glass
JOIN 
    employee e ON i.employee_id = e.id_employee
WHERE 
    c.id_customer = 1
AND 
    i.invoice_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY 
    i.id_invoice;