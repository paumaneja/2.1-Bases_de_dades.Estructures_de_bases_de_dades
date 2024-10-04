SELECT 
    g.id_glass,
    g.frame AS frame_type,
    g.frame_color AS frame_color,
    g.left_glass_prescription,
    g.right_glass_prescription,
    g.price AS glass_price,
    g.left_glass_color,
    g.right_glass_color,
    b.name AS brand_name,
    e.name AS employee_name
FROM 
    invoice i
JOIN 
    employee e ON i.employee_id = e.id_employee
JOIN 
    glass g ON i.glass_id = g.id_glass
JOIN 
    brand b ON g.brand_id = b.id_brand
WHERE 
    e.id_employee = 1
AND 
    YEAR(i.invoice_date) = 2024;