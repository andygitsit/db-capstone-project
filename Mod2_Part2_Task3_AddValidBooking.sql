DELIMITER  $$
CREATE PROCEDURE AddValidBooking (IN bookdate DATE, IN tableNum INT)

BEGIN
	SELECT 
    CASE WHEN bookdate != BookingDate AND TableNo = tableNum
    THEN COMMIT
    ELSE 
    ROLLBACK
    END AS transact
    FROM Bookings
END $$
DELIMITER  ;