-- DBMS – PAYMENT AND DETAILS MANAGEMENT
-- Project Title: Gaming-Accessories E-Commerce Order Management System

-- 1. Database Design
-- 1.1 Payment Table

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Method VARCHAR(20),
    Payment_Status VARCHAR(20),
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Order_ID INT,
    FOREIGN KEY (Order_ID) REFERENCES "ORDER"(Order_ID)
);

-- 4. Payment Data Insertion

INSERT INTO Payment
VALUES (1, 'UPI', 'Paid', TO_DATE('2026-09-20', 'YYYY-MM-DD'), 500.00, 101);

INSERT INTO Payment
VALUES (2, 'Card', 'Paid', TO_DATE('2026-09-21', 'YYYY-MM-DD'), 750.00, 102);

INSERT INTO Payment
VALUES (3, 'COD', 'Pending', TO_DATE('2026-09-22', 'YYYY-MM-DD'), 1200.00, 103);

INSERT INTO Payment
VALUES (4, 'UPI', 'Paid', TO_DATE('2026-09-23', 'YYYY-MM-DD'), 950.00, 104);

INSERT INTO Payment
VALUES (5, 'Card', 'Failed', TO_DATE('2026-09-24', 'YYYY-MM-DD'), 650.00, 105);

-- 5. Manage Payment Transactions
-- 5.1 Display Successful Payments

SELECT *
FROM Payment
WHERE Payment_Status = 'Paid';

-- 5.2 Display Failed Payments

SELECT *
FROM Payment
WHERE Payment_Status = 'Failed';

-- 6. Modify Payment Status

UPDATE Payment
SET Payment_Status = 'Paid'
WHERE Payment_ID = 3;

SELECT *
FROM Payment
WHERE Payment_ID = 3;

-- 7. Analyze Payment Methods

SELECT
    Payment_Method,
    COUNT(*) AS Total_Transactions
FROM Payment
GROUP BY Payment_Method;

-- Calculate amount collected by payment mode

SELECT
    Payment_Method,
    SUM(Amount) AS Total_Amount
FROM Payment
WHERE Payment_Status = 'Paid'
GROUP BY Payment_Method;

-- 8. Payment Transaction Report

SELECT
    PAYMENT_ID,
    ORDER_ID,
    PAYMENT_METHOD,
    PAYMENT_DATE,
    AMOUNT,
    PAYMENT_STATUS
FROM Payment
ORDER BY PAYMENT_DATE;

