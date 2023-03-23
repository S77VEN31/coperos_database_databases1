DELIMITER $$
CREATE PROCEDURE insert_products_x_purchase_order()
BEGIN
DECLARE i INT DEFAULT 0;
DECLARE j INT;
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
    
    SET j = 1;
    WHILE j < product_count DO -- insert between 1 and 5 more registers per order id
        SET p_product_id = (SELECT product_id FROM products ORDER BY RAND() LIMIT 1);
        SET product_amount = FLOOR(RAND()*(5-1+1))+1;
        INSERT INTO products_x_purchase_order (order_id, product_id, product_amount)
        VALUES (i+1, p_product_id, product_amount);
        SET j = j + 1;
    END WHILE;
    
    SET i = i + 1;
END WHILE;
END $$
DELIMITER ;
