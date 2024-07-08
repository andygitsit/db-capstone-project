DELIMITER  $$
CREATE PROCEDURE UpdateBooking   (IN bookdate DATE, IN tableNum INT, IN custid INT, IN bookid INT)

BEGIN
	UPDATE Bookings
    SET BookingID = bookid, TableNo = tableNum , BookingDate = bookdate, CustomerID =custid
    WHERE BookingID = bookid;
    
END $$
DELIMITER  ;