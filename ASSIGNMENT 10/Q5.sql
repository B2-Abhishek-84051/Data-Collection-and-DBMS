-- 5. Your block should read in two real numbers and tell whether the
-- product of the two numbers is equal to or greater than 100.

DROP PROCEDURE IF EXISTS sp_compare;

DELIMITER $$
CREATE PROCEDURE sp_compare(IN num1 INT,IN num2 INT)
BEGIN
    DECLARE product INT;
    SET product = num1 * num2;

    IF product>100 THEN
        SELECT product,"GREATER THAN 100" AS comparison;
    ELSEIF  product<100 THEN
        SELECT product,"LESS THAN 100" AS comparison;
    ELSE
        SELECT product,"EQUAL TO 100" AS comparison;
    END IF;
END;
$$

DELIMITER ;