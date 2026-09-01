SELECT *
FROM Customers;

SELECT *
FROM Products;

SELECT *
FROM Products
WHERE price > 10000;

SELECT *
FROM Customers
WHERE city = 'Delhi';

SELECT
    p.product_name,
    i.stock_quantity,
    i.reorder_level
FROM Products p
INNER JOIN Inventory i
    ON p.product_id = i.product_id
WHERE i.stock_quantity <= i.reorder_level;

SELECT
    p.product_name,
    i.stock_quantity
FROM Products p
INNER JOIN Inventory i
    ON p.product_id = i.product_id
ORDER BY i.stock_quantity DESC;

SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_status
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id;

SELECT
    c.customer_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id;

SELECT
    c.customer_id,
    c.customer_name
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    p.price,
    p.price * oi.quantity AS revenue
FROM Orders o
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
INNER JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed';

SELECT
    SUM(p.price * oi.quantity) AS total_revenue
FROM Orders o
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
INNER JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed';

SELECT
    p.product_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM Products p
INNER JOIN Order_Items oi
    ON p.product_id = oi.product_id
INNER JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC;

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM Products p
INNER JOIN Order_Items oi
    ON p.product_id = oi.product_id
INNER JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY units_sold DESC;

SELECT
    p.category,
    SUM(p.price * oi.quantity) AS category_revenue
FROM Products p
INNER JOIN Order_Items oi
    ON p.product_id = oi.product_id
INNER JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(p.price * oi.quantity) AS total_spending
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
INNER JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY total_spending DESC;

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(p.price * oi.quantity) AS total_spending
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
INNER JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING SUM(p.price * oi.quantity) > 50000
ORDER BY total_spending DESC;

SELECT
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(p.price * oi.quantity) AS total_spending
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
INNER JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING SUM(p.price * oi.quantity) > 50000
ORDER BY total_spending DESC
LIMIT 3;

SELECT
    AVG(customer_spending) AS average_customer_spending
FROM (
    SELECT
        c.customer_id,
        SUM(p.price * oi.quantity) AS customer_spending
    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id
    INNER JOIN Order_Items oi
        ON o.order_id = oi.order_id
    INNER JOIN Products p
        ON oi.product_id = p.product_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.customer_id
) AS customer_sales;

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(p.price * oi.quantity) AS total_spending,
    AVG(p.price * oi.quantity) AS average_item_value
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
INNER JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING SUM(p.price * oi.quantity) > 50000
ORDER BY total_spending DESC;

