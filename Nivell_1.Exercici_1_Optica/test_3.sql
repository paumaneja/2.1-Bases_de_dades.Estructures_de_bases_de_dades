SELECT 
    s.name AS supplier_name,
    s.phone AS supplier_phone,
    s.NIF AS supplier_nif,
    COUNT(DISTINCT g.id_glass) AS total_glasses_sold,
    COUNT(i.id_invoice) AS total_sales
FROM 
    supplier s
JOIN 
    brand b ON s.id_supplier = b.supplier_id
JOIN 
    glass g ON b.id_brand = g.brand_id
JOIN 
    invoice i ON g.id_glass = i.glass_id
GROUP BY 
    s.id_supplier, s.name, s.phone, s.NIF
HAVING 
    total_sales > 0
ORDER BY 
    total_sales DESC;