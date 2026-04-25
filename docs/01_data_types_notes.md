dim_calendar:
    date -> date
    year -> int
    month -> int
    day -> int
    dayofweek -> int

dim_customers: 
    customer_id -> varchar
    age -> int
    gender -> string
    loyalty_member -> bool 1/0
    join_date -> date

dim_products:
    product_id -> varchar
    product_name -> string
    brand -> string
    category -> string
    cocoa_percent -> int
    weight_g -> int

dim_stores:
    store_id -> int
    store_name -> string
    city -> string
    country -> string
    store_type -> string

fact_sales:
    order_id -> varchar
    order_date -> date/time
    product_id -> varchar
    store_id -> varchar
    customer_id -> varchar
    quantity -> int
    unit_price -> float
    discount -> float
    revenue -> float
    cost -> float
    profit -> float