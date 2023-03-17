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

DELIMITER ;