INSERT INTO
    carts (cart_id, cart_color)
VALUES
    (1, '#FF0000'),
    (2, '#00FF00'),
    (3, '#0000FF'),
    (4, '#FFFF00'),
    (5, '#00FFFF'),
    (6, '#FF00FF'),
    (7, '#800080'),
    (8, '#FFA500'),
    (9, '#008000'),
    (10, '#808000'),
    (11, '#00FF7F'),
    (12, '#7FFFD4'),
    (13, '#FFC0CB'),
    (14, '#008080'),
    (15, '#ADD8E6'),
    (16, '#F0E68C'),
    (17, '#FA8072'),
    (18, '#800000'),
    (19, '#800080'),
    (20, '#4B0082'),
    (21, '#C71585'),
    (22, '#6B8E23'),
    (23, '#CD5C5C'),
    (24, '#2E8B57'),
    (25, '#FF6347'),
    (26, '#87CEEB'),
    (27, '#FFFFE0'),
    (28, '#FFB6C1'),
    (29, '#8B0000'),
    (30, '#9932CC');

INSERT INTO
    items (item_id, name, unit)
VALUES
    (1, 'Ron', 'ml'),
    (2, 'Azúcar', 'gr'),
    (3, 'Limón', 'unidades'),
    (4, 'Hierbabuena', 'ramas'),
    (5, 'Piña', 'gramos'),
    (6, 'Coco', 'unidades'),
    (7, 'Jugo de piña', 'ml'),
    (8, 'Tequila', 'ml'),
    (9, 'Triple sec', 'ml'),
    (10, 'Lima', 'unidades'),
    (11, 'Cerveza', 'ml'),
    (12, 'Levadura', 'gr'),
    (13, 'Malta', 'gr'),
    (14, 'Agua', 'ml'),
    (15, 'Lúpulo', 'gr'),
    (16, 'Cebada', 'gr'),
    (17, 'Vainilla', 'ml'),
    (18, 'Leche', 'ml'),
    (19, 'Crema', 'ml'),
    (20, 'Chocolate', 'gr'),
    (21, 'Café', 'ml'),
    (22, 'Hielo', 'cubos'),
    (23, 'Zumo de naranja', 'ml'),
    (24, 'Granadina', 'ml'),
    (25, 'Cranberry juice', 'ml'),
    (26, 'Menta', 'ramas'),
    (27, 'Ginebra', 'ml'),
    (28, 'Coca-Cola', 'ml'),
    (29, 'Pepsi', 'ml'),
    (30, 'Fanta', 'ml'),
    (31, 'Sprite', 'ml'),
    (32, 'Ron Zacapa 23', 'ml'),
    (33, 'Whiskey Jack Daniels', 'ml'),
    (34, 'Mango', 'gramos'),
    (35, 'Fresas', 'gramos');

INSERT INTO
    products (product_id, description, price)
VALUES
    (1, 'Mojito', 2500),
    (2, 'Piña colada', 3000),
    (3, 'Margarita', 2700),
    (4, 'Daikiri', 2600),
    (5, 'Cosmopolitan', 3200),
    (6, 'Sangría', 2800),
    (7, 'Mimosa', 2700),
    (8, 'Tequila Sunrise', 2900),
    (9, 'Sex on the Beach', 3100),
    (10, 'Mango', 1700),
    (11, 'Fresa', 1800),
    (12, 'Vainilla', 1900),
    (13, 'Chocolate', 2000),
    (14, 'Café', 2100),
    (15, 'Ron Zacapa 23', 8000),
    (16, 'Whiskey Jack Daniels', 6500),
    (17, 'Cerveza Imperial', 1000),
    (18, 'Cerveza Heineken', 1200),
    (19, 'Vodka Smirnoff', 2200),
    (20, 'Ginebra Beefeater', 2800),
    (21, 'Coca-Cola', 1000),
    (22, 'Pepsi', 1000),
    (23, 'Fanta', 1000),
    (24, 'Sprite', 1000),
    (25, 'Té frío', 800);

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (1, 1, 1, 50),
    (2, 1, 2, 20),
    (3, 1, 3, 1),
    (4, 1, 4, 1),
    (5, 1, 22, 5);
-- El mojito lleva 50 ml de ron, 20 gramos de azúcar, 1 unidad de limón, 1 rama de hierbabuena y 5 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (6, 2, 1, 50),
    (7, 2, 2, 20),
    (8, 2, 5, 100),
    (9, 2, 6, 1),
    (10, 2, 7, 50),
    (11, 2, 22, 5);
-- La piña colada lleva 50 ml de ron, 20 gramos de azúcar, 100 gramos de piña, 1 unidad de coco, 50 ml de jugo de piña y 5 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (12, 3, 1, 50),
    (13, 3, 2, 20),
    (14, 3, 9, 25),
    (15, 3, 3, 1),
    (16, 3, 10, 1),
    (17, 3, 22, 5);
