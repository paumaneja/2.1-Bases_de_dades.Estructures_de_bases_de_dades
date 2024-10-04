SELECT 
    o.id_order,
    o.order_date,
    o.order_type,
    o.price,
    o.delivery_date,
    e.name AS employee_name,
    e.last_name AS employee_last_name,
    s.address AS store_address
FROM 
    `order` o
JOIN 
    employee e ON o.employee_id = e.id_employee
JOIN 
    store s ON o.store_id = s.id_store
WHERE 
    e.id_employee = 2;