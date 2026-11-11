SELECT Order_ID, Customer_ID, Total_Amount
FROM "ORDER"
WHERE Total_Amount > (
    SELECT AVG(Total_Amount)
    FROM "ORDER"
);
SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > (
    SELECT AVG(Price)
    FROM Product
);
SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price < (
    SELECT AVG(Price)
    FROM Product
);
SELECT Customer_ID,
       SUM(Total_Amount) AS Total_Purchase
FROM "ORDER"
GROUP BY Customer_ID;
SELECT MAX(Total_Purchase)
FROM (
    SELECT SUM(Total_Amount) AS Total_Purchase
    FROM "ORDER"
    GROUP BY Customer_ID
);
SELECT
    c.Customer_ID,
    c.First_Name || ' ' || c.Last_Name AS Customer_Name,
    SUM(o.Total_Amount) AS Total_Purchase
FROM Customer01 c
JOIN "ORDER" o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.First_Name,
    c.Last_Name
HAVING SUM(o.Total_Amount) = (
    SELECT MAX(Total_Purchase)
    FROM (
        SELECT SUM(Total_Amount) AS Total_Purchase
        FROM "ORDER"
        GROUP BY Customer_ID
    )
);
SELECT
    c.Customer_ID,
    c.First_Name || ' ' || c.Last_Name AS Customer_Name,
    o.Order_ID,
    o.Total_Amount
FROM Customer01 c
JOIN "ORDER" o
    ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > (
    SELECT AVG(Total_Amount)
    FROM "ORDER"
)
ORDER BY o.Total_Amount DESC;
SELECT
    p.Product_ID,
    p.Product_Name,
    SUM(od.Subtotal) AS Total_Sales
FROM Product p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
HAVING SUM(od.Subtotal) > (
    SELECT AVG(Product_Sales)
    FROM (
        SELECT SUM(Subtotal) AS Product_Sales
        FROM Order_Details
        GROUP BY Product_ID
    )
)
ORDER BY Total_Sales DESC;
SELECT
    c.Customer_ID,
    c.First_Name || ' ' || c.Last_Name AS Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Purchase,
    AVG(o.Total_Amount) AS Average_Order_Value
FROM Customer01 c
JOIN "ORDER" o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.First_Name,
    c.Last_Name
ORDER BY Total_Purchase DESC;
SELECT
    p.Product_ID,
    p.Product_Name,
    COUNT(DISTINCT od.Order_ID) AS Number_Of_Orders,
    SUM(od.Quantity) AS Total_Quantity_Sold,
    SUM(od.Subtotal) AS Total_Sales,
    AVG(od.Unit_Price) AS Average_Price
FROM Product p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
ORDER BY Total_Sales DESC;
SELECT
    cat.Category_ID,
    cat.Category_Name,
    COUNT(DISTINCT od.Order_ID) AS Total_Orders,
    SUM(od.Quantity) AS Total_Quantity_Sold,
    SUM(od.Subtotal) AS Total_Sales,
    AVG(od.Unit_Price) AS Average_Price
FROM Category cat
JOIN Product p
    ON cat.Category_ID = p.Category_ID
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    cat.Category_ID,
    cat.Category_Name
ORDER BY Total_Sales DESC;
