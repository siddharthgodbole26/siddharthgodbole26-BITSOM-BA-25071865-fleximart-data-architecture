# Part 2: NoSQL Database Analysis – MongoDB

## Overview

In this part of the assignment, MongoDB is used to handle flexible and diverse product data for FlexiMart. The goal is to understand why NoSQL databases are suitable for product catalogs that have different attributes and nested data like customer reviews.

This part includes a theory-based analysis of NoSQL concepts and practical MongoDB operations using real product data.

### Theory Report – nosql_analysis.md

The file `nosql_analysis.md` contains the theoretical justification for
using MongoDB instead of a traditional relational database.

It includes:
- **Limitations of RDBMS** such as rigid schema design, difficulty in handling
  variable product attributes, and challenges with nested data like reviews.
- **Benefits of MongoDB**, including flexible document schema, embedded
  documents for reviews, and horizontal scalability.
- **Trade-offs**, explaining disadvantages like lack of joins and weaker
  transactional guarantees compared to MySQL.

This report strictly follows the word limits and structure provided in
the assignment.

###  Sample Data – products_catalog.json

The file `products_catalog.json` contains sample product data across
multiple categories with nested attributes such as specifications and
customer reviews. This data was used for MongoDB practical operations.

###  MongoDB Practical Operations

MongoDB practical tasks were implemented and verified using **two approaches**
to ensure clarity and proof of execution.

MongoDB Compass was used to visually verify query results,
while MongoDB Shell and Python were used for execution.


#### Option 1: MongoDB Shell Script (mongodb_operations.js)

The file `mongodb_operations.js` contains all **5 required MongoDB operations**
written in MongoDB shell syntax:

1. Importing product data into the `products` collection  
2. Querying Electronics products priced below ₹50,000  
3. Aggregation to find products with average rating ≥ 4.0  
4. Updating a document by adding a new review to product `ELEC001`  
5. Aggregation to calculate average price and product count by category  

These operations were executed using MongoDB Compass and MongoDB Shell.
Screenshots are provided as execution proof.

#### Option 2: Python Implementation (mongodb_operation.py)

To further demonstrate understanding, the same MongoDB operations were
also implemented using Python with the `pymongo` library.

The file `mongodb_operation.py` performs:
- Database connection to MongoDB
- JSON data loading into MongoDB
- Query operations
- Aggregation pipelines
- Update operations

Execution output is visible in the terminal, confirming that all
operations ran successfully.

###  Dependencies

The required Python library for MongoDB operations is listed
in requirements.txt to make execution easier.

###  Outcome

Both MongoDB shell and Python-based implementations successfully meet
the assignment requirements. This ensures flexibility in evaluation and
provides clear proof of execution for all required MongoDB operations.
This part helped in understanding how NoSQL databases handle
real-world product data more effectively than relational databases.
