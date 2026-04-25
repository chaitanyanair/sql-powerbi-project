# SQL and Power BI Data Analytics Project
This project demonstrates an end-to-end data analytics workflow using a star schema dataset. It covers data ingestion, cleaning, validation, and preparation for business intelligence reporting.
The goal was to transform raw transactional data into a clean, analysis-ready model and connect it to Power BI for visualization.

## Architecture
Raw CSV Files → PostgreSQL (Staging) → Clean Views → Star Schema → Power BI

## Tools & Technologies
- SQL (PostgreSQL)
- pgAdmin
- Power BI
- Visual Studio Code
- Git & GitHub

## Folder Structure
```
sql-powerbi-project/ 
│ 
├── sql/ 
│   ├── 01_create_tables.sql 
│   ├── 02_data_checks.sql 
│   └── 03_views.sql 
│ 
├── docs/
|   ├── 00_data_import_notes.md
|   ├── 02_data_types_notes.md 
│   ├── 02_data_notes.md 
│   └── 03_cleaning_log.md 
│ 
├── data_raw/ (excluded via .gitignore) 
│ 
└── README.md
```

## 🧹 Data Cleaning & Transformation

### 1. Staging Layer
- Imported raw CSV files into PostgreSQL
- Used flexible schemas (TEXT columns where necessary)
- Handled inconsistent formats (e.g., date fields)

### 2. Data Quality Fixes
- Resolved **date format issues** (`DD-MM-YYYY → DATE`)
- Fixed **rounding inconsistencies in profit calculations**
- Removed **invalid records** (e.g., negative values, incorrect pricing)
- Standardized data types across tables

### 3. Handling Data Integrity Issues
- Identified **orphan records** in fact table (missing product IDs)
- Applied filtering to maintain referential integrity
- Ensured all foreign keys match dimension tables

---

## Star Schema Design

### Fact Table
- `fact_sales` → transactional data

### Dimension Tables
- `dim_customers`
- `dim_products`
- `dim_stores`
- `dim_calendar`

### Clean Analytical Views
- `vw_fact_sales_clean`
- `vw_dim_calendar_clean`

---

## Data Validation

Performed multiple validation checks:

- ✔ No duplicate primary keys in dimension tables  
- ✔ No NULL values in key columns  
- ✔ Verified fact-to-dimension relationships  
- ✔ Ensured consistent joins across all tables  

---

## Power BI Integration

The cleaned dataset is designed to connect directly to Power BI.

### Example analyses:
- Revenue by month  
- Profit by product category  
- Sales by store location  
- Customer segmentation  

---

## Key Learnings

- Built a complete **ETL pipeline using SQL**
- Implemented **staging → clean → analytical layers**
- Designed and validated a **star schema**
- Solved real-world data issues:
  - inconsistent formats
  - missing keys
  - rounding errors
- Prepared data for **business intelligence tools**

---

## Future Improvements

- Add DAX measures (e.g., profit margin, YoY growth)
- Build interactive Power BI dashboards
- Optimize SQL queries for performance
- Add automated data validation scripts

---

## Conclusion

This project demonstrates how raw data can be transformed into a structured, reliable, and analysis-ready format using SQL and modern data tools.

It reflects real-world data challenges and showcases practical solutions used in data analytics workflows.