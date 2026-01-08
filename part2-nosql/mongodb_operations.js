
/***************************************************
MongoDB Operations File
Assignment: Part 2 – NoSQL Practical
Student: (siddharth godbole)
Database: fleximart_nosql
Collection: products
***************************************************/

/*
Select database
*/
use fleximart_nosql;

/*
---------------------------------------------------
Operation 1: Load Data
---------------------------------------------------
Data is already imported using MongoDB Compass
or mongoimport command as shown below.

mongoimport --db fleximart_nosql --collection products \
--file products_catalog.json --jsonArray
*/


/*
Operation 2: Basic Query
Find all Electronics products with price < 50000
Show only name, price and stock
*/

db.products.find(
  {
    category: "Electronics",
    price: { $lt: 50000 }
  },
  {
    _id: 0,
    name: 1,
    price: 1,
    stock: 1
  }
);


/*
Operation 3: Review Analysis
Find products having average rating >= 4.0
*/

db.products.aggregate([
  {
    $unwind: "$reviews"
  },
  {
    $group: {
      _id: "$name",
      average_rating: { $avg: "$reviews.rating" }
    }
  },
  {
    $match: {
      average_rating: { $gte: 4.0 }
    }
  }
]);


/*
Operation 4: Update Operation
Add a new review to product ELEC001
*/

db.products.updateOne(
  { product_id: "ELEC001" },
  {
    $push: {
      reviews: {
        user_id: "U999",
        username: "StudentUser",
        rating: 4,
        comment: "Good value for money",
        date: new Date()
      }
    }
  }
);


/*
Operation 5: Complex Aggregation
Calculate average price by category
Also count number of products in each category
Sort by average price in descending order
*/

db.products.aggregate([
  {
    $group: {
      _id: "$category",
      avg_price: { $avg: "$price" },
      product_count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      category: "$_id",
      avg_price: 1,
      product_count: 1
    }
  },
  {
    $sort: { avg_price: -1 }
  }
]);
