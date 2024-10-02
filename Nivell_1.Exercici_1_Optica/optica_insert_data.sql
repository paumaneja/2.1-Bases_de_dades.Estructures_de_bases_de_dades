INSERT INTO address (street, num, floor, door, city, postal_code, country) VALUES
('Carrer A', 12, 2, 1, 'Barcelona', '08001', 'Spain'),
('Carrer B', 14, 3, 3, 'Badalona', '08002', 'Spain'),
('Carrer C', 15, 4, 1, 'Cornellà', '08003', 'Spain'),
('Carrer D', 16, 5, 3, 'Barcelona', '08004', 'Spain'),
('Carrer E', 17, 6, 2, 'El Prat', '08005', 'Spain'),
('Carrer F', 18, 6, 2, 'Barcelona', '08006', 'Spain'),
('Carrer G', 19, 5, 1, 'Cornellà', '08007', 'Spain'),
('Carrer H', 20, 4, 4, 'El Prat', '08007', 'Spain'),
('Carrer I', 21, 3, 4, 'Barcelona', '08007', 'Spain'),
('Carrer J', 22, 2, 6, 'El Prat', '08008', 'Spain');

INSERT INTO supplier (name, phone, fax, NIF, address_supplier_id) VALUES
('Distribucion Gafera', '666543212', '111221122', '49453423N', 7),
('Gafas Mundo', '666117788', '111221122', '49453323F', 8),
('Vamos a ver', '666664532', '111221122', '34453423X', 9),
('Pa tus ojos', '666596755', '111221122', '67458723X', 10);


INSERT INTO glass (brand, left_glass_prescription, right_glass_prescription, frame, frame_color, left_glass_color, right_glass_color, price, supplier_id) VALUES
('Oakley', 1.25, 1.25, 'floating', 'black', 'grey', 'grey', 100.2, 1),
('Oakley', 1.50, 1.25, 'pasta', 'black', 'grey', 'grey', 89.9, 1),
('Arnette', 0.30, 0.40, 'floating', 'white', 'blue', 'blue', 99.9, 2),
('Gucci', 0.80, 0.88, 'metallic', 'grey', 'red', 'red', 50.5, 3),
('Ray-Ban', 1.00, 1.25, 'pasta', 'brown', 'blue', 'blue', 159.9, 4),
('Oakley', 1.24, 0.25, 'pasta', 'black', 'red', 'red', 110.0, 1);


INSERT INTO customer (name, phone, email, register_date, address_customer_id, recomendator_customer_id) VALUES
('Carlos', '666778899', 'carlos@mail.com', '2024-04-12', 1, NULL),
('Pepe', '666112233', 'pepe@mail.com', '2024-05-14', 2, NULL),
('Daniel', '666223344', 'daniel@mail.com', '2024-05-14', 3, NULL),
('Victor', '999778899', 'victor@mail.com', '2024-06-22', 1, 1),
('Daniela', '666558899', 'daniela@mail.com', '2024-07-12', 4, 1),
('Maria', '999778899', 'maria@mail.com', '2024-08-09', 5, 2),
('Raquel', '666778888', 'raquel@mail.com', '2024-09-12', 6, 3);


INSERT INTO employee (name, phone, email) VALUES
('Fran', '666558822', 'fran@optica.com'),
('Yuyi', '666334422', 'yuyi@optica.com'),
('Mortadelo', '666448822', 'mortadelo@optica.com'),
('Filemon', '666552211', 'filemon@optica.com');


INSERT INTO invoice (invoice_date, customer_id, employee_id, glass_id) VALUES
('2024-09-25', 1, 1, 1),
('2024-09-24', 1, 2, 2),
('2024-08-12', 2, 2, 4),
('2024-06-22', 4, 1, 3),
('2024-09-25', 3, 3, 5),
('2024-09-25', 5, 3, 6);