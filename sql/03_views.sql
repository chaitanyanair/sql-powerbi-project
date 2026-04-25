-- Cleaneed fact sales view
-- Round off errors for profit are handled here
CREATE VIEW vw_fact_sales_clean AS
SELECT order_id,
    order_date,
    product_id,
    store_id,
    customer_id,
    quantity,
    unit_price,
    discount,
    revenue,
    cost,
    ROUND(revenue - cost, 2) AS profit -- recalculated
FROM fact_sales
WHERE quantity > 0 

-- Clean calendar view
CREATE OR REPLACE VIEW vw_dim_calendar_clean AS
SELECT TO_DATE(date, 'DD-MM-YYYY') AS date,
    CAST(year AS INT) AS year,
    CAST(month AS INT) AS month,
    CAST(day AS INT) AS day,
    CAST(week AS INT) AS week,
    CAST(day_of_week AS INT) AS day_of_week
FROM stg_dim_calendar;