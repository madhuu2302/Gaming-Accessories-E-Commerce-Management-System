SELECT COUNT(*) AS Total_Orders
FROM "ORDER";

SELECT SUM(Total_Amount) AS Total_Amount
FROM "ORDER";

SELECT AVG(Total_Amount) AS Average_Amount
FROM "ORDER";

SELECT MIN(Total_Amount) AS Minimum_Amount
FROM "ORDER";

SELECT MAX(Total_Amount) AS Maximum_Amount
FROM "ORDER";

SELECT
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Amount) AS Total_Sales,
    AVG(Total_Amount) AS Average_Order_Value,
    MIN(Total_Amount) AS Minimum_Order,
    MAX(Total_Amount) AS Maximum_Order
FROM "ORDER";

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
ORDER BY Total_Purchase DESC;

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
ORDER BY
    Total_Purchase DESC;

SELECT
    p.Product_ID,
    p.Product_Name,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM Product p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
ORDER BY
    Total_Quantity_Sold DESC;

SELECT
    p.Product_ID,
    p.Product_Name,
    SUM(od.Quantity) AS Total_Quantity_Sold,
    SUM(od.Subtotal) AS Total_Sales
FROM Product p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
ORDER BY
    Total_Sales DESC;

SELECT
    c.Category_ID,
    c.Category_Name,
    SUM(od.Quantity) AS Total_Quantity_Sold,
    SUM(od.Subtotal) AS Total_Sales
FROM Category c
JOIN Product p
    ON c.Category_ID = p.Category_ID
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    c.Category_ID,
    c.Category_Name
ORDER BY
    Total_Sales DESC;

SELECT
    c.Customer_ID,
    c.First_Name || ' ' || c.Last_Name AS Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Order_Status,
    p.Product_ID,
    p.Product_Name,
    cat.Category_Name,
    od.Quantity,
    od.Unit_Price,
    od.Subtotal
FROM Customer01 c
JOIN "ORDER" o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
JOIN Product p
    ON od.Product_ID = p.Product_ID
JOIN Category cat
    ON p.Category_ID = cat.Category_ID
ORDER BY
    o.Order_ID;
