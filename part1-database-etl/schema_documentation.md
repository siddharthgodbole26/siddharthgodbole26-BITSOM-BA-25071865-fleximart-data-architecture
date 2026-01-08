# FlexiMart Database Schema Documentation

## Entity-Relationship Description

### ENTITY: customers
**Purpose:** Stores customer information for FlexiMart.

**Attributes:**
- customer_id: Unique identifier for each customer (Primary Key)
- first_name: First name of the customer
- last_name: Last name of the customer
- email: Email address of the customer (must be unique)
- phone: Contact number of the customer
- city: City where the customer lives
- registration_date: Date when the customer registered on the platform

**Relationships:**
- One customer can place MANY orders (1:M relationship with orders table)


### ENTITY: products
**Purpose:** Stores details of products that are available for sale.

**Attributes:**
- product_id: Unique identifier for each product (Primary Key)
- product_name: Name of the product
- category: Category to which the product belongs (Electronics, Fashion, Groceries)
- price: Selling price of the product
- stock_quantity: Number of units available in stock


### ENTITY: orders
**Purpose:** Stores order-level information for each transaction.

**Attributes:**
- order_id: Unique identifier for each order (Primary Key)
- customer_id: Identifies the customer who placed the order (Foreign Key)
- order_date: Date on which the order was placed
- total_amount: Total amount of the order
- status: Current status of the order (Completed, Pending, Cancelled)


### ENTITY: order_items
**Purpose:** Stores detailed information about products included in each order.

**Attributes:**
- order_item_id: Unique identifier for each order item (Primary Key)
- order_id: References the related order (Foreign Key)
- product_id: References the ordered product (Foreign Key)
- quantity: Number of units ordered
- unit_price: Price per unit at the time of purchase
- subtotal: Calculated as quantity multiplied by unit_price


## Normalization Explanation (3NF)

The FlexiMart database schema follows the principles of Third Normal Form (3NF) to reduce data redundancy and maintain data accuracy. In this design, each table contains data that depends only on its primary key, and no attribute depends on another non-key attribute.

In the customers table, all details such as name, email, phone, city, and registration date depend only on the customer_id. The products table stores product-related information that depends only on product_id. The orders table stores order-level details separately, which avoids repeating customer information for every order. The order_items table further breaks down each order into individual product entries, so product and order data are not duplicated.

The main functional dependencies are:
- customer_id → customer details
- product_id → product details
- order_id → order details
- order_item_id → order item details

This structure helps avoid update anomalies because customer or product information needs to be updated in only one place. Insert anomalies are avoided since new customers or products can be added without creating orders. Delete anomalies are also prevented because deleting an order does not remove customer or product data. Overall, the schema ensures clean data storage and efficient database management.


## Sample Data Representation

### customers

| customer_id | first_name | last_name | email           | city      |
|------------|-----------|-----------|-----------------|-----------|
| 1          | Rahul     | Sharma    | rahul@gmail.com | Bangalore |
| 2          | Priya     | Patel     | priya@yahoo.com | Mumbai    |

### products

| product_id | product_name       | category    | price |
|-----------|--------------------|-------------|-------|
| 1         | Samsung Galaxy S21 | Electronics | 45999 |
| 2         | Nike Running Shoes | Fashion     | 3499  |

### orders

| order_id | customer_id | order_date  | total_amount |
|---------|-------------|-------------|--------------|
| 101     | 1           | 2024-01-15  | 45999        |
| 102     | 2           | 2024-02-10  | 5998         |

### order_items

| order_item_id | order_id | product_id | quantity | subtotal |
|--------------|----------|------------|----------|----------|
| 1            | 101      | 1          | 1        | 45999    |
| 2            | 102      | 2          | 2        | 5998     |
