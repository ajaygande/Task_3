# SQL Operations on E-commerce Dataset (MySQL Workbench Project)

This project showcases a series of **SQL operations** performed on an **E-commerce dataset** using **MySQL Workbench**.  
The goal was to explore, analyze, and optimize data to derive **actionable insights**.  

All tasks were executed using SQL queries, and **screenshots of query results** are included in this repository for reference.

---

## Tasks Performed

### Basic SQL Queries
- Used `SELECT`, `WHERE`, `ORDER BY`, and `GROUP BY` clauses to explore data.
- Analyzed customer behavior, product categories, and order priorities.

### JOINS (INNER, LEFT, RIGHT)
- Joined the `orders` table with a hypothetical `customers` table.
- Demonstrated `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` to show different join results and use cases.

### Subqueries
- Used subqueries to extract insights such as:
  - Customers with total sales above average.
  - Orders with high profits or discounts.

### Aggregate Functions
- Applied `SUM()`, `AVG()`, and `COUNT()` functions to analyze:
  - Sales performance
  - Average profits
  - Number of orders

### Views for Analysis
- Created reusable SQL **views** like:
  - `HighPriorityOrders`
  - `ProductCategorySalesSummary`
- Made recurring analysis faster and cleaner.

### Indexes for Optimization
- Created **indexes** on frequently used columns:
  - `Customer_Id`, `Product_Category`, `Order_Priority`, `Payment_method`
- Demonstrated how indexing improves **query performance**.
- Included example of **multi-column indexes** and indexing strategies.

---

## Dataset Attributes Used

- `Order_Date`, `Time`, `Aging`  
- `Customer_Id`, `Gender`, `Device_Type`, `Customer_Login_type`  
- `Product_Category`, `Product`, `Sales`, `Quantity`, `Discount`, `Profit`, `Shipping_Cost`  
- `Order_Priority`, `Payment_method`

---

## Screenshots

Screenshots of all SQL tasks and output results (taken from **MySQL Workbench**) are included in the `/screenshots` folder for reference and transparency.

---

## Note

> This is a **beginner to intermediate-level project** designed to showcase SQL skills on real-world e-commerce-style data.
