INSERT INTO Customers
(customer_id, customer_name, email, city, signup_date)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Delhi', '2025-01-10'),
(2, 'Priya Singh', 'priya@gmail.com', 'Mumbai', '2025-02-15'),
(3, 'Aman Verma', 'aman@gmail.com', 'Delhi', '2025-03-20'),
(4, 'Neha Gupta', 'neha@gmail.com', 'Pune', '2025-04-05'),
(5, 'Rohan Mehta', 'rohan@gmail.com', 'Bangalore', '2025-05-12'),
(6, 'Anjali Kapoor', 'anjali@gmail.com', 'Delhi', '2025-06-18');

INSERT INTO Customers
(customer_id, customer_name, email, city, signup_date)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Delhi', '2025-01-10'),
(2, 'Priya Singh', 'priya@gmail.com', 'Mumbai', '2025-02-15'),
(3, 'Aman Verma', 'aman@gmail.com', 'Delhi', '2025-03-20'),
(4, 'Neha Gupta', 'neha@gmail.com', 'Pune', '2025-04-05'),
(5, 'Rohan Mehta', 'rohan@gmail.com', 'Bangalore', '2025-05-12'),
(6, 'Anjali Kapoor', 'anjali@gmail.com', 'Delhi', '2025-06-18');

INSERT INTO Inventory
(inventory_id, product_id, stock_quantity, reorder_level)
VALUES
(1, 101, 15, 5),
(2, 102, 8, 10),
(3, 103, 50, 15),
(4, 104, 30, 10),
(5, 105, 7, 10),
(6, 106, 25, 8),
(7, 107, 40, 15),
(8, 108, 5, 8);

INSERT INTO Orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2026-01-05', 'Completed'),
(1002, 2, '2026-01-07', 'Completed'),
(1003, 1, '2026-01-12', 'Completed'),
(1004, 3, '2026-01-15', 'Cancelled'),
(1005, 4, '2026-01-20', 'Completed'),
(1006, 5, '2026-01-22', 'Completed'),
(1007, 2, '2026-01-25', 'Completed'),
(1008, 6, '2026-01-28', 'Pending'),
(1009, 1, '2026-02-02', 'Completed'),
(1010, 5, '2026-02-05', 'Completed');

INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),

(3, 1002, 102, 1),
(4, 1002, 104, 1),

(5, 1003, 108, 1),
(6, 1003, 105, 2),

(7, 1004, 106, 1),

(8, 1005, 101, 1),
(9, 1005, 107, 2),

(10, 1006, 102, 1),
(11, 1006, 103, 2),

(12, 1007, 106, 2),

(13, 1008, 108, 1),

(14, 1009, 102, 1),
(15, 1009, 103, 3),

(16, 1010, 101, 1),
(17, 1010, 104, 2);

