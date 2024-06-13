-- 4.Create a procedure to Convert a number of inches into yards, feet,
-- and inches. For example, 124 inches equals 3 yards, 1 foot, and 4
-- inches.

DROP PROCEDURE IF EXISTS sp_scaleconv;

DELIMITER $$

CREATE PROCEDURE sp_scaleconv(IN num DECIMAL(5,2))
BEGIN
    DECLARE yard INT;
    DECLARE foot INT;
    DECLARE inch INT;
    DECLARE inch_cal INT;
    SET yard = num / 36;
    SET inch = num % 36;
    SET foot = inch /12;
    SET inch = inch % 12;

    select num,concat(yard," yards ",foot," foot and ",inch," inches.") AS Conversion;
END;
$$
DELIMITER ;