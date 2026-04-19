create schema Assignments;
use assignments;

create table OrderDetails_Unnormalized (
	OrderID varchar(10),
    CustomerName varchar(50),
    CustomerCity varchar(20),
    CustomerPhone varchar(15),
    Products varchar(40),
    ProductSuppliers varchar(50),
    Quantities varchar(10)
);

select * from OrderDetails_Unnormalized;

insert into OrderDetails_Unnormalized values 
('001','Aarav Patel', 'Mumbai', '9876500001', 'Laptop,Mouse', 'TechStore,TechStore', '1,2'),
('002','Meera Joshi', 'Pune', '9876500002', 'Laptop,Keyboard', 'TechStore,KeyMart', '1,1'),
('001','Rahul Nair', 'Nagpur', '9876500003', 'Mouse,Monitor', 'TechStore,ScreenHub', '1,3');

UPDATE OrderDetails_Unnormalized
SET OrderId = '003' 
WHERE OrderId = '001';

# Step 1:- First Normal Form (1NF) : Atomic values only, separate rows for each product

create table OrderDetails_1NF (
OrderID varchar(10),
CustomerName varchar(50),
CustomerCity varchar(20),
CustomerPhone varchar(15),
Products varchar(40),
ProductSuppliers varchar(50),
Quantities int(10)
);

insert into OrderDetails_1NF values
('001','Aarav Patel', 'Mumbai', '9876500001', 'Laptop', 'TechStore', 1),
('001','Aarav Patel', 'Mumbai', '9876500001', 'Mouse', 'TechStore', 2),
('002','Meera Joshi', 'Pune', '9876500002', 'Laptop', 'TechStore', 1),
('002','Meera Joshi', 'Pune', '9876500002', 'Keyboard', 'KeyMart', 1),
('003','Rahul Nair', 'Nagpur', '9876500003', 'Mouse', 'TechStore', 1),
('003','Rahul Nair', 'Nagpur', '9876500003', 'Monitor', 'ScreenHub', 3);

select * from OrderDetails_1NF;

# Step 2:- Second Normal Form (2NF) : Remove partial dependencies - Split into separate tables

create table customers (
CustomerID varchar(10) primary key,
CustomerName varchar(50),
CustomerCity varchar(20),
CustomerPhone varchar(15)
);

insert into customers values
('C001', 'Aarav Patel', 'Mumbai', '9876500001'),
('C002', 'Meera Joshi', 'Pune', '9876500002'),
('C003', 'Rahul Nair', 'Nagpur', '9876500003');
select * from customers;

create table Suppliers (
SupplierID varchar(10) primary key,
Supplier_Name varchar (30)
);

insert into Suppliers values
('S001', 'TechStore'),
('S002', 'KeyMart'),
('S003', 'ScreenHub');
select * from Suppliers;

create table Products (
ProductID varchar(10) primary key,
Product_Name varchar (20),
SupplierID varchar(10), # ADDING "SupplierID" HERE TO AVOID FOR 3NF BCOZ WE ALREADY CREATED "Suppliers" TABLE WHEN SPLITING
foreign key (SupplierID) references Suppliers(SupplierID)
);

insert into Products values
('P101', 'Laptop', 'S001'),
('P102', 'Mouse', 'S001'),
('P103', 'Keyboard', 'S002'),
('P104', 'Monitor', 'S003');
select * from Products;

# DIRECTLY IMPLEMENTED 3NF WITHOUT KNOWING.... BCOZ UPPER DEECISION...
create table Order_details(
OrderID varchar(10),
CustomerID varchar(10),
ProductID varchar(10),
Quantities int,
primary key (OrderID, ProductID),       # MANY-TO-MANY relationship
# We use 2 primary keys in Order_details because it's a COMPOSITE PRIMARY KEY (OrderID + ProductID together).

foreign key (CustomerID) references customers(CustomerID),
foreign key (ProductID) references Products(ProductID)
);

Insert into Order_details values
('001', 'C001', 'P101', 1),
('001', 'C001', 'P102', 2),
('002', 'C002', 'P101', 1),
('002', 'C002', 'P103', 1),
('003', 'C003', 'P102', 1),
('003', 'C003', 'P104', 3);

select * from Order_details;

# You can now easily retrieve full Orders info:

select
c.CustomerName,
p.Product_Name,
o.Quantities,
s.Supplier_Name
from Order_details o
join customers c ON o.CustomerID = c.CustomerID
join Products p on o.ProductID = p.ProductID
join Suppliers s on p.SupplierID = s.SupplierID ;