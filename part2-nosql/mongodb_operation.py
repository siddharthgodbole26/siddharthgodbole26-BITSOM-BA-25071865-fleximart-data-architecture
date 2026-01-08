# =========================================
# MongoDB Operations - Part 2 (Python)
# =========================================

from pymongo import MongoClient
import json
from datetime import datetime

# -----------------------------------------
# MongoDB Connection
# -----------------------------------------

# Connect to local MongoDB server
client = MongoClient("mongodb://localhost:27017/")

# Select database
db = client["fleximart_nosql"]

# Select collection
products = db["products"]

print("Connected to MongoDB successfully")

# -----------------------------------------
# Operation 1: Load Data
# -----------------------------------------
# Import products_catalog.json into 'products' collection

with open("products_catalog.json", "r", encoding="utf-8") as file:
    product_data = json.load(file)

# Clear collection to avoid duplicates
products.delete_many({})

# Insert data
products.insert_many(product_data)

print("Operation 1 complete: Data loaded into products collection")

# -----------------------------------------
# Operation 2: Basic Query
# -----------------------------------------
# Find Electronics products with price < 50000
# Return only name, price, and stock

print("\nOperation 2: Electronics products with price < 50000")

query_2 = products.find(
    {
        "category": "Electronics",
        "price": {"$lt": 50000}
    },
    {
        "_id": 0,
        "name": 1,
        "price": 1,
        "stock": 1
    }
)

for product in query_2:
    print(product)

# -----------------------------------------
# Operation 3: Review Analysis
# -----------------------------------------
# Find products with average rating >= 4.0

print("\nOperation 3: Products with average rating >= 4.0")

pipeline_3 = [
    {"$unwind": "$reviews"},
    {
        "$group": {
            "_id": "$name",
            "avg_rating": {"$avg": "$reviews.rating"}
        }
    },
    {
        "$match": {
            "avg_rating": {"$gte": 4.0}
        }
    }
]

result_3 = products.aggregate(pipeline_3)

for item in result_3:
    print(item)

# -----------------------------------------
# Operation 4: Update Operation
# -----------------------------------------
# Add a new review to product ELEC001

print("\nOperation 4: Adding new review to ELEC001")

new_review = {
    "user": "U999",
    "rating": 4,
    "comment": "Good value",
    "date": datetime.now()
}

products.update_one(
    {"product_id": "ELEC001"},
    {"$push": {"reviews": new_review}}
)

print("New review added successfully")

# -----------------------------------------
# Operation 5: Complex Aggregation
# -----------------------------------------
# Calculate average price by category

print("\nOperation 5: Average price by category")

pipeline_5 = [
    {
        "$group": {
            "_id": "$category",
            "avg_price": {"$avg": "$price"},
            "product_count": {"$sum": 1}
        }
    },
    {
        "$sort": {"avg_price": -1}
    }
]

result_5 = products.aggregate(pipeline_5)

for item in result_5:
    print(item)

# -----------------------------------------
# End of MongoDB Operations
# -----------------------------------------
