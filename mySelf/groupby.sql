create database OrderBy;
use OrderBy;


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 101, '2023-08-01', 100.00),
    (2, 102, '2023-08-01', 150.00),
    (3, 101, '2023-08-02', 200.00),
    (4, 103, '2023-08-02', 75.00),
    (5, 102, '2023-08-03', 120.00);
    
SELECT order_date, SUM(total_amount) AS total_order_amount
FROM orders
GROUP BY order_date;

SELECT customer_id, SUM(total_amount) AS total_order_amount
FROM orders
GROUP BY customer_id;
