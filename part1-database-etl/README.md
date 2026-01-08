Part 1: Database Design and ETL Pipeline – FlexiMart
Objective
The objective of Part 1 is to design a relational database and implement a complete ETL (Extract, Transform, Load) pipeline for FlexiMart. Raw customer, product, and sales data is cleaned, standardized, and loaded into a MySQL database to support analytical and business queries.

Repository Structure
part1-database-etl ├──etl_pipeline.py ├──order_items_loader.py ├──schema_documentation.md ├──business_queries.sql ├──data_quality_report.txt ├──requirements.txt

Technologies Used
Python 3
pandas
mysql-connector-python
mysql
Input Data Files
The following raw CSV files are used as input:

customers_raw.csv
Contains customer details with missing emails, duplicate records, inconsistent phone formats, and inconsistent date formats.

products_raw.csv
Contains product data with missing prices, inconsistent category naming, and null stock values.

sales_raw.csv
Contains sales transactions with duplicate transaction IDs, missing foreign keys, and inconsistent date formats.

ETL Pipeline Overview
Extract
All raw CSV files are read using Python and pandas.
Transform
The following data cleaning and transformations are applied:

Removal of duplicate records in customers and sales data.
Handling missing values:
Missing customer emails are auto-generated.
Missing product prices are filled using category-wise median values.
Missing stock quantities are set to 0.
Standardization of phone numbers to +91-XXXXXXXXXX format.
Standardization of product category names.
Conversion of all date fields to YYYY-MM-DD format.
Calculation of total transaction amount for sales data.
Load
Cleaned customer data is loaded into the customers table.
Cleaned product data is loaded into the products table.
Cleaned sales data is loaded into the orders table.
Order line-item data is loaded into the order_items table using a separate loader script.
Scripts and Files
etl_pipeline.py
Main ETL script responsible for cleaning and loading customers, products, and orders data.

order_items_loader.py
Dedicated script for loading order line-item data into the order_items table using transaction-to-order and product mappings.

data_quality_report.txt
Report summarizing records processed, duplicates removed, missing values handled, and records successfully loaded.

schema_documentation.md
Database schema documentation including entity descriptions, relationships, normalization explanation, and sample data.

business_queries.sql
SQL queries that answer business questions using the cleaned and loaded data.

requirements.txt
Python dependencies required to run the ETL scripts.

How to Run
Create the MySQL database:

CREATE DATABASE fleximart;
pip install -r requirements.txt;

python etl_pipeline.py;

python order_items_loader.py;

Verify data in MySQL tables:

customers

products

orders

order_items;

Key Learnings
Designed and implemented an end-to-end ETL pipeline. Improved data quality by handling duplicates, missing values, and inconsistent formats. Gained practical experience in relational database design and normalization. Applied mysql to solve real-world business problems using aggregated data.