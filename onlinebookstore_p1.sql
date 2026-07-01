-- Create tables

Drop table if exists books;

Create Table Books(
	Book_ID Serial Primary Key,
	Title Varchar(100),
	Author Varchar(100),
	Genre Varchar(100),
	Published_Year Int,
	Pricr Numeric(10,2),
	Stock Int
);
Alter table Books
Alter column Book_ID type INT;

Alter table books
rename column pricr to Price;

Drop table if exists customers;

Create Table customers(
	Customer_ID Serial Primary Key,
	Name Varchar(100),
	Email Varchar(100),
	Phone Varchar(15),
	City Varchar(50),
	Country Varchar(150)
);
 
Drop table if exists orders;

Create Table orders(
	Order_ID Serial Primary Key,
	Customer_ID INT References customers(Customer_ID),
	Book_ID INT References books(Book_ID),
	Order_Date Date,
	Quantity INT,
	Total_Amount Numeric(10,2)
);

Select * from books;
Select * from customers;
Select * from  orders;

-- Import data into book table

COPY books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\datasheet\30 Day - SQL Practice Files\Books.csv'
CSV  HEADER; 

-- Import data into customer table

COPY customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:\datasheet\30 Day - SQL Practice Files\customers.csv'
CSV HEADER;

-- Import data into order table

COPY orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity,	Total_Amount)
From 'D:\datasheet\30 Day - SQL Practice Files\orders.csv'
CSV HEADER;

--1) Retrieve all books in "fiction " genre
Select * from books
where Genre = 'Fiction';

--2) find the books published after the year  1950

Select Title , Author, Published_year from books
where Published_Year>1950;

-- 3) List all customers from canada

Select * from customers
where Country = 'Canada';

-- 4) Show order placed in November 2023
Select * from orders
where Order_Date between '2023-09-01' AND '2023-09-30';

--5)Retrieve total stock of book available
select sum(stock) as total_stock from books;

--6) find the details of most expensive book
Select max(price) expensive_book from books;

--7) show the customers who ordered more than 1 quantity of book
Select * from orders
where Quantity>1;

--8) Retrieve all orders where the total amount exceeds $20;
Select * from orders
where Total_Amount >20;

--9) List all genres available in books table

Select DISTINCT Genre from books;

-- 10) Find the book with lowest stock

Select * from books order by stock asc limit 1;

--11)Calculate the total revenue generated from all orders
Select sum(Total_Amount) as total_revenue from orders;

-- Advance

--1) Retrieve total number of book sold for each genre
Select b.Genre, sum(o.Quantity)  as total_sold
from orders o 
join books b 
on o.Book_ID = b.book_id
group by b.Genre;

--2) Find the average book price in fantasy genre

Select avg(Price) as fantasy_price
from books
where Genre = 'Fantasy';

--3) List customers who have palced at least 2 orders
Select o.Customer_id, c.name, Count(o.Order_ID) as order_count
from orders o
JOIN customers c on o.Customer_ID = c.Customer_ID
Group by o.Customer_ID, c.name
having COUNT(o.Order_ID)>=2;

--4) Find the most frequently ordered book
Select o.Book_ID,b.Title, Count(o.Order_ID) as order_count
from orders o
join books b on o.Book_ID = b.Book_ID
group by o.Book_ID, b.Title
order by order_count Desc Limit 1 ;

--5) Show the top 3 most expensive book of fantasy genre

Select * from books
where genre = 'Fantasy'
order by price desc limit 3;

-- 6) Retrieve the total  quantity of books sold by each author
Select b.Author,b.Title ,sum(o.Quantity) as total_books
from orders o
join books b on o.Book_ID = b.Book_ID
group by b.author , b.Title
--order by  total_books ;

--7) List the cities where customers who spent over $30 are located

Select DISTINCT(c.City), Total_amount
from orders o 
join customers c on o.Customer_ID = c.Customer_ID
where o.Total_Amount > 30

--8) Find the customer who spent the most on order

Select c.Customer_ID, c.name, SUM(o.Total_Amount) as Total_Spent
from orders o
join customers c on o.Customer_ID = o.Customer_ID
Group by c.Customer_ID, c.name
order by Total_Spent desc limit 1;

--9) Calculate the stock remaining after fulfilling all orders
Select b.Book_ID, b.Title, b.stock, COALESCE (sum(o.Quantity),0) as order_Quantity,
	b.stock - COALESCE (sum(o.Quantity),0) as ramaining_quantiy
from books b
left join orders o on o.Book_ID = b.Book_ID
group by b.Book_ID;
