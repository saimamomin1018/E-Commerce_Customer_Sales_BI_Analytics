# SQL Basic & Intermidiate Analysis 
 
use ECommerce_Analytics_DB;
show tables;

#1 — DATA EXPLORATION :

#(1)-Explore Customers
select Customer_Id ,Customer_Name,City,State from Customers limit 10;

#(2)-Find Unique Order Statuses
select distinct Order_Status from Orders;


#2 — FILTERING :

#(3)-Find Delivered Orders
select Order_ID,Customer_ID,Order_Date,Order_Status from Orders 
where Order_Status='Delivered';

#(4)-Delivered Orders From Selected Cities
select Order_ID,Customer_ID,Shipping_City,Order_Status from Orders 
where Order_Status='Delivered'
and Shipping_City in('Mumbai','Pune','Dehli');

#(5)-Products in a Price Range
select Product_ID,Product_Name,Unit_Price from Products
where Unit_Price between 5000 and 20000;

#(6)-Search Products
select Product_ID,Product_Name,Unit_Price from Products 
where Product_Name like '%Phone%';

#(7)-Find Missing Customer Information
select Customer_ID,Customer_Name,Phone from Customers
where Phone is null;


#3 — SORTING & TOP-N :

#(8)-Top 10 Most Expensive Products
select Product_ID,Product_Name,Unit_Price from Products 
order by Unit_Price desc limit 10;

#(9)-Cheapest Products
select Product_ID,Product_Name,Unit_Price from Products 
order by Unit_Price asc limit 10;

#4 — CALCULATED BUSINESS COLUMNS :

#(10)-Calculate Gross Sales
select Order_ID,Product_ID,Quantity,Unit_Price,
Quantity*Unit_Price as Gross_Sales from Order_Details;

#(11)-Calculate Discount & Net Sales
select Order_ID,Product_ID,Quantity,Unit_Price,Discount_Percent,
Quantity * Unit_Price as Gross_Sales,
(Quantity * Unit_Price) * Discount_Percent/100 as Discount_Amount,
(Quantity * Unit_Price)-(Quantity*Unit_Price)* Discount_Percent/100 as Net_Sales 
from Order_Details;


#5 — CASE WHEN :
 
#(12)-Product Price Segmentation
select Product_ID,Product_Name,Unit_Price, 
case when Unit_Price < 5000 then 'Low Price'
     when Unit_Price < 20000 then 'Medium Price'
     else 'High Price'
end as Price_Category from Products;

#(13)-Order Status Classification
select Order_ID,Order_Status,
case when Order_Status = 'Delivered' then 'Successful'
     when Order_Status = 'Cancelled' then 'Unsuccessful'
     else 'In Progress'
end as Order_Category from Orders;


#6 — AGGREGATE FUNCTIONS :

#(14)-Overall Business Metrics (KPIs)
select count(*) as Total_Orders,
count(distinct Customer_ID) as Unique_Customers,
min(Order_Date) as First_Order_Date,
max(Order_Date) as Lastest_Order_Date from Orders;

#(15)-Total Quantity Sold (KPIs)
select sum(Quantity) as Total_Quantity_sold from Order_Details;

#(16)-Average Payment (KPIs)
select round(avg(Amount),2) as Average_Payment from Payments
where Payment_Status='Paid';

#(17)-Product Price Statistics (KPIs)
select 
min(Unit_Price) as Minimum_Price ,
max(Unit_Price) as Maximum_Price , 
round(avg(Unit_Price),2) as Average_Price from Products;


#7 — GROUP BY & ORDER BY :

#(18)-Orders by Status
select Order_Status,count(*) as Total_Orders from Orders
group by Order_Status 
order by Total_Orders desc;

#(19)-Customers by State
select State,count(*) as Total_Customers from Customers
group by State
order by Total_Customers desc;

#(20)-Orders by Region
select Shipping_Region,count(*) as Total_Orders from Orders
group by Shipping_Region
order by Total_Orders desc;

#(21)-Payment Method Performance
select Payment_Method,
count(*) as Transactions,
sum(Amount) as Total_revenue,
round(avg(Amount),2) as Average_Transaction  from Payments 
where Payment_Status = 'Paid'
group by Payment_Method
order by Total_Revenue desc;


#8 — HAVING :

