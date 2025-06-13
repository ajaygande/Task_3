-- 01: Create the 'orders' Table
-- This query creates the main 'orders' table in the 'ecommerce' database.
-- The table includes essential fields for customer, product, and transaction details,
-- which will be used for further sales and performance analysis. 

USE ecommerce;
CREATE TABLE orders (
    Order_Date DATE,
    Time TIME,
    Aging INT,
    Customer_Id INT,
    Gender VARCHAR(10),
    Device_Type VARCHAR(50),
    Customer_Login_type VARCHAR(50),
    Product_Category VARCHAR(100),
    Product VARCHAR(100),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    Shipping_Cost DECIMAL(10,2),
    Order_Priority VARCHAR(20),
    Payment_method VARCHAR(50)
);

-- 02: Analyze Sales by Product Category for Male Mobile Users
-- This query calculates the total sales and average profit for each product category
-- specifically for male customers using a mobile device.
-- It uses SELECT, WHERE, GROUP BY, and ORDER BY clauses to filter, group, and sort the data.
-- Results are sorted in descending order of total sales to highlight top-performing categories.

SELECT 
    Product_Category,
    SUM(Sales) AS Total_Sales,
    AVG(Profit) AS Avg_Profit
FROM 
    orders
WHERE 
    Gender = 'Male' 
    AND Device_Type = 'Mobile'
GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC;

-- 03: Join Orders with Customer Information
-- This task demonstrates the use of JOIN operations between the 'orders' and 'customers' tables.

-- Step 1: Create the 'customers' table with Customer_Id as the primary key.
CREATE TABLE customers (
    Customer_Id INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100)
);

-- Step 2: INNER JOIN
-- Retrieves only those orders that have matching customer information.
SELECT 
    o.Order_Date, o.Product, o.Sales, c.Customer_Name, c.Email
FROM 
    orders o
INNER JOIN 
    customers c ON o.Customer_Id = c.Customer_Id;

-- Step 3: LEFT JOIN
-- Retrieves all orders, including those without customer information (if any customers are missing in the 'customers' table).
SELECT 
    o.Order_Date, o.Product, o.Sales, c.Customer_Name
FROM 
    orders o
LEFT JOIN 
    customers c ON o.Customer_Id = c.Customer_Id;

-- Step 4: RIGHT JOIN
-- Retrieves all customers, including those who have not placed any orders.
SELECT 
    c.Customer_Name, o.Product, o.Sales
FROM 
    orders o
RIGHT JOIN 
    customers c ON o.Customer_Id = c.Customer_Id;

-- 04: Use of Subquery to Filter High-Spending Customers
-- This query identifies customers whose total sales exceed the average individual sale amount.
-- It uses a scalar subquery within the HAVING clause to compare each customer's total sales
-- against the overall average sale from the 'orders' table.
SELECT 
    Customer_Id, SUM(Sales) AS Total_Sales
FROM 
    orders
GROUP BY 
    Customer_Id
HAVING 
    Total_Sales > (
        SELECT AVG(Sales) FROM orders
    );

-- 05: Aggregate Sales and Profit by Device Type
-- This query uses aggregate functions (SUM and AVG) to analyze total sales and average profit
-- for each type of device used by customers.
-- Grouping by 'Device_Type' helps identify which platforms generate more revenue and profitability.
SELECT 
    Device_Type,
    SUM(Sales) AS Total_Sales,
    AVG(Profit) AS Avg_Profit
FROM 
    orders
GROUP BY 
    Device_Type;

-- 06: Creating a View for Product Category Sales Summary
-- This task creates a view named 'ProductCategorySalesSummary' that summarizes sales data
-- by product category. It includes:
-- - Total sales
-- - Average profit
-- - Total number of orders per category
-- 
-- The view simplifies repeated analysis and allows querying summarized data directly.
-- The final SELECT statement retrieves all records from the created view.
CREATE VIEW ProductCategorySalesSummary AS
SELECT 
    Product_Category,
    SUM(Sales) AS Total_Sales,
    AVG(Profit) AS Average_Profit,
    COUNT(*) AS Total_Orders
FROM 
    orders
GROUP BY 
    Product_Category;

SELECT * FROM ProductCategorySalesSummary;

-- 07: Creating Indexes for Query Optimization
-- This task demonstrates the use of indexes to improve query performance on large datasets.
-- Indexes are created on frequently searched columns:
-- - Customer_Id
-- - Product_Category
-- - Order_Priority
-- - Payment_method
--
-- These indexes help speed up queries involving WHERE clauses, especially when filtering on these fields.
-- The final SELECT query shows an example where an index on 'Customer_Id' enhances retrieval efficiency.
CREATE INDEX idx_customer_id ON orders(Customer_Id);
CREATE INDEX idx_product_category ON orders(Product_Category);
CREATE INDEX idx_order_priority ON orders(Order_Priority);
CREATE INDEX idx_payment_method ON orders(Payment_method);
SELECT * FROM orders WHERE Customer_Id = 101;
