-- 2. Write a procedure that declares an integer variable called num,
-- assigns a value to it, and computes and inserts into the temp table
-- the value of the variable itself, its square, and its cube.

DROP PROCEDURE IF EXISTS sp_number;

DELIMITER $$

CREATE PROCEDURE sp_number()
BEGIN
    DECLARE num INT default 9;
    DECLARE square INT;
    DECLARE cube_no INT;
    SET square = num * num;
    SET cube_no = num * num * num;
    INSERT INTO temptable VALUES(num,square,cube_no);
END;
$$

DELIMITER ;