## Profit calculation issue

Observed small discrepancies between:
- stored profit
- calculated (revenue - cost)

Cause:
- rounding differences (1 vs 2 decimal places)

Solution:
- recalculated profit using ROUND(revenue - cost, 2)
- ignored original profit column

## dim_calendar issue

- Import failed due to DATE format (DD-MM-YYYY)
- Solution: used staging table with TEXT columns
- Converted using TO_DATE in view

## Product ID mismatch

- Some product_ids in fact_sales not found in dim_products
- Identified as orphan records

Solution:
- filtered out invalid rows in vw_fact_sales_clean