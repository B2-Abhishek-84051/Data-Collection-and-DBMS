-- 3.Create a procedure to Convert a temperature in Fahrenheit (F) to its
-- equivalent in Celsius (C) and vice versa. The required formulae are:-
-- C= (F-32)*5/9 F= 9/5*C + 32

DROP PROCEDURE IF EXISTS sp_fahrenheitconv;
DROP PROCEDURE IF EXISTS sp_celsiusconv;

DELIMITER $$

CREATE PROCEDURE sp_fahrenheitconv(IN F DECIMAL(5,2))
BEGIN
    DECLARE C DECIMAL(5,2);
    SET C = (F-32)*5/9;
    SELECT F,C;
END;

CREATE PROCEDURE sp_celsiusconv(IN C DECIMAL(5,2))
BEGIN
    DECLARE F DECIMAL(5,2);
    SET F = 9/5*C + 32;
    SELECT C,F;
END;
$$

DELIMITER ;