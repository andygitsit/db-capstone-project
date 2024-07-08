DELIMITER  $$
CREATE PROCEDURE AddBooking  (IN bookdate DATE, IN tableNum INT, IN custid INT, IN bookid INT)

BEGIN
	INSERT INTO Bookings
    (BookingID, TableNo, BookingDate, CustomerID)
    VALUES
    (bookid, tableNum, bookdate, custid)
    
END $$
DELIMITER  ;