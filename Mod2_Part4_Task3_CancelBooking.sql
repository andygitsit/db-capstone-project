DELIMITER  $$
CREATE PROCEDURE CancelBooking(IN bookid INT)

BEGIN
	DELETE FROM Bookings
    WHERE BookingID = bookid;
    
END $$
DELIMITER  ;