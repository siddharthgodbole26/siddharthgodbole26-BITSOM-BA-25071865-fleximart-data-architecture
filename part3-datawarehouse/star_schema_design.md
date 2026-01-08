# Star Schema Design – FlexiMart Data Warehouse

## Section 1: Schema Overview

The FlexiMart data warehouse is designed using a star schema to support
analytical reporting and historical sales analysis. The central fact
table captures sales transactions, while the surrounding dimension
tables provide descriptive context.

### FACT TABLE: fact_sales

**Grain:**  
One row per product per order line item.

**Business Process:**  
Sales transactions generated from customer orders.

**Measures (Numeric Facts):**
- quantity_sold: Number of units sold per product
- unit_price: Price of a single unit at the time of sale
- discount_amount: Discount applied on the sale
- total_amount: Final sale amount (quantity × unit_price − discount)

**Foreign Keys:**
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

### DIMENSION TABLE: dim_date

**Purpose:**  
Provides time-based attributes for sales analysis.

**Type:**  
Conformed dimension.

**Attributes:**
- date_key (PK): Surrogate key in YYYYMMDD format
- full_date: Actual calendar date
- day_of_week: Name of the day
- day_of_month: Day number
- month: Month number (1–12)
- month_name: Month name
- quarter: Quarter of the year (Q1–Q4)
- year: Calendar year
- is_weekend: Boolean indicator for weekend

### DIMENSION TABLE: dim_product

**Purpose:**  
Stores descriptive information about products.

**Attributes:**
- product_key (PK): Surrogate key
- product_id: Business product identifier
- product_name: Name of the product
- category: Product category
- subcategory: Product subcategory
- unit_price: Standard product price

### DIMENSION TABLE: dim_customer

**Purpose:**  
Stores customer-related descriptive data.

**Attributes:**
- customer_key (PK): Surrogate key
- customer_id: Business customer identifier
- customer_name: Full name of the customer
- city: Customer city
- state: Customer state
- customer_segment: Segment classification

## Section 2: Design Decisions

The granularity of the fact table is defined at the transaction line-item
level to enable detailed analysis of individual product sales within
orders. This level of detail supports accurate revenue calculations and
allows flexible aggregation across different dimensions.

Surrogate keys are used instead of natural keys to ensure consistency and
performance. Natural keys from source systems may change or vary across
systems, while surrogate keys provide stable, system-independent
identifiers optimized for joins.

This star schema design supports both drill-down and roll-up operations.
Users can analyze data at a high level, such as yearly or category-wise
sales, and drill down to finer levels like monthly, daily, or
product-level performance using dimension attributes.

## Section 3: Sample Data Flow

**Source Transaction:**  
Customer "Amit Sharma" purchased 1 unit of "Laptop Pro" on 1st January 2024
for a price of 55,000.

**Data Warehouse Representation:**

**fact_sales:**  
{
  date_key: 20240101,
  product_key: 1,
  customer_key: 1,
  quantity_sold: 1,
  unit_price: 55000,
  discount_amount: 0,
  total_amount: 55000
}

**dim_date:**  
{
  date_key: 20240101,
  full_date: '2024-01-01',
  month: 1,
  quarter: 'Q1',
  year: 2024
}

**dim_product:**  
{
  product_key: 1,
  product_name: 'Laptop Pro',
  category: 'Electronics'
}

**dim_customer:**  
{
  customer_key: 1,
  customer_name: 'Amit Sharma',
  city: 'Delhi'
}
