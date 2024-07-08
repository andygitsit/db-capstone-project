SELECT

meu.ItemDesc AS MenuName


FROM Orders as ord
LEFT JOIN  OrderDetials as ordet
ON ordet.OrderID = ord.OrderID
LEFT JOIN Menu as meu
ON meu.ItemID = ordet.ItemID
WHERE ordet.Quantity = ANY (SELECT 
							ordet.Quantity 
                            FROM OrderDetials as ordet 
                            where Quantity > 2)