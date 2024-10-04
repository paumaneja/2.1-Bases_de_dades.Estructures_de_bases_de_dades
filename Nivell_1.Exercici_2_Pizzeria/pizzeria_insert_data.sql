INSERT INTO province (name) VALUES
('Barcelona'),
('Girona'),
('Tarragona'),
('LLeida'),
('Teruel'),
('Zaragoza'),
('Huesca');

INSERT INTO city (name, province_id) VALUES
('Barcelona', 1),
('Palamós', 2),
('Cornellà', 1),
('Tortosa', 3),
('Alcañiz', 5),
('Jaca', 7),
('Teruel', 5);

INSERT INTO pizza_category (name) VALUES
('Veggy'),
('Celiac'),
('Gourmet'),
('Normal');

INSERT INTO product (product_type, name, description, image, price, pizza_category_id) VALUES
('Pizza', 'Margarita', 'Tomate y mozzarella', 'ruta1', 9.99, 1),
('Pizza', 'Carnivora', 'Pizza con mucha carne', 'ruta2', 14.99, 3),
('Pizza', 'Peperoni', 'Peperoni y cebolla', 'ruta3', 12.99, 4),
('Pizza', 'Mediterranea', 'Muchas verduritas', 'ruta4', 11.99, 1),
('Pizza', 'Marinera', 'Atun, cebolla y anchoas', 'ruta5', 15.99, 4),
('Pizza', 'Margarita', 'Tomate y mozzarella con masa apta para celiacos', 'ruta6', 14.99, 2),
('Pizza', 'Peperoni', 'Peperoni y cebolla con masa apta para celiacos', 'ruta7', 12.99, 2),
('Burguer', 'Hamburguesa completa', 'Hamburguesa con patatas fritas', 'ruta8', 12.99, NULL),
('Burguer', 'Hamburguesa mexicana', 'Hamburguesa con jalapeños y con patatas fritas', 'ruta9', 15.99, NULL),
('Burguer', 'Hamburguesa kobe', 'Hamburguesa con carne de kobe y con patatas fritas', 'ruta10', 14.99, NULL),
('Burguer', 'Hamburguesa en plato', 'Hamburguesa sin pan y con patatas fritas', 'ruta11', 11.99, NULL),
('Drink', 'Coke', 'Fresh Coke', 'ruta9', 2.99, NULL),
('Drink', 'Beer', 'Fresh beer', 'ruta9', 3.99, NULL),
('Drink', 'Water', 'Water buena', 'ruta9', 1.99, NULL),
('Drink', 'Whisky', 'Cubata', 'ruta9', 6.99, NULL);

INSERT INTO customer (name, last_name, address, postal_code, phone, city_id) VALUES
('David', 'Guerra', 'C/ Abba, 23 3º 2ª', '08021', '666778899', 1),
('Raquel', 'Sanchez', 'C/ Mayor, 1 1º 2ª', '08023', '666778888', 2),
('Sofia', 'Jojo', 'C/ Carrasco, 3 3º 1ª', '08001', '666778877', 1),
('Ricardo', 'Cardel', 'C/ Aragon, 234 1º 1ª', '08001', '666777777', 1),
('Carlos', 'Fresco', 'C/ Muntaner, 212 4º 3ª', '08012', '666779955', 4),
('Pedro', 'Fernandez', 'C/ Gracia, 23 3º 2ª', '08022', '666223344', 5);

INSERT INTO store (address, postal_code, city_id) VALUES
('C/ Mitre, 21', '08021', 1),
('C/ Muntaner, 134', '08009', 2),
('C/ Aragon, 12', '08001', 3),
('C/ Rubio, 177', '08001', 1),
('C/ Francesc Macià, 13', '08024', 5),
('C/ Valencia, 33', '08013', 3),
('C/ Monistrol, 10', '08022', 4);

INSERT INTO employee (name, last_name, NIF, phone, employee_type, store_id) VALUES
('David', 'Sancho', '12345678M', '666778899', 'chef', 1),
('David', 'Gracia', '22345678M', '663458899', 'dealer', 1),
('Ricardo', 'Vidal', '33345678M', '664778899', 'dealer', 1),
('Javier', 'Fresa', '44345678M', '666735899', 'chef', 2),
('Victor', 'Santol', '55345678M', '666776899', 'dealer', 2),
('Pau', 'Torres', '12345558M', '666348899', 'dealer', 2),
('Marc', 'Huesca', '12348878M', '656778899', 'dealer', 3);

INSERT INTO pizzeria.order (order_date, order_type, price, employee_id, store_id, customer_id, delivery_date) VALUES
('2024-10-01 20:30:00', 'delivery', 33.45, 2, 1, 1, '2024-10-01 21:30:00'),
('2024-10-01 20:32:00', 'onsite', 22.45, NULL, 1, 1, NULL),
('2024-10-02 20:45:00', 'delivery', 34.66, 6, 2, 6, '2024-10-02 21:21:00'),
('2024-10-02 20:46:00', 'delivery', 33.66, 5, 2, 2, '2024-10-02 21:45:00'),
('2024-10-02 20:22:00', 'onsite', 45.45, NULL, 1, 1, NULL),
('2024-10-02 20:56:00', 'onsite', 12.99, NULL, 1, 1, NULL),
('2024-10-03 20:23:00', 'delivery', 22.23, 2, 1, 3, '2024-10-03 21:05:00'),
('2024-10-03 21:21:00', 'delivery', 55.45, 2, 1, 4, '2024-10-03 22:00:00'),
('2024-10-03 20:34:00', 'delivery', 45.45, 7, 3, 3, '2024-10-03 22:33:00'),
('2024-10-03 20:33:00', 'onsite', 54.45, NULL, 1, 1, NULL),
('2024-10-04 20:00:00', 'delivery', 77.45, 2, 1, 1, '2024-10-04 21:30:00'),
('2024-10-04 20:40:00', 'delivery', 23.45, 3, 1, 3, '2024-10-04 21:40:00'),
('2024-10-04 20:56:00', 'delivery', 34.45, 3, 1, 4, '2024-10-04 21:59:00');

INSERT INTO order_detail (quantity, order_id, product_id) VALUES
(2, 1, 1),
(3, 1, 6),
(1, 1, 5),
(1, 2, 1),
(1, 2, 7),
(2, 3, 2),
(1, 3, 5),
(4, 4, 9),
(4, 4, 12),
(1, 4, 13),
(1, 5, 4),
(1, 5, 15),
(3, 5, 14);