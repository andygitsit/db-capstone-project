SELECT
cust.CustomerID
,cust.FullName
,ord.OrderID
,ord.TotalCost
,meu.ItemDesc AS MenuName
,meu.ItemType AS CourseName
FROM CustomerDetails AS cust
LEFT JOIN Orders as ord
ON cust.CustomerID = ord.CustomerID
LEFT JOIN OrderDetials as ordet
ON ordet.OrderID = ord.OrderID
LEFT JOIN Menu as meu
ON meu.ItemID = ordet.ItemID
WHERE ord.TotalCost > 150