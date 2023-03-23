-- INSERTAR CARRITOS
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

-- INSERTAR ITEMS
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

-- INSERTAR PRODUCTOS
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

-- INSERTAR RECETAS
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

-- INSERTAR LOCACIONES
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

-- INSERTAR TIPOS DE ARCHIVOS
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

-- INSERTAR ARCHIVOS
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

-- INSERTAR RELACIÓN ENTRE LOCACIONES Y ARCHIVOS
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

-- LLAMAR AL STORED PROCEDURE QUE GENERA EL HISTORIAL DE PRECIOS
DELIMITER $$
CREATE PROCEDURE generate_price_logs()
BEGIN
  DECLARE product_ids INT DEFAULT 1;
  DECLARE num_products INT DEFAULT 25;
  DECLARE start_date DATE DEFAULT NOW();
  DECLARE end_date DATE DEFAULT DATE_ADD(NOW(), INTERVAL 6 MONTH);
  DECLARE price DECIMAL(5, 0);
  DECLARE prev_price DECIMAL(5, 0);
  DECLARE day_of_week INT;
  DECLARE current_price DECIMAL(5, 0);
  DECLARE product_price_log_id INT;

  WHILE product_ids <= num_products DO
    SELECT p.price INTO current_price
    FROM products p
    WHERE p.product_id = product_ids;
    SET price = current_price;
    -- obtener el último registro para el producto actual
    SELECT IFNULL(MAX(current_price), current_price) INTO prev_price
    FROM product_prices_logs
    WHERE product_id = product_ids
    ORDER BY price_change_log_date DESC
    LIMIT 1;
    -- obtener el próximo product_price_log_id
    SELECT IFNULL(MAX(product_price_log_id), 0) + 1 INTO product_price_log_id
    FROM product_prices_logs;
    WHILE start_date <= end_date DO
      SET day_of_week = DAYOFWEEK(start_date);
      IF day_of_week = 2 OR day_of_week = 4 OR day_of_week = 6 THEN
        INSERT INTO product_prices_logs (price_change_log_date, prev_price, current_price, product_id, product_price_log_id)
        VALUES (start_date, prev_price, price, product_ids, product_price_log_id);
        SET product_price_log_id = product_price_log_id + 1;
        SET prev_price = price; -- asignar el valor de "current_price" al valor de "prev_price" para el próximo registro
      END IF;
      SET price = price + ROUND(RAND() * 100 - 50);
      SET start_date = DATE_ADD(start_date, INTERVAL 1 DAY);
    END WHILE;
    -- actualizar la tabla products con el último precio
    UPDATE products SET price = prev_price WHERE product_id = product_ids;
    SET start_date = NOW();
    SET end_date = DATE_ADD(NOW(), INTERVAL 6 MONTH);
    SET product_ids = product_ids + 1;
  END WHILE;
END $$
DELIMITER;



-- LLAMAR AL STORED PROCEDURE QUE GENERA EL HISTORIAL DE PRECIOS
DELIMITER $$
CREATE PROCEDURE generate_commission_logs()
BEGIN
    DECLARE start_date DATE DEFAULT NOW();
    DECLARE end_date DATE DEFAULT DATE_ADD(NOW(), INTERVAL 6 MONTH);
    DECLARE commission_id INT DEFAULT 1;
    DECLARE commission_percentage DECIMAL(5, 2) DEFAULT 0.08;
    DECLARE period_start_date DATE;
    DECLARE period_end_date DATE;
    DECLARE prev_end_date DATE DEFAULT NULL; -- variable to store previous commission end date
    
    WHILE start_date <= end_date DO
        -- set period start and end dates based on day of week
        IF DAYOFWEEK(start_date) IN (2, 3, 4) THEN -- Monday to Wednesday
            SET commission_percentage = ROUND(RAND() * 0.02 + 0.08, 2);
            SET period_start_date = IFNULL(prev_end_date, start_date);
            SET period_end_date = DATE_ADD(period_start_date, INTERVAL 2 DAY);
        ELSEIF DAYOFWEEK(start_date) IN (5, 6) THEN -- Thursday to Friday
            SET commission_percentage = ROUND(RAND() * 0.03 + 0.1, 2);
            SET period_start_date = IFNULL(prev_end_date, start_date);
            SET period_end_date = DATE_ADD(period_start_date, INTERVAL 1 DAY);
        ELSEIF DAYOFWEEK(start_date) IN (1, 7) THEN -- Saturday to Sunday
            SET commission_percentage = ROUND(RAND() * 0.03 + 0.13, 2);
            SET period_start_date = IFNULL(prev_end_date, start_date);
            SET period_end_date = DATE_ADD(period_start_date, INTERVAL 1 DAY);
        END IF;
        -- insert commission log
        INSERT INTO commission_logs (commission_id, commission_log_start_date, commission_log_end_date, commission_percentaje)
        VALUES (commission_id, period_start_date, period_end_date, commission_percentage);
        -- update variables for next iteration
        SET start_date = DATE_ADD(period_end_date, INTERVAL 1 DAY);
        SET commission_id = commission_id + 1;
        SET prev_end_date = period_end_date;
    END WHILE;