-- La margarita lleva 50 ml de tequila, 20 gramos de azúcar, 25 ml de triple sec, 1 unidad de lima, 1 unidad de sal y 5 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (18, 4, 1, 50),
    (19, 4, 2, 20),
    (20, 4, 3, 1),
    (21, 4, 10, 1),
    (22, 4, 22, 5);
-- El daiquiri lleva 50 ml de ron, 20 gramos de azúcar, 1 unidad de lima, 1 unidad de hielo y 5 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (23, 5, 1, 50),
    (24, 5, 2, 20),
    (25, 5, 11, 100),
    (26, 5, 25, 50),
    (27, 5, 3, 1),
    (28, 5, 21, 25),
    (29, 5, 22, 5);
-- El cosmopolitan lleva 50 ml de vodka, 20 gramos de azúcar, 100 ml de jugo de arándanos, 50 ml de jugo de arándanos, 1 unidad de lima, 25 ml de jugo de limón y 5 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (30, 6, 5, 100),
    (31, 6, 4, 2),
    (32, 6, 7, 100),
    (33, 6, 1, 25),
    (34, 6, 22, 3);
-- La Sangría lleva 100 gramos de piña, 2 ramas de hierbabuena, 100 ml de jugo de piña, 25 ml de Ron y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (35, 7, 21, 50),
    (36, 7, 28, 200),
    (37, 7, 22, 3),
    (38, 7, 3, 1);
-- La Mimosa lleva 50 ml de jugo de naranja, 200 ml de Coca-Cola, 3 cubos de hielo y 1 limón.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (39, 8, 8, 50),
    (40, 8, 23, 100),
    (41, 8, 24, 15),
    (42, 8, 31, 200),
    (43, 8, 3, 1),
    (44, 8, 22, 3);
-- El Tequila Sunrise lleva 50 ml de tequila, 100 ml de zumo de naranja, 15 ml de granadina, 200 ml de Sprite, 1 limón y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (45, 9, 8, 50),
    (46, 9, 25, 100),
    (47, 9, 29, 200),
    (48, 9, 24, 15),
    (49, 9, 3, 1),
    (50, 9, 22, 3);
-- El Sex on the Beach lleva 50 ml de tequila, 100 ml de cranberry juice, 200 ml de Pepsi, 15 ml de granadina, 1 limón y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (51, 10, 34, 50),
    (52, 10, 1, 50),
    (53, 10, 2, 25),
    (54, 10, 22, 3);
-- El Mango lleva 50 gramos de mango, 50 ml de Ron, 25 gramos de azúcar y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (55, 11, 35, 50),
    (56, 11, 1, 50),
    (57, 11, 2, 25),
    (58, 11, 22, 3);
-- El Fresa lleva 50 gramos de fresas, 50 ml de Ron, 25 gramos de azúcar y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (59, 12, 18, 150),
    (60, 12, 12, 10),
    (61, 12, 13, 50),
    (62, 12, 14, 1000),
    (63, 12, 16, 150),
    (64, 12, 15, 10),
    (65, 12, 22, 3);
-- La Vainilla lleva 150 ml de leche, 10 gramos de levadura, 50 gramos de malta, 1000 ml de agua, 150 gramos de cebada, 10 gramos de lúpulo y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (66, 13, 18, 150),
    (67, 13, 14, 200),
    (68, 13, 19, 50),
    (69, 13, 20, 50),
    (70, 13, 22, 3);
-- El Chocolate lleva 150 ml de leche, 200 gramos de chocolate, 50 ml de vodka, 50 ml de ginebra y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (71, 14, 21, 30),
    (72, 14, 14, 200),
    (73, 14, 18, 50),
    (74, 14, 22, 3);
-- El Café lleva 30 ml de café, 200 gramos de chocolate, 50 ml de leche y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (75, 15, 32, 45),
    (76, 15, 22, 3);
-- El Ron Zacapa 23 se sirve con 45 ml de Ron y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (77, 16, 33, 45),
    (78, 16, 22, 3);
-- El Whiskey Jack Daniels se sirve con 45 ml de whiskey y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (79, 17, 11, 355);
-- La cerveza Imperial se sirve en un envase de 355 ml.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (80, 18, 11, 355);
-- La cerveza Heineken se sirve en un envase de 355 ml.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (81, 19, 17, 50),
    (82, 19, 29, 200),
    (83, 19, 22, 3);
-- El Vodka Smirnoff se sirve con 50 ml de vainilla, 200 ml de Pepsi y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (84, 20, 27, 45),
    (85, 20, 28, 200),
    (86, 20, 31, 30),
    (87, 20, 22, 3);
