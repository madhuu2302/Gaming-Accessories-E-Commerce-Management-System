

CREATE TABLE review01 (
    review_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    customer_name VARCHAR2(50),
    rating NUMBER(1),
    review_text VARCHAR2(200),
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES product01(product_id)
);

INSERT INTO review01 VALUES
(1, 101, 'Arun', 5, 'Excellent laptop', SYSDATE);

INSERT INTO review01 VALUES
(2, 102, 'Priya', 4, 'Good smartphone', SYSDATE);

INSERT INTO review01 VALUES
(3, 103, 'Rahul', 5, 'Very good sound quality', SYSDATE);

INSERT INTO review01 VALUES
(4, 104, 'Anu', 3, 'Average product', SYSDATE);

INSERT INTO review01 VALUES
(5, 105, 'Kavin', 4, 'Good keyboard', SYSDATE);

COMMIT;

SELECT p.product_id, p.product_name,
       r.customer_name, r.rating,
       r.review_text, r.review_date
FROM product01 p
JOIN review01 r
ON p.product_id = r.product_id;

SELECT Product_ID,
       AVG(Rating) AS Average_Rating
FROM rating01
GROUP BY Product_ID
HAVING AVG(Rating) >= 4
ORDER BY Average_Rating DESC;

SELECT Product_ID,
       COUNT(Rating_ID) AS Total_Ratings,
       AVG(Rating) AS Average_Rating,
       MAX(Rating) AS Highest_Rating,
       MIN(Rating) AS Lowest_Rating
FROM rating01
GROUP BY Product_ID
ORDER BY Average_Rating DESC;

COMMIT;