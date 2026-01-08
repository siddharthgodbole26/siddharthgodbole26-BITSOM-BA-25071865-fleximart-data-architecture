-- Task 3.2
-- This file inserts minimum required data into the star schema


-- ** DIMENSION: dim_date (30 dates: Jan-Feb 2024)**
INSERT INTO dim_date
(date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend)
VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,FALSE),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,FALSE),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,FALSE),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,FALSE),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,FALSE),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,TRUE),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,TRUE),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,FALSE),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,FALSE),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,FALSE),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,FALSE),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,FALSE),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,TRUE),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,TRUE),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,FALSE),

(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,FALSE),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,FALSE),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,TRUE),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,TRUE),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,FALSE),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,FALSE),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,FALSE),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,FALSE),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,FALSE),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,TRUE),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,TRUE),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,FALSE),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,FALSE),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,FALSE),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,FALSE);


-- ** DIMENSION: dim_product (15 products, 3 categories)**
INSERT INTO dim_product
(product_id, product_name, category, subcategory, unit_price)
VALUES
('P001','Laptop Pro','Electronics','Laptop',55000),
('P002','Smartphone X','Electronics','Mobile',32000),
('P003','LED TV 55','Electronics','TV',72000),
('P004','Bluetooth Headphones','Electronics','Audio',6000),
('P005','Smart Watch','Electronics','Wearable',15000),

('P006','Jeans','Fashion','Clothing',2200),
('P007','T-Shirt','Fashion','Clothing',1200),
('P008','Sneakers','Fashion','Footwear',4200),
('P009','Jacket','Fashion','Outerwear',5200),
('P010','Cap','Fashion','Accessories',800),

('P011','Mixer Grinder','Home','Kitchen',6500),
('P012','Vacuum Cleaner','Home','Appliance',14500),
('P013','Air Purifier','Home','Appliance',18500),
('P014','Water Heater','Home','Bathroom',9500),
('P015','Table Lamp','Home','Decor',2800);


-- **DIMENSION: dim_customer (12 customers, 4 cities)**
INSERT INTO dim_customer
(customer_id, customer_name, city, state, customer_segment)
VALUES
('C001','Amit Sharma','Delhi','Delhi','Retail'),
('C002','Neha Verma','Mumbai','Maharashtra','Retail'),
('C003','Ravi Kumar','Bangalore','Karnataka','Corporate'),
('C004','Pooja Singh','Pune','Maharashtra','Retail'),
('C005','Arjun Mehta','Delhi','Delhi','Corporate'),
('C006','Kiran Rao','Mumbai','Maharashtra','Retail'),
('C007','Sonal Jain','Bangalore','Karnataka','Retail'),
('C008','Rahul Nair','Pune','Maharashtra','Corporate'),
('C009','Manish Gupta','Delhi','Delhi','Retail'),
('C010','Anita Desai','Mumbai','Maharashtra','Corporate'),
('C011','Deepak Joshi','Bangalore','Karnataka','Retail'),
('C012','Ritu Malhotra','Pune','Maharashtra','Retail');


-- ** FACT TABLE: fact_sales (40 transactions)**
INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240101,1,1,1,55000,0,55000),
(20240102,2,2,2,32000,2000,62000),
(20240103,3,3,1,72000,0,72000),
(20240104,4,4,3,6000,0,18000),
(20240105,5,5,2,15000,1000,29000),
(20240106,6,6,4,2200,0,8800),
(20240107,7,7,3,1200,0,3600),
(20240108,8,8,2,4200,500,7900),
(20240109,9,9,1,5200,0,5200),
(20240110,10,10,5,800,0,4000),

(20240201,11,11,1,6500,0,6500),
(20240202,12,12,2,14500,2000,27000),
(20240203,13,1,1,18500,0,18500),
(20240204,14,2,3,9500,1500,27000),
(20240205,15,3,2,2800,0,5600),

(20240206,1,4,1,55000,0,55000),
(20240207,2,5,1,32000,0,32000),
(20240208,3,6,2,72000,5000,139000),
(20240209,4,7,2,6000,0,12000),
(20240210,5,8,3,15000,2000,43000),

(20240211,6,9,2,2200,0,4400),
(20240212,7,10,4,1200,0,4800),
(20240213,8,11,1,4200,0,4200),
(20240214,9,12,2,5200,0,10400),
(20240115,10,1,6,800,0,4800),

(20240114,11,2,2,6500,0,13000),
(20240113,12,3,1,14500,0,14500),
(20240112,13,4,2,18500,2000,35000),
(20240111,14,5,1,9500,0,9500),
(20240110,15,6,3,2800,0,8400),

(20240109,1,7,1,55000,0,55000),
(20240108,2,8,2,32000,3000,61000),
(20240107,3,9,1,72000,0,72000),
(20240106,4,10,2,6000,0,12000),
(20240105,5,11,1,15000,0,15000),
(20240215,6,3,2,2200,0,4400),
(20240214,7,4,3,1200,0,3600),
(20240213,8,5,1,4200,0,4200),
(20240212,9,6,2,5200,0,10400),
(20240211,10,7,4,800,0,3200);