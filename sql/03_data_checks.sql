---fact_sales >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Preview
SELECT *
FROM fact_sales
LIMIT 10;
-- Null check
SELECT *
FROM fact_sales
WHERE order_id IS NULL
   OR product_id IS NULL
   OR customer_id IS NULL;
-- Duplicate check
SELECT order_id,
   COUNT(*)
FROM fact_sales
GROUP BY order_id
HAVING COUNT(*) > 1;
-- Invalid values
SELECT *
FROM fact_sales
WHERE quantity <= 0
   OR unit_price < 0;
-- Profit validation
SELECT *
FROM fact_sales
WHERE ROUND(revenue - cost, 2) != ROUND(
      profit,
      2;
-- Discount check
SELECT *
FROM fact_sales
WHERE discount < 0
   OR discount > 1;

   AND unit_price >= 0;

---dim_customers >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

---primary key uniqueness
SELECT customer_id, COUNT(*)
FROM dim_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

---null value checks
SELECT *
FROM dim_customers
WHERE customer_id IS NULL;

---basic data sanity
SELECT *
FROM dim_customers
WHERE age < 0 OR age > 120;

---dim_products >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
SELECT product_id, COUNT(*)
FROM dim_products
GROUP BY product_id
HAVING COUNT(*) > 1;

---null value checks
SELECT *
FROM dim_products
WHERE product_id IS NULL;

---basic data sanity
SELECT *
FROM dim_products
WHERE cocoa_percent < 0 OR cocoa_percent > 100;

---dim_stores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
SELECT store_id, COUNT(*)
FROM dim_stores
GROUP BY store_id
HAVING COUNT(*) > 1;

---null value checks
SELECT *
FROM dim_stores
WHERE store_id IS NULL;

---basic data sanity
SELECT DISTINCT country
FROM dim_stores;

---Check JOINS 

---Invalid customer data in fact_sales
SELECT f.*
FROM fact_sales f
LEFT JOIN dim_customers c
  ON f.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

---Missing products
SELECT f.*
FROM fact_sales f
LEFT JOIN dim_products p
  ON f.product_id = p.product_id
WHERE p.product_id IS NULL;

--Missing stores
SELECT f.*
FROM fact_sales f
LEFT JOIN dim_stores s
  ON f.store_id = s.store_id
WHERE s.store_id IS NULL;

---Finding distinct invalid product_ids - orphan records
SELECT DISTINCT f.product_id
FROM vw_fact_sales_clean f
LEFT JOIN dim_products p
  ON f.product_id = p.product_id
WHERE p.product_id IS NULL;
