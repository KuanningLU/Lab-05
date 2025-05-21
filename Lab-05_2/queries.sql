-- 查詢特定顧客(C001)的所有訂單
SELECT * FROM `Order`
WHERE CustomerID = 'C001';

-- 查詢特定訂單(O1001)的所有訂單項目及產品名稱
SELECT oi.OrderID, oi.ProductID, p.ProductName, oi.Quantity, oi.UnitPrice
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID
WHERE oi.OrderID = 'O1001';

-- 計算每個產品的總銷售數量
SELECT ProductID, SUM(Quantity) AS TotalSold
FROM OrderItem
GROUP BY ProductID;

-- 找出購買總金額最高的前三位顧客
SELECT c.CustomerID, c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Customer c
JOIN `Order` o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
LIMIT 3;
