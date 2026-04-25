### fact_sales observation
- No null values in key columns
- No duplicates found
- No invalid entries
- Round off errors found in profit column -> used sql views (see 06_views.sql) to clean data

### Dimension Checks
- No invalid entries in dimension tables
- No inconsistent data
- Fact table has product_ids that are not in dim_products

