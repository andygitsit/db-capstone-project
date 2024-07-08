prepare GetOrderDetail
'  
SELECT 
ord.OrderID
,ordets.Quantity
FROM Orders AS ord
LEFT JOIN OrderDetials AS ordets
ON ord.OrderID = ordets.OrderID
WHERE ord.OrderID = ?
'