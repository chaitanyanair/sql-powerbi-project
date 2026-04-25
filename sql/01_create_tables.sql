-- DIM CALENDAR
DROP TABLE IF EXISTS dim_calendar;
CREATE TABLE dim_calendar (
    date DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    dayofweek INT
);

-- DIM CUSTOMERS
DROP TABLE IF EXISTS dim_customers;
CREATE TABLE dim_customers (
    customer_id VARCHAR PRIMARY KEY,
    age INT,
    gender TEXT,
    loyalty_member BOOLEAN,
    join_date DATE
);

-- DIM PRODUCTS
DROP TABLE IF EXISTS dim_products;
CREATE TABLE dim_products (
    product_id VARCHAR PRIMARY KEY,
    product_name TEXT,
    brand TEXT,
    category TEXT,
    cocoa_percent INT,
    weight_g INT
);

-- DIM STORES
DROP TABLE IF EXISTS dim_stores;
CREATE TABLE dim_stores (
    store_id VARCHAR PRIMARY KEY,
    store_name TEXT,
    city TEXT,
    country TEXT,
    store_type TEXT
);

-- FACT SALES
DROP TABLE IF EXISTS fact_sales;
CREATE TABLE fact_sales (
    order_id VARCHAR PRIMARY KEY,
    order_date DATE,
    product_id VARCHAR,
    store_id VARCHAR,
    customer_id VARCHAR,
    quantity INT,
    unit_price NUMERIC,
    discount NUMERIC,
    revenue NUMERIC,
    cost NUMERIC,
    profit NUMERIC
);