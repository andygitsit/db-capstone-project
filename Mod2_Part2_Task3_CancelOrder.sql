DELIMITER  $$
CREATE PROCEDURE CancelOrder(IN orderNum INT)

BEGIN
	DELETE
	FROM OrderDetials
    WHERE OrderID = orderNum;
END $$
DELIMITER  ;