#(22)-High-Volume Cities
select Shipping_City,
count(*) as Total_Orders from Orders
group by Shipping_City
having count(*) > 50
order by Total_Orders desc;


#9 — DATE ANALYSIS : 

#(23)-Monthly Order Trend
select
year(Order_Date) as Order_Year,
month(Order_Date) as Order_Month,
count(*) as Total_Orders from Orders
group by year(Order_Date),month(Order_Date)
order by Order_Year,Order_Month;


#10 — CONDITIONAL AGGREGATION : 

#(24)-Order Status KPI
select count(*) as Total_Orders,
sum(case 
        when Order_Status = 'Delivered' then 1 else 0
    end) as Delivered_Orders,
sum(case 
		when Order_Status ='Cancelled' then 1 else 0 
	end) as Cancelled_Orders
from Orders;


#11 — CANCELLATION RATE KPI :

#(25)-Cancellation Rate
select count(*) as Total_Orders,
sum(case 
        when Order_Status = 'Cancelled' then 1 else 0
    end) as Cancelled_Orders,
round(sum(case 
		when Order_Status ='Cancelled' then 1 else 0 
	end) * 100.0/count(*),2) as Cancelled_Orders
from Orders;


# SQL Advanced Analysis 
 
use ECommerce_Analytics_DB;
show tables;

#1 — ADVANCED JOINs & AGGREGATION :

#[1]-Total Revenue
select sum(Quantity * Unit_Price) as Total_Revenue from Order_Details;

#[2]-Average Order Value 
select avg(Order_Total) As Avg_Order_Values from 
(select Order_Id,sum(Quantity * Unit_Price) as Order_Total from Order_Details
group by Order_ID)x;

#[3]-Monthly Revenue 
select month(o.Order_Date) as Month,sum(od.Quantity * od.Unit_Price) as Revenue from Orders o
join Order_Details od on o.Order_ID  = od.Order_ID
group by month(o.Order_Date);

#[4]-Revenue by Region
select o.Shipping_Region,sum(od.Quantity * od.Unit_Price) as Revenue from Orders o 
join Order_Details od on o.Order_ID = od.Order_ID 
group by o.Shipping_Region
order by Revenue desc;

#2 — CASE WHEN :

#[5]-Order Performance
select Order_ID,
case
	when Order_Status = 'Delivered' then 'Successful'
	when Order_Status = 'Cancelled' then 'Failed'
    else 'In Progress'
end as Performance from Orders;

#[6]-Order Value Category
select Order_ID,sum(Quantity * Unit_Price) as Revenue,
case 
	when sum(Quantity * Unit_Price) >= 5000 then 'High'
	when sum(Quantity * Unit_Price) >= 2000 then 'Medium'
	else 'Low'
end as Revenue_Category from Order_Details
group by Order_ID;

#3 — SUBQUERIES :

#[7]-Orders Above Average Value
select Order_ID,Order_Total from (select Order_ID,sum(Quantity * Unit_Price) as Order_Total from Order_Details
group by Order_ID)x 
where Order_Total>
(select avg(Order_Total) from (select Order_ID,sum(Quantity * Unit_Price) as Order_Total from Order_Details
group by Order_ID)y);

#[8]-Most Expensive Product
select Product_ID,Unit_Price from Products
where Unit_Price = (select max(Unit_Price) from Products);

#4 — EXISTS / NOT EXISTS :

#[9]-Products That Have Been Sold
select p.Product_ID,p.Product_Name from Products p 
where exists(select 1 from Order_Details od where od.Product_ID = p.Product_ID);

#[10]-Products Never Sold
select p.Product_ID,p.Product_Name from Products p 
where not exists(select 1 from Order_Details od where od.Product_ID = p.Product_ID);


#5 — CTE :

#[11]-Customer Revenue
with Customer_Sales as ( select o.Customer_ID,sum(od.Quantity * od.Unit_Price) as Revenue from Orders o
join Order_Details od on o.Order_ID = od.Order_ID
group by o.Customer_ID) 
select * from Customer_Sales order by Revenue desc;

#[12]-Top 10 Customers
with Customer_Sales as ( select o.Customer_ID,sum(od.Quantity * od.Unit_Price) as Revenue from Orders o
join Order_Details od on o.Order_ID = od.Order_ID
group by o.Customer_ID) 
select * from Customer_Sales order by Revenue desc limit 10;


