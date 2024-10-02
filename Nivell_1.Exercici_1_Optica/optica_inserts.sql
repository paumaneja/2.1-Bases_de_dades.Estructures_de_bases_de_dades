-- Insert addresses
INSERT INTO addresses (street, num, floor, door, city, postal_code, country) VALUES
('Carrer Major', 12, 3, 1, 'Barcelona', '08001', 'Spain'),
('Carrer Menor', 2, 1, 4, 'Barcelona', '08005', 'Spain'),
('Carrer Muntaner', 300, 3, 1, 'Barcelona', '08007', 'Spain'),
('Carrer Badalona', 30, 1, 1, 'Badalona', '08023', 'Spain'),
('Avinguda Diagonal', 45, 2, 2, 'Barcelona', '08019', 'Spain');

-- Insert suppliers
INSERT INTO suppliers (name, phone, fax, nif, address_id) VALUES
('Optical Supplies', '123456789', '987654321', 'A12345678', 1),
('Repartimos Gafas', '123455555', '987655555', 'A12345555', 4),
('Lenses Unlimited', '987654321', '123456789', 'B23456789', 2);

-- Insert customers
INSERT INTO customers (name, phone, email, register_date, recommended_by, address_id) VALUES
('Carlos Pérez', '111222333', 'carlos.perez@example.com', '2023-05-10', NULL, 1),
('David Dende', '111225555', 'carlos.perez1@example.com', '2023-06-12', 1, 1),
('Ricardo Carde', '111222666', 'carlos.perez2@example.com', '2023-02-11', 1, 1),
('Carles Pollastre', '111222777', 'carlos.perez3@example.com', '2024-10-10', 2, 1),
('Maria López', '444555888', 'maria.lopez4@example.com', '2024-02-01', 3, 2);

-- Insert employees
INSERT INTO employees (name, phone, email) VALUES
('Ana García', '123123123', 'ana.garcia@example.com'),
('Sonia García', '123123222', 'ana.garcia1@example.com'),
('Raquel Figueroa', '123123333', 'ana.garcia2@example.com'),
('Carles Clavero', '123123444', 'ana.garcia3@example.com'),
('David Martínez', '321321555', 'david.martinez@example.com');

-- Insert glasses
INSERT INTO glasses (brand, left_glass_prescription, right_glass_prescription, frame, frame_color, left_glass_color, right_glass_color, price, supplier_id) VALUES
('Ray-Ban', 1.50, 1.25, 'metallic', 'white', 'blue', 'blue', 150.00, 1),
('Arnette', 0.50, 0.25, 'metallic', 'black', 'red', 'red', 150.00, 1),
('Gucci', 1.25, 1.25, 'floating', 'brown', 'blue', 'blue', 150.00, 1),
('Polaroid', 1.50, 0.25, 'pasta', 'yellow', 'red', 'red', 150.00, 1),
('Oakley', 2.00, 2.00, 'pasta', 'white', 'grey', 'grey', 200.00, 2);

-- Insert invoices
INSERT INTO invoices (sale_date, glass_id, customer_id, employee_id) VALUES
('2023-07-20', 1, 1, 1),
('2024-07-22', 2, 3, 2),
('2023-06-25', 3, 2, 5),
('2023-11-23', 4, 1, 1),
('2024-07-12', 5, 2, 3),
('2024-10-20', 6, 3, 2),
('2023-08-05', 7, 2, 2);