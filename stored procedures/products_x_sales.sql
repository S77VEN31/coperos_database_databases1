DELIMITER $$
CREATE PROCEDURE insert_products_x_sales()
BEGIN
DECLARE i INT DEFAULT 0;
DECLARE j INT;
DECLARE sale_count INT;
DECLARE product_count INT;
DECLARE p_product_id INT;
DECLARE amount INT;
SET sale_count = (SELECT COUNT(*) FROM purchase_orders);
WHILE i < sale_count DO
    SET product_count = FLOOR(RAND()*(5-1+1))+1; -- generate a random number between 1 and 5
    SET p_product_id = (SELECT product_id FROM products ORDER BY RAND() LIMIT 1); -- get a random product_id
    SET amount = FLOOR(RAND()*(10-1+1))+1; -- generate a random number between 1 and 10
    
    INSERT INTO products_x_sales (sale_id, product_id, amount)
    VALUES (i+1, p_product_id, amount); -- insert the product
    
    SET j = 1;
    WHILE j < product_count DO -- insert between 1 and 5 more registers per order id
        SET p_product_id = (SELECT product_id FROM products ORDER BY RAND() LIMIT 1);
        SET amount = FLOOR(RAND()*(10-1+1))+1;
        INSERT INTO products_x_sales (sale_id, product_id, amount)
        VALUES (i+1, p_product_id, amount);
        SET j = j + 1;
    END WHILE;
    
    SET i = i + 1;
END WHILE;
END $$
DELIMITER ;
