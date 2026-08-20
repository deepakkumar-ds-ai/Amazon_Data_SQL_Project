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