# Part 3: Data Warehouse and Analytics – FlexiMart

## Overview

In this part of the assignment, a Data Warehouse was designed and implemented
for FlexiMart to analyze historical sales data. A star schema was created using
one fact table and multiple dimension tables. After loading sample data into the
warehouse, analytical (OLAP) queries were written to answer business questions.

This part focuses on reporting, trend analysis, and decision-making use cases.


## Star Schema Design

The data warehouse follows a **star schema** design.

### Fact Table
- **fact_sales**
- Grain: One row per product per sales transaction
- Stores numerical sales data such as quantity sold and total amount

### Dimension Tables
- **dim_date**: Stores date-related information for time analysis
- **dim_product**: Stores product details like name and category
- **dim_customer**: Stores customer details such as name and city

This structure helps in faster querying and easy analysis.


## Schema Files

### 1. warehouse_schema.sql
This file contains SQL statements to create all tables:
- dim_date
- dim_product
- dim_customer
- fact_sales

Primary keys and foreign key relationships are defined to maintain data integrity.


## Data Loading

### 2. warehouse_data.sql
This file contains INSERT statements to load sample data into the warehouse.

Data loaded as per assignment requirements:
- dim_date: 30 dates (January–February 2024)
- dim_product: 15 products across 3 categories
- dim_customer: 12 customers from 4 cities
- fact_sales: 40 sales transactions

The data is realistic and follows proper foreign key relationships.


## OLAP Analytics Queries

### 3. analytics_queries.sql
This file contains analytical SQL queries written on the star schema.

Queries included:
1. **Monthly Sales Drill-Down Analysis**  
   - Shows sales by year, quarter, and month for 2024

2. **Top 10 Products by Revenue**  
   - Identifies best-performing products with revenue contribution

3. **Customer Segmentation Analysis**  
   - Segments customers into High, Medium, and Low value based on spending

These queries demonstrate how the data warehouse supports business analysis.


## Tools Used

- MySQL 8.0
- MySQL Workbench
- SQL


## Key Learnings

- Understood the difference between transactional databases and data warehouses
- Learned how to design a star schema
- Practiced writing OLAP queries for business analysis
- Learned how dimensions and fact tables work together


## Conclusion

This part of the assignment shows how a data warehouse can be used to analyze
sales data effectively. The star schema design and OLAP queries help management
take better business decisions based on historical data.
