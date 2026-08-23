-- EDA
SELECT * FROM category;
SELECT * FROM customers;
SELECT * FROM inventory;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM sellers;
SELECT * FROM shippings;

SELECT DISTINCT payment_status FROM payments;
SELECT * 
FROM payments
WHERE order_id = 6747;

------------------------------------
-- Business Problems
-- Advanced Analysis
------------------------------------

/*
1. Top Selling Products
Query the top 10 products by total sales value.
Challenge: Include product name, total quantity sold, and total sales value.
*/ 

-- order_items(oi) - order(o) - products(pr)
-- product_id
-- sum qty * price per unit
-- group by product_top 10 product
-- 

SELECT * FROM order_items;

-- Creating new column	
ALTER TABLE order_items
ADD COLUMN total_sale FLOAT;

-- Updating total_sale column (total_sale = quantity * price_per_unit)
UPDATE order_items
SET total_sale = quantity * price_per_unit;
SELECT * FROM order_items;

SELECT * FROM order_items
ORDER BY quantity DESC;

SELECT 
	oi.product_id,
	p.product_name,
	SUM(oi.total_sale) as  total_sale,
	COUNT(o.order_id) as total_orders
FROM orders as o 
JOIN 
order_items as oi 
ON oi.order_id = o.order_id
JOIN 
products as p
ON p.product_id = oi.product_id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10;
















