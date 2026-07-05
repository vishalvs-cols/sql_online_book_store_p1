# sql_online_book_store_p1

**Project Overview**

**Project Title: 
<br>
Online Book Store**
<br>
**Level: Moderate**
<br>
**Database: p1_onlinebookstore_db**

The Online Bookstore project is designed to manage information about books, customers, and orders. It showcases SQL concepts such as:

- Database creation
- Table relationships
- Data importing
- CRUD operations
- Aggregate functions
- Joins
- Grouping
- Filtering
- Sorting
- Business insights using SQL

## 🗄️ Database Schema

The project consists of **three tables**:

### 📖 Books
Stores information about books.

| Column | Description |
|---------|-------------|
| Book_ID | Primary Key |
| Title | Book Title |
| Author | Author Name |
| Genre | Book Genre |
| Published_Year | Publication Year |
| Price | Book Price |
| Stock | Available Stock |

---

### 👤 Customers

Stores customer information.

| Column | Description |
|---------|-------------|
| Customer_ID | Primary Key |
| Name | Customer Name |
| Email | Email Address |
| Phone | Contact Number |
| City | City |
| Country | Country |

---

### 🛒 Orders

Stores customer purchase details.

| Column | Description |
|---------|-------------|
| Order_ID | Primary Key |
| Customer_ID | Foreign Key |
| Book_ID | Foreign Key |
| Order_Date | Date of Order |
| Quantity | Books Purchased |
| Total_Amount | Total Order Amount |

---

## 🔗 Entity Relationship

```
Customers
    │
    │ Customer_ID
    ▼
Orders
    ▲
    │ Book_ID
    │
Books
```

---

## 📂 Project Structure

```
Online-Bookstore-SQL/
│
├── onlinebookstore_p1.sql
├── Books.csv
├── Customers.csv
├── Orders.csv
└── README.md
```

---

## 🚀 Features

- Create relational database
- Import CSV datasets
- Manage bookstore records
- Perform SQL analysis
- Generate business insights
- Practice SQL interview questions

---

## 📊 SQL Concepts Used

- CREATE TABLE
- ALTER TABLE
- DROP TABLE
- PRIMARY KEY
- FOREIGN KEY
- COPY FROM CSV
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- DISTINCT
- LIMIT
- Aggregate Functions
  - SUM()
  - AVG()
  - MAX()
  - COUNT()
- INNER JOIN

---
## 🛠️ Technologies Used

- PostgreSQL
- SQL
- CSV Dataset


## Project Structure

**Book Table**
**Customer Table**
**Order Table**

## 🎯 Learning Outcomes

Through this project I learned:

- Database normalization
- Foreign key relationships
- SQL joins
- Aggregate analysis
- Business reporting using SQL
- Data import from CSV files
- Writing optimized SQL queries
---

## 👨‍💻 Author

**Vishal Singh**

BCA Student | Aspiring Data Analyst
