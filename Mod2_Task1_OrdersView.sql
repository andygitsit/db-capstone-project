CREATE VIEW OrdersView AS

SELECT 
ord.OrderID
,orddet.Quantity
,ord.TotalCost
FROM Orders AS ord
INNER JOIN OrderDetials AS orddet
ON ord.OrderID = orddet.OrderID
WHERE orddet.Quantity > 2;
