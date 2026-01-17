                           ---E-Commerce Logistics & Delivery Analysis---

CREATE DATABASE ecommerce_logistics;
USE ecommerce_logistics;

--Table Creation for Shipping Data--

CREATE TABLE shipping_data (
        customer_care_calls INT,
        customer_rating INT,
        prior_purchase INT,
        discount_offered INT,
        weight_in_gms INT,
        warehouse_block CHAR(1),
        mode_of_shipment VARCHAR(20),
        product_importance VARCHAR(20),
        gender CHAR(1),
        delivery_status INT
        );

--Preview Sample Data--
	
SELECT * FROM shipping_data LIMIT 10;
SELECT count(*) FROM shipping_data;

--Late Delivery Percentage Analysis--
        
SELECT(count(CASE WHEN delivery_status= 1 THEN 1 END)*100.0/count(*))
AS late_delivery_percentage
FROM shipping_data;

--Shipment Mode Analysis--

SELECT mode_of_shipment,
       count(*) AS total_orders,
       SUM(delivery_status) AS late_orders
FROM shipping_data
GROUP BY mode_of_shipment;

--Warehouse Performance Analysis--

SELECT warehouse_block,
       count(*) AS total_orders,
       SUM(delivery_status) AS late_orders
FROM  shipping_data
GROUP BY warehouse_block
ORDER BY late_orders DESC;

--Discount Impact Analysis--

SELECT discount_offered,
	   count(*) AS total_orders,
       SUM(delivery_status) AS late_orders
FROM shipping_data
GROUP BY discount_offered
ORDER BY discount_offered;

--Product Importance Analysis--

SELECT product_importance,
       count(*) AS total_orders,
       SUM(delivery_status) AS late_orders
FROM shipping_data
GROUP BY product_importance;

--Gender Analysis--

SELECT gender,
       count(*) AS total_orders,
       SUM(delivery_status) AS late_orders
FROM shipping_data
GROUP BY gender;

--Customer Rating Analysis--

SELECT customer_rating,
       count(*) AS total_orders,
       SUM(delivery_status) AS late_orders
FROM shipping_data
GROUP BY customer_rating
ORDER BY customer_rating;

--Delivery Status Classification Using Statement--

SELECT *,
CASE 
    WHEN delivery_status = 1 THEN 'Late Delivery'
    ELSE 'On Time'
END AS delivery_status
FROM shipping_data;
