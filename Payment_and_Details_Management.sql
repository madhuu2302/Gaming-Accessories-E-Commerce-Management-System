
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Method VARCHAR(20),
    Payment_Status VARCHAR(20),
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Order_ID INT,
    FOREIGN KEY (Order_ID) REFERENCES "ORDER"(Order_ID)
);

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

SELECT *
FROM Payment
WHERE Payment_Status = 'Paid';

SELECT *
FROM Payment
WHERE Payment_Status = 'Failed';

UPDATE Payment
SET Payment_Status = 'Paid'
WHERE Payment_ID = 3;

SELECT *
FROM Payment
WHERE Payment_ID = 3;

SELECT
    Payment_Method,
    COUNT(*) AS Total_Transactions
FROM Payment
GROUP BY Payment_Method;

SELECT
    Payment_Method,
    SUM(Amount) AS Total_Amount
FROM Payment
WHERE Payment_Status = 'Paid'
GROUP BY Payment_Method;


SELECT
    PAYMENT_ID,
    ORDER_ID,
    PAYMENT_METHOD,
    PAYMENT_DATE,
    AMOUNT,
    PAYMENT_STATUS
FROM Payment
ORDER BY PAYMENT_DATE;

