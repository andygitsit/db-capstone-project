DELIMITER  $$
CREATE PROCEDURE GetMaxQuantity()

BEGIN
	SELECT MAX(Quantity)
	FROM OrderDetials;
END $$
DELIMITER  ;