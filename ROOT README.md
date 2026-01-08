## FlexiMart Data Architecture Project

## Student Details
- **Student Name: siddharth godbole  
- **Student ID: BITSom_BA_25071865 
- **Email:siddharthbgodbole@gmail.com**  
- **Date: 02-01-2026


## Project Overview

This project demonstrates a complete data architecture solution for
FlexiMart, an e-commerce company. The work covers data ingestion,
database design, NoSQL analysis, and data warehousing with analytics.

The project is divided into three main parts:
- Relational database and ETL pipeline
- NoSQL database analysis using MongoDB
- Data warehouse design and OLAP analytics


## Repository Structure

studentID-fleximart-data-architecture/
│
├── data/
│ ├── customers_raw.csv
│ ├── products_raw.csv
│ └── sales_raw.csv
│
├── part1-database-etl/
│ ├── etl_pipeline.py
│ ├── schema_documentation.md
│ ├── business_queries.sql
│ ├── data_quality_report.txt
│ └── requirements.txt
│
├── part2-nosql/
│ ├── nosql_analysis.md
│ ├── mongodb_operations.js
│ ├── mongodb_operation.py
│ ├── products_catalog.json
│ └── requirements.txt
│
├── part3-datawarehouse/
│ ├── star_schema_design.md
│ ├── warehouse_schema.sql
│ ├── warehouse_data.sql
│ ├── analytics_queries.sql
│ └── README.md
│
└── README.md

## Part 1: Database Design and ETL Pipeline

- Raw CSV files were cleaned and processed using Python  
- Data quality issues like missing values and duplicates were handled  
- Cleaned data was loaded into a MySQL relational database  
- Database schema and relationships were documented  
- Business SQL queries were written to answer analytical questions  

## Part 2: NoSQL Database Analysis (MongoDB)

This part focuses on evaluating MongoDB as a NoSQL solution for managing
flexible and diverse product catalog data at FlexiMart.

### Theory Report – `nosql_analysis.md`

The file `nosql_analysis.md` contains the theoretical analysis required
in Task 2.1 of the assignment.

It explains:
- Limitations of relational databases when handling flexible product attributes  
- Benefits of MongoDB such as flexible schema and embedded documents  
- Trade-offs of using MongoDB compared to MySQL  

The content follows the structure and word limits specified in the assignment.

### Sample Data – `products_catalog.json`

This file contains product catalog data with nested attributes like
specifications and customer reviews. The same data was used for all
MongoDB practical operations.

### MongoDB Practical Implementation

The practical requirements of Task 2.2 were completed using two approaches
to clearly demonstrate execution and understanding.

#### 1. MongoDB Shell Script – `mongodb_operations.js`

This file contains all **five required MongoDB operations**:

1. Importing product data into the `products` collection  
2. Querying Electronics products priced below ₹50,000  
3. Aggregation to find products with average rating ≥ 4.0  
4. Updating a product document by adding a new review to `ELEC001`  
5. Aggregation to calculate average price and product count by category  

These operations were executed using MongoDB Compass and MongoDB Shell.
Screenshots were taken as proof of execution.

#### 2. Python Implementation – `mongodb_operation.py`

The same MongoDB operations were also implemented using Python with
the `pymongo` library to demonstrate additional understanding.

This file includes:
- MongoDB database connection  
- JSON data loading  
- Query and aggregation pipelines  
- Update operations  

Successful execution is visible through terminal output.

### Dependencies

All Python dependencies required for MongoDB operations are listed in  
`part2-nosql/requirements.txt`.

Main dependency:
- pymongo

## Part 3: Data Warehouse and Analytics

- A star schema was designed using fact and dimension tables  
- Data warehouse tables were created in MySQL  
- Sample data was inserted as per assignment requirements  
- OLAP queries were written for:
  - Time-based analysis  
  - Product performance analysis  
  - Customer segmentation  
- Queries demonstrate drill-down and aggregation capabilities  

## Technologies Used

- Python 3  
- Pandas  
- mysql-connector-python  
- MySQL 8.0  
- MySQL Workbench  
- MongoDB  
- MongoDB Compass  
- SQL  

## Setup Instructions

### MySQL Setup

```sql
CREATE DATABASE fleximart;
CREATE DATABASE fleximart_dw;
``` 

#### Run files in this order:

1. etl_pipeline.py

2. business_queries.sql

3. warehouse_schema.sql

4. warehouse_data.sql

5. analytics_queries.sql

####  MongoDB Setup

Open MongoDB Compass

Create database and collection

Import products_catalog.json

Run queries from mongodb_operations.js

####  Key Learnings

Learned how ETL pipelines work in real projects

Understood differences between SQL and NoSQL databases

Learned star schema and data warehouse concepts

Practiced writing OLAP queries for business analysis

#### Challenges Faced

Handling inconsistent raw data formats

Designing a proper star schema

Understanding foreign key relationships

Running and verifying analytical queries

These challenges helped in better understanding of data architecture concepts.

####  Conclusion

This project demonstrates an end-to-end data architecture solution
from raw data ingestion to advanced analytics. The design follows
industry practices and fulfills all assignment requirements.