#6 — WINDOW FUNCTIONS : 

#[13]-Rank Customers by Revenue
select Customer_ID,Revenue,
rank() over (order by Revenue desc) as Revenue_Rank 
from(select Customer_ID,sum(Quantity * Unit_Price) as Revenue from Orders o
join Order_Details od on o.Order_ID = od.Order_ID 
group by Customer_ID ) x;

#[14]-Rank Products by Revenue
select Product_ID,Revenue,
rank() over (order by Revenue desc) as Product_Rank 
from(select Product_ID,sum(Quantity * Unit_Price) as Revenue from Order_Details
group by Product_ID ) x;

#[15]-Running Revenue
select Order_ID,Revenue,
sum(Revenue) over (order by Order_ID) as Running_Revenue
from(select Order_ID,sum(Quantity * Unit_Price) as Revenue from Order_Details
group by Order_ID ) x;

#[16]-Customer Order Number
select Customer_ID,Order_ID,
row_number() over( partition by Customer_ID order by Order_Date) as Order_Number from Orders;


#7 — KPI ANALYSIS :

#[17]-Total Orders
select count(*) as Total_Orders from Orders;

#[18]-Delivered Order %
select round(100 * sum(Order_Status = 'Delivered')/count(*),2) as Delivered_Percentage from Orders;

#[19]-Cancellation Rate
select round(100 * sum(Order_Status = 'Cancelled')/count(*),2) as Cancellation_Percentage from Orders;

#[20]-Return Rate
select round(100 * count(distinct r.Order_ID)/count(distinct o.Order_ID),2) as Return_Rate from Orders o
left join Returns r on o.Order_ID = r.Order_ID;


#8 — CUSTOMER ANALYSIS :

#[21]-Orders per Customer
select Customer_ID,count(*) as Total_Orders from Orders 
group by Customer_ID order by Total_Orders desc;

#[22]-Repeat Customers
select Customer_ID,count(*) as Orders from Orders 
group by Customer_ID 
having count(*)>1;


#9 — PRODUCT ANALYSIS :

#[23]-Top 10 Products by Units Sold
select Product_ID,sum(Quantity) as Unit_Sold from Order_Details
group by Product_ID 
order by Unit_Sold desc limit 10;

#[24]-Product Revenue
select Product_ID,sum(Quantity * Unit_Price) as Revenue from Order_Details
group by Product_ID 
order by Revenue desc;


#10 — PAYMENT ANALYSIS :

#[25]-Payment Method Performance
select Payment_Method, count(*) as Transactions, sum(Amount) as Revenue from Payments
group by Payment_Method 
order by Revenue desc;

#11 — BUSINESS PROBLEM ANALYSIS :

#[26]-Revenue by Order Status
select o.Order_Status,sum(od.Quantity * od.Unit_Price) as Revenue from Orders o
join Order_Details od on o.Order_ID = od.Order_ID 
group by o.Order_Status 
order by Revenue desc;

#[27]-Cancellation by Region
select Shipping_Region,count(*) as Total_Orders,sum(Order_Status = 'Cancelled') as Cancelled_Orders from Orders
group by Shipping_Region 
order by Cancelled_Orders desc;

#12 - TIME-BASED ANALYSIS : 

#[28]-Month-over-Month Revenue Analysis
with Monthly_Sales as ( 
select date_format(o.Order_Date,'%Y-%m') as Month,
       sum(od.Quantity * od.Unit_Price) as Revenue from Orders o
join Order_Details od on o.Order_ID = od.Order_ID 
group by date_format(o.Order_Date, '%Y-%m'))

select Month,
round(Revenue,2) as Revenue,
round(lag(Revenue) over (order by Month),2) as Previous_Month_Revenue,  
round((Revenue-lag(Revenue) over(order by Month)) / nullif(lag(Revenue) over(order by Month), 0) *100 ,2) as 
MoM_Growth_Percent from Monthly_Sales
 order by Month;
 

#13 - CUSTOMER RETENTION ANALYSIS :

#[29]-Next Order for Customer — LEAD
select Customer_ID,Order_ID,Order_Date,
lead(Order_Date) over(partition by Customer_ID order by Order_Date) as Next_Order_Date from Orders;