END $$
DELIMITER;



-- LLAMAR AL STORED PROCEDURE QUE GENERA EL HISTORIAL DE HORARIOS
DELIMITER $$
CREATE PROCEDURE insert_work_schedule_logs(IN employee_range INT,IN location_range INT, IN cart_range INT)
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE cur_date DATE;
    DECLARE start_time TIME;
    DECLARE end_time TIME;
    DECLARE employee_id INT;
    DECLARE cart_id INT;
    DECLARE location_id INT;

    SET start_date = CURDATE();
    SET end_date = DATE_ADD(start_date, INTERVAL 6 MONTH);
    SET cur_date = start_date;
    WHILE cur_date <= end_date DO
        SET start_time = TIME('08:00:00');
        SET end_time = TIME('16:00:00');
        WHILE start_time <= end_time DO
            SET employee_id = FLOOR(RAND() * 5) + employee_range;
            SET cart_id = FLOOR(RAND() * 10) + cart_range;
            SET location_id = FLOOR(RAND() * 3) + location_range;
            INSERT INTO work_schedule_logs (start_time, end_time, log_date, cart_id, employee_id, location_id)
            SELECT start_time, ADDTIME(start_time, '08:00:00'), cur_date, cart_id, employee_id, location_id
            FROM DUAL
            WHERE NOT EXISTS (
                SELECT *
                FROM work_schedule_logs
                WHERE log_date = cur_date
                AND cart_id = cart_id
                AND start_time <= ADDTIME(end_time, '01:00:00') -- permitir una hora de solapamiento
                AND end_time >= ADDTIME(start_time, '01:00:00') -- permitir una hora de solapamiento
            )
            AND NOT EXISTS (
                SELECT *
                FROM work_schedule_logs
                WHERE log_date = cur_date
                AND employee_id = employee_id
                AND start_time <= ADDTIME(end_time, '01:00:00') -- permitir una hora de solapamiento
                AND end_time >= ADDTIME(start_time, '01:00:00') -- permitir una hora de solapamiento
            )
            LIMIT 1;
            SET start_time = ADDTIME(start_time, '08:00:00');
        END WHILE;
        SET cur_date = ADDDATE(cur_date, 1);
    END WHILE;
END $$
DELIMITER;



-- LLAMAR AL STORED PROCEDURE QUE GENERA EL HISTORIAL DE HORARIOS
DELIMITER $$
CREATE PROCEDURE insert_purchase_orders()
BEGIN
    DECLARE start_date DATE DEFAULT CURRENT_DATE;
    DECLARE end_date DATE DEFAULT DATE_ADD(start_date, INTERVAL 6 MONTH);
    DECLARE num_inserts INT;
    DECLARE max_order_id INT;
    
    SELECT COALESCE(MAX(order_id), 0) INTO max_order_id FROM purchase_orders;
    WHILE start_date <= end_date DO
        SET num_inserts = FLOOR(1 + RAND() * (20-1+1));
        WHILE num_inserts > 0 DO
            SET max_order_id = max_order_id + 1;
            INSERT INTO purchase_orders (order_id, state, order_creation_date, employee_id, client_id)
            VALUES (max_order_id,
                    IF(RAND() < .9, 1,
                       IF(RAND() < .5,2 ,3)), start_date,
                    FLOOR(1 + RAND() * (15-1+1)), FLOOR(1 + RAND() * (7000-1+1)));
            SET num_inserts = num_inserts - 1;
        END WHILE;
        SET start_date = DATE_ADD(start_date, INTERVAL 1 DAY);
    END WHILE;
END $$ 
DELIMITER;



