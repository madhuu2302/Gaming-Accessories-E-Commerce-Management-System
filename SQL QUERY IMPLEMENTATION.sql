SELECT *
FROM Products;

SELECT Product_ID, Product_Name, Price
FROM Products;

SELECT *
FROM Products
WHERE Price > 100;

SELECT *
FROM Products
WHERE Price < 1000;

SELECT Product_ID, Product_Name, Price
FROM Products
ORDER BY Price ASC;

SELECT Product_ID, Product_Name, Price
FROM Products
ORDER BY Price DESC;

SELECT DISTINCT Price
FROM Products
ORDER BY Price ASC;

SELECT DISTINCT Product_Name
FROM Products;

SELECT *
FROM Products
WHERE Price < 2000 AND Stock > 0;

SELECT *
FROM Products
WHERE NOT Category = 'Accessories';

SELECT CustomerID, CustomerName, Email, Mobile
FROM Customer;

SELECT CustomerID, CustomerName, Age
FROM Customer
WHERE Age BETWEEN 20 AND 22;

SELECT CustomerID, CustomerName, City
FROM Customer
WHERE City = 'Chennai' OR City = 'trichy';

SELECT CustomerID, CustomerName, City
FROM Customer
ORDER BY CustomerName ASC;

SELECT Product_ID, Product_Name, Price
FROM Products
ORDER BY Price DESC;
