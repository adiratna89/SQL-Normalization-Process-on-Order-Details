
# SQL Normalization on Order Details

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Database-336791?style=for-the-badge)
![Database Design](https://img.shields.io/badge/Database%20Design-Normalization-7c3aed?style=for-the-badge)

![1NF](https://img.shields.io/badge/1NF-First%20Normal%20Form-22c55e?style=for-the-badge)
![2NF](https://img.shields.io/badge/2NF-Second%20Normal%20Form-f59e0b?style=for-the-badge)
![3NF](https://img.shields.io/badge/3NF-Third%20Normal%20Form-ef4444?style=for-the-badge)

![GitHub](https://img.shields.io/badge/GitHub-121011?style=for-the-badge&logo=github&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-16a34a%3f?style=for-the-badge)

## Overview

This mini project demonstrates the normalization process in SQL using an `Order Details` dataset.  
The project begins with an unnormalized table and then transforms it step by step into a structured relational database design following 1NF, 2NF, and 3NF principles.

## Objective

The main objective of this project is to understand how database normalization improves data organization by:
- removing repeating groups,
- reducing redundancy,
- improving data consistency,
- and creating better relationships between tables.

## Project Flow

### Unnormalized Form
The initial table stores multiple products, suppliers, and quantities in single rows using comma-separated values, which makes the structure hard to manage and query.

### First Normal Form (1NF)
In 1NF, atomic values are enforced by splitting multi-value product data into separate rows so that each row contains only one product and one quantity.

### Second Normal Form (2NF)
To remove partial dependencies, the data is separated into multiple related tables:
- `customers`
- `Suppliers`
- `Products`

### Third Normal Form (3NF)
The final design uses an `Order_details` table with:
- `OrderID`
- `CustomerID`
- `ProductID`
- `Quantities`

This creates a normalized relational structure using primary keys, foreign keys, and a composite primary key for order-product mapping.

## Database Tables

The final normalized design includes:

- **customers**: stores customer information
- **Suppliers**: stores supplier details
- **Products**: stores product names and supplier references
- **Order_details**: stores transactional order data with quantity

## Key Concepts Used

- Unnormalized data
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)
- Primary Key
- Composite Primary Key
- Foreign Key
- Table Relationships
- SQL Joins

## Sample Final Query

The project ends with a SQL JOIN query to retrieve complete order information by combining:
- customer name,
- product name,
- quantity,
- and supplier name.

## File Included

- `SQL Normalization on Order_Details.sql` - SQL FILE
- `SQL Result of Normalization on Order_Details.csv` - Comma Seperated Value File 
- `SQL Normalized form of Order_Details.csv` - CSV FILE
- `SQL Unnormalized form of Order_Details.csv` - CSV FILE

## Tools Used

- SQL
- MySQL

## Learning Outcome

Through this project, I learned how to convert poorly structured raw data into a clean relational schema and how normalization helps in improving database efficiency, maintainability, and accuracy.

## Author

**Adiratna Kamble**
