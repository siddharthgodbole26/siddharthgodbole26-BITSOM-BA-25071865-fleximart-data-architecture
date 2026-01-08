
#FlexiMart Order Items Loader
#Responsibilities:
#- Load order_items using:
#  orders.transaction_id
#  products_clean.csv
#- Run ONLY after etl_pipeline.py

import pandas as pd
import mysql.connector

print(" ORDER ITEMS LOADER STARTED")

# MYSQL CONNECTION
db_conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="sid@2611",
    database="fleximart"
)

cursor = db_conn.cursor()
print(" MySQL connected")

# LOAD CLEAN SALES CSV
sales_df = pd.read_csv("../data/sales_clean.csv")
print(" sales_clean.csv loaded:", len(sales_df))

# LOAD CLEAN PRODUCTS CSV
products_df = pd.read_csv("../data/products_clean.csv")
print(" products_clean.csv loaded:", len(products_df))

# ORDER MAP (transaction_id → order_id)
cursor.execute("""
    SELECT transaction_id, order_id
    FROM orders
""")

order_id_map = {
    str(transaction_id): order_id
    for transaction_id, order_id in cursor.fetchall()
}

print(" order_id_map size:", len(order_id_map))

# PRODUCT LOOKUP (CSV product_id → product_name)
product_lookup = {
    row["product_id"]: row["product_name"].strip().lower()
    for _, row in products_df.iterrows()
}

print(" product_lookup size:", len(product_lookup))

# PRODUCT MAP (product_name → DB product_id)
cursor.execute("""
    SELECT product_id, product_name
    FROM products
""")

product_map = {
    product_name.strip().lower(): product_id
    for product_id, product_name in cursor.fetchall()
}

print(" product_map size:", len(product_map))

# INSERT ORDER ITEMS

insert_sql = """
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)
VALUES (%s, %s, %s, %s, %s)
"""

inserted = 0
skipped = 0

for _, row in sales_df.iterrows():

    transaction_id = str(row["transaction_id"])
    order_id = order_id_map.get(transaction_id)

    product_code = row["product_id"]          # P001
    product_name = product_lookup.get(product_code)
    db_product_id = product_map.get(product_name)

    if order_id is None or db_product_id is None:
        skipped += 1
        continue

    cursor.execute(
        insert_sql,
        (
            order_id,
            db_product_id,
            int(row["quantity"]),
            float(row["unit_price"]),
            float(row["quantity"] * row["unit_price"])
        )
    )
    inserted += 1

db_conn.commit()

print(" Order items inserted:", inserted)
print(" Rows skipped:", skipped)

cursor.close()
db_conn.close()
print(" Database connection closed")

