####  NoSQL Analysis – MongoDB for FlexiMart Product Catalog

##  Section A: Limitations of RDBMS (Relational Database) – ~150 words

Relational databases like MySQL work very well when the data structure is fixed and similar for all records. However, in the case of FlexiMart, products can have very different attributes. For example, electronic products like laptops have RAM, processor, and storage, while fashion products like shoes have size, color, and material. In an RDBMS, this would require creating many additional columns or separate tables, which makes the database complex and hard to manage.

Another limitation is frequent schema changes. Whenever a new product type is added, the table structure must be altered, which is risky and time-consuming. This can also affect existing queries and applications.

Storing customer reviews is also difficult in relational databases because reviews are naturally nested data. Managing reviews would require multiple tables and joins, which reduces performance and increases query complexity.

##  Section B: Benefits of NoSQL (MongoDB) – ~150 words

MongoDB solves many of the problems faced by relational databases in handling diverse product data. MongoDB uses a flexible document-based schema, which means each product can store its own attributes without following a strict structure. This allows FlexiMart to store different types of products like electronics and fashion items in the same collection.

MongoDB also supports embedded documents, which makes it easy to store customer reviews directly inside the product document. This improves read performance and avoids complex joins.

Another major advantage of MongoDB is horizontal scalability. MongoDB can easily handle large volumes of data by distributing it across multiple servers. As FlexiMart grows and adds more products and reviews, MongoDB can scale efficiently without major changes in application logic.

Overall, MongoDB provides flexibility, better performance for nested data, and easy scalability.

##  Section C: Trade-offs of Using MongoDB – ~100 words

Although MongoDB has many advantages, it also has some disadvantages compared to MySQL. One drawback is weaker support for complex transactions. Relational databases handle multi-table transactions more reliably, which is important for financial data.

Another disadvantage is data consistency. MongoDB follows eventual consistency in some cases, which may not be suitable for systems that require strict consistency. Also, enforcing relationships like foreign keys is not automatic in MongoDB, so the application must handle data integrity manually.