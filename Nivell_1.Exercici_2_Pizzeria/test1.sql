SELECT 
    p.name AS product_name,
    p.price AS product_price,
    od.quantity,
    o.order_date,
    c.name AS city_name
FROM 
    order_detail od
JOIN 
    `order` o ON od.order_id = o.id_order
JOIN 
    product p ON od.product_id = p.id_product
JOIN 
    store s ON o.store_id = s.id_store
JOIN 
    city c ON s.city_id = c.id_city
WHERE 
    p.product_type = 'drink'
AND 
    c.name = 'Barcelona';