-- LLAMAR AL STORED PROCEDURE QUE GENERA VENTAS
DELIMITER $$
CREATE PROCEDURE generate_sales()
BEGIN
    DECLARE num_sales INT;
    DECLARE i INT DEFAULT 0;
    DECLARE z DATETIME;

    DROP TEMPORARY TABLE IF EXISTS temp_work_schedule_logs;
    CREATE TEMPORARY TABLE temp_work_schedule_logs AS SELECT log_date, start_time, end_time, work_schedule_log_id FROM work_schedule_logs;

    WHILE EXISTS (SELECT 1 FROM temp_work_schedule_logs) DO
        SELECT log_date, start_time, end_time, work_schedule_log_id INTO @log_date, @start_time, @end_time,@work_schedule_log_id FROM temp_work_schedule_logs LIMIT 1;
        DELETE FROM temp_work_schedule_logs WHERE work_schedule_log_id = @work_schedule_log_id;

        SET num_sales = FLOOR(10 + RAND() * (60 - 10));
        SET i = 0;

        WHILE i < num_sales DO
			SET z = (SELECT CONCAT(@log_date, ' ', SEC_TO_TIME(FLOOR(RAND() * (TIME_TO_SEC(@end_time) - TIME_TO_SEC(@start_time) + 1)) + TIME_TO_SEC(@start_time))));	
            INSERT INTO sales(transaction_date,
                              invoice_creation_date,
                              pay_type,
                              total_price,
                              deleted,
                              client_id,
                              work_schedule_log_id,
                              commission_id
                              )
            VALUES(
				z,
                (SELECT ADDTIME(z, CONCAT('00:00:', FLOOR(RAND() * 31) + 10))),
                CASE 
                    WHEN RAND() < 0.6 THEN 0
                    WHEN RAND() >= 0.6 AND RAND() < 0.9 THEN 2
                    ELSE 1
                END,
                0,
                CASE 
                    WHEN pay_type =2 AND RAND()<0.2 THEN 1 
                    ELSE 0 
                END ,
                FLOOR(1 + RAND()*7000),
                @work_schedule_log_id,
                (IFNULL((SELECT commission_id FROM commission_logs WHERE z BETWEEN commission_log_start_date AND commission_log_end_date ORDER BY commission_id DESC LIMIT 1),(SELECT commission_id FROM caso2.commission_logs WHERE commission_id ORDER BY commission_id DESC LIMIT 1)))
                );
            SET i = i +1 ;
        END WHILE;
    END WHILE;
END $$
DELIMITER ;



-- LLAMAR AL STORED PROCEDURE QUE GENERA PRODUCTOS POR ORDENES
CREATE PROCEDURE insert_products_x_purchase_order()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE order_count INT;
    DECLARE product_count INT;
    DECLARE p_product_id INT;
    DECLARE product_amount INT;
    SET order_count = (SELECT COUNT(*) FROM purchase_orders);
    
    WHILE i < order_count DO
        SET product_count = FLOOR(RAND()*(5-1+1))+1; -- generate a random number between 1 and 5
        SET p_product_id = (SELECT product_id FROM products ORDER BY RAND() LIMIT 1); -- get a random product_id
        SET product_amount = FLOOR(RAND()*(5-1+1))+1; -- generate a random number between 1 and 10
        
        INSERT INTO products_x_purchase_order (order_id, product_id, product_amount)
        VALUES (i+1, p_product_id, product_amount); -- insert the product
        
        SET i = i + 1;
        IF i % product_count = 0 THEN -- reset the product count when it reaches the limit
            SET product_count = FLOOR(RAND()*(5-1+1))+1;
        END IF;
    END WHILE;
END $$
DELIMITER ;



-- LLAMAR AL STORED PROCEDURE QUE GENERA PRODUCTOS POR VENTAS
DELIMITER $$
CREATE PROCEDURE insert_products_x_sales()
BEGIN
DECLARE i INT DEFAULT 0;
DECLARE j INT;
DECLARE sale_count INT;
DECLARE product_count INT;
DECLARE p_product_id INT;
DECLARE amount INT;
SET sale_count = (SELECT COUNT(*) FROM sales);
WHILE i < sale_count DO
    SET product_count = FLOOR(RAND()*(5-1+1))+1; -- generate a random number between 1 and 5
    SET p_product_id = (SELECT product_id FROM products ORDER BY RAND() LIMIT 1); -- get a random product_id
    SET amount = FLOOR(RAND()*(5-1+1))+1; -- generate a random number between 1 and 10
    
    INSERT INTO products_x_sales (sale_id, product_id, amount)
    VALUES (i+1, p_product_id, amount); -- insert the product
    
    SET j = 1;
    WHILE j < product_count DO -- insert between 1 and 5 more registers per order id
        SET p_product_id = (SELECT product_id FROM products ORDER BY RAND() LIMIT 1);
        SET amount = FLOOR(RAND()*(5-1+1))+1;
        INSERT INTO products_x_sales (sale_id, product_id, amount)
        VALUES (i+1, p_product_id, amount);
        SET j = j + 1;
    END WHILE;
    
    SET i = i + 1;
END WHILE;
END $$
DELIMITER ;


-- CALL FOR PROCEDURES

CALL generate_price_logs();

CALL generate_commission_logs();

CALL insert_work_schedule_logs(1,1,1);
CALL insert_work_schedule_logs(6,4,11);
CALL insert_work_schedule_logs(11,7,21);

CALL insert_purchase_orders();
SET SQL_SAFE_UPDATES=0;
CALL generate_sales();

CALL insert_products_x_purchase_order();

CALL insert_products_x_sales();