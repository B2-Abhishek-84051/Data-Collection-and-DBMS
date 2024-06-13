-- 1. Write a procedure that computes the perimeter and the area of a
-- rectangle. Define your own values for the length and width. (Assuming
-- that L and W are the length and width of the rectangle, Perimeter =
-- 2*(L+W) and Area = L*W.

DROP PROCEDURE IF EXISTS sp_rectangle_measure;

DELIMITER $$

CREATE PROCEDURE sp_rectangle_measure(IN L INT,IN W INT)
BEGIN
    DECLARE area INT;
    DECLARE perimeter INT;
    SET area = L * W;
    SET perimeter = 2 * (L + W);
    SELECT L length,W width,area,perimeter;
END;
$$

DELIMITER ;