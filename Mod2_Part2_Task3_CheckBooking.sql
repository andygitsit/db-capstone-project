DELIMITER  $$
CREATE PROCEDURE CheckBooking (IN bookdate DATE, IN tableNum INT)

BEGIN
	SELECT BookingStatus
    FROM Bookings
    WHERE BookingDate = bookdate AND TableNo = tableNum
END $$
DELIMITER  ;