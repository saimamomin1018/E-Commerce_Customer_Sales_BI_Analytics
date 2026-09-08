use ECommerce_Analytics_DB;

create table Categories(
Category_ID int auto_increment primary key,
Category_Name varchar(100) not null,
Department varchar(100) not null
);

create table Employees(
Employee_ID int auto_increment primary key,
Employee_Name varchar(100) not null,
Department varchar(100) not null,
Region varchar(50),
Hire_Date date,
Salary Decimal(12,2) 
);

create table Customers(
Customer_ID int auto_increment primary key,
Customer_Name varchar(100) not null,
Gender varchar(20),
Age int,
Email varchar(150) unique,
Phone varchar(20),
City varchar(100),
State varchar(100),
Region varchar(50),
Registration_Date date
);

create table Products(
Product_ID int auto_increment primary key,
Product_Name varchar(150) not null,
Category_ID int not null,
Brand varchar(100),
Supplier varchar(100),
Unit_Cost decimal(12,2) not null,
Unit_Price decimal(12,2) not null,
Stock_Quantity int default 0,
foreign key(Category_ID) references Categories(Category_ID)
);

create table Orders(
Order_ID int auto_increment primary key,
Customer_ID int not null,
Employee_ID int,
Order_Date date not null,
Order_Status varchar(30) not null,
Shipping_City varchar(100),
Shipping_State varchar(100),
Shipping_Region varchar(50),
foreign key(Customer_ID) references Customers(Customer_ID),
foreign key(Employee_ID) references Employees(Employee_ID)
);

create table Order_Details(
Order_ID int not null,
Product_ID int not null,
Quantity int not null,
Unit_Price decimal(12,2) not null,
Discount_Percent decimal(5,2) default 0,
primary key (Order_ID,Product_ID),
foreign key (Order_ID) references Orders(Order_ID),
foreign key (Product_ID) references Products(Product_ID)
);

create table Payments(
Payment_ID int auto_increment primary key,
Order_ID int not null,
Payment_Date date not null,
Payment_Method varchar(50) not null,
Payment_Status varchar(30) not null,
Amount decimal(12,2) not null,
foreign key(Order_ID) references Orders(Order_ID)
);

create table Returns(
Return_ID int auto_increment primary key,
Order_ID int not null,
Product_ID int not null,
Return_Date date,
Quantity int not null,
Return_Reason varchar(200),
Return_Status varchar(30),
foreign key(Order_ID,Product_ID) references Order_Details(Order_ID,Product_ID)
);

show tables;
desc categories;
desc Customers;
desc Employees;
desc Products;
desc Orders;
desc Order_Details;
desc Payments;
desc Returns;