-- La Ginebra Beefeater se sirve con 45 ml de ginebra, 200 ml de Coca-Cola, 30 ml de Sprite y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (88, 21, 28, 200),
    (89, 21, 22, 3);
-- La Coca-Cola lleva 200 ml de Coca-Cola y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (90, 22, 29, 200),
    (91, 22, 22, 3);
-- La Pepsi lleva 200 ml de Pepsi y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (92, 23, 30, 200),
    (93, 23, 22, 3);
-- La Fanta lleva 200 ml de Fanta y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (94, 24, 31, 200),
    (95, 24, 22, 3);
-- La Sprite lleva 200 ml de Sprite y 3 cubos de hielo.

INSERT INTO
    items_x_products (item_x_product_id, product_id, item_id, amount)
VALUES
    (96, 25, 14, 400),
    (97, 25, 22, 5);
-- El Te Frío lleva 400 ml de té frío, 5 cubos de hielo.

-- Para la tabla las locaciones:

INSERT INTO locations (location_name, coordinate, deleted) VALUES
    ('Playa Conchal', POINT(10.3779, -85.8212), 0),
    ('Playa Flamingo', POINT(10.4398, -85.7835), 0),
    ('Playa Tamarindo', POINT(10.2996, -85.8394), 0),
    ('Playa Jacó', POINT(9.6170, -84.6286), 0),
    ('Playa Montezuma', POINT(9.6492, -85.0669), 0),
    ('Playa Santa Teresa', POINT(9.6509, -85.1682), 0),
    ('Playa Bonita', POINT(9.9565, -83.0294), 0),
    ('Playa Negra', POINT(10.5695, -83.5153), 0),
    ('Playa Cahuita', POINT(9.7429, -82.8507), 0);

INSERT INTO file_types (file_type_id, file_format) 
VALUES (1, '.txt'),
    (2, '.doc'),
    (3, '.docx'),
    (4, '.pdf'),
    (5, '.rtf'),
    (6, '.csv'),
    (7, '.xml'),
    (8, '.json'),
    (9, '.xls'),
    (10, '.xlsx'),
    (11, '.mp3'),
    (12, '.wav'),
    (13, '.aac'),
    (14, '.flac'),
    (15, '.mp4'),
    (16, '.avi'),
    (17, '.mov'),
    (18, '.wmv'),
    (19, '.obj'),
    (20, '.stl'),
    (21, '.dae'),
    (22, '.jpg'),
    (23, '.png'),
    (24, '.gif'),
    (25, '.bmp'),
    (26, '.svg'),
    (27, '.eps'),
    (28, '.ai');

-- Para los inserts de files:

INSERT INTO files (source, deleted, file_type_id) VALUES
('https://www.govisitcostarica.co.cr/images/photos/mob-shells-on-beach-playa-conchal.jpg', 0, 22),
('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/31/26/b2/entire-flamingo-beach.jpg?w=700&h=-1&s=1', 0, 22),
('https://upload.wikimedia.org/wikipedia/commons/c/cc/Costa_Rica_Playa_Tamarindo_and_Rivermouth_2007_Aerial_Photograph_Tamarindowiki_01.JPG', 0, 22),
('https://images.visitarcostarica.com/playa-jaco-costa-rica.jpg', 0, 22),
('https://goplaya.cr/archivos/MONTEZUMAGOPLAYA.JPG', 0, 22),
('https://goplaya.cr/blog/wp-content/uploads/2020/10/santateresa12-1024x576.jpg', 0, 22),
('https://img2.10bestmedia.com/Images/Photos/218959/p-limonbeach_55_660x440_201405311241.jpg', 0, 22),
('https://www.puertoviejosatellite.com/albums/dougdo_playa_negra.jpg', 0, 22),
('https://www.creescapes.com/wp-content/uploads/beach-cahuita-costa-rica.jpg', 0, 22);

-- Para los archivos de cada playa:

INSERT INTO files_x_locations (location_id, file_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9);

INSERT INTO location_taxes (location_id, location_tax)
VALUES
(1, 0.05), -- el porcentaje de impuestos para Playa Conchal podría ser del 5%
(2, 0.03), -- el porcentaje de impuestos para Playa Flamingo podría ser del 3%
(3, 0.07), -- el porcentaje de impuestos para Playa Tamarindo podría ser del 7%
(4, 0.02), -- el porcentaje de impuestos para Playa Jacó podría ser del 2%
(5, 0.04), -- el porcentaje de impuestos para Playa Montezuma podría ser del 4%
(6, 0.06), -- el porcentaje de impuestos para Playa Santa Teresa podría ser del 6%
(7, 0.01), -- el porcentaje de impuestos para Playa Bonita podría ser del 1%
(8, 0.08), -- el porcentaje de impuestos para Playa Negra podría ser del 8%
(9, 0.03); -- el porcentaje de impuestos para Playa Cahuita podría ser del 3%
