#DATA VALIDATION

use ECommerce_Analytics_DB;
show tables;

#[1]-Check record counts *
select 'Categories' as Table_Name,count(*) as Record_Count from Categories 
union all select 'Employees' ,count(*) from Employees
union all select 'Customers' ,count(*) from Customers
union all select 'Products' ,count(*) from Products
union all select 'Orders' ,count(*) from Orders
union all select 'Order_Details' ,count(*) from Order_Details
union all select 'Payments' ,count(*) from Payments
union all select 'Returns' ,count(*) from Returns;

#[2]-Check duplicate Customers
select Email, count(*) as Duplicate_Count from Customers 
group by Email 
having count(*)>1;

#[3]-Check missing Customer Names
select count(*) as Missing_Names from Customers
where Customer_Name is null;

#[4]-Check invalid Products
select count(*) as Invalid_Products from Products
where Unit_Cost < 0 or Unit_Price < 0 or Unit_Price < Unit_Cost;

#[5]-Check invalid Order quantities
select count(*) as Invalid_Quantities from Order_Details
where Quantity <= 0

#[6]-Check Product → Category relationship
select count(*) as Broken_Product_Category from Products p 
left join Categories c on p.Category_ID=c.Category_ID 
where c.Category_ID is null;

#[8]-Check Order → Customer relationship *
select count(*) as Broken_Order_Customer from Orders o 
left join Customers c on o.Customer_ID=c.Customer_ID 
where c.Customer_ID is null;

#[9]-Check Order → Employee relationship
select count(*) as Broken_Order_Employee from Orders o 
left join Employees e on o.Employee_ID=e.Employee_ID
where e.Employee_Id is null;

#[10]-Check Order_Details → Orders *
select count(*) as Broken_Order_Details from Order_Details od
left join Orders o on od.Order_ID=o.Order_ID 
where o.Order_ID is null;

#[11]-Check Order_Details → Products
select count(*) as Broken_Order_Products from Order_Details od
left join Products p on od.Product_ID=p.Product_ID 
where p.Product_ID is null;

#[12]-Check Payments → Orders *
select count(*) as Broken_Payments from Payments p
left join Orders o on p.Order_ID=o.Order_ID 
where o.Order_ID is null;

#[13]-Check Returns → Order_Details *
select count(*) as Broken_Returns from Returns r 
left join Order_Details od on r.Order_ID=od.Order_Id and r.Product_ID=od.Product_ID 
where od.Product_ID is null

#[14]-Check invalid Return quantities
select count(*) as Invalid_Return_Quantity from Returns
where Quantity <=0 ;

#[15]-Check invalid Order_Detail prices
select count(*) as Invalid_Order_Detail_Price from Order_Details
where Unit_Price <= 0;

#[16]-Check invalid discounts
select count(*) as Invalid_Discount from Order_Details 
where Discount_Percent < 0 or Discount_Percent >100;

#[17]-Check payment amounts
select count(*) as Invalid_Payments from Payments
where Amount <= 0;

#[18]-Check Order Status values
select distinct Order_Status from Orders;

#[19]-Check Payment Status
select distinct Payment_Status from Payments;

#[20]-Check Payment Methods
select distinct Payment_Method from Payments;

#[21]-Check Orders by Region
select Shipping_Region, count(*) as Total_Orders from Orders
group by Shipping_Region order by Total_Orders desc;

#[22]-Check Orders by Status
select Order_Status, count(*) as Total_Orders from Orders
group by Order_Status order by Total_Orders desc;

#[23]-Basic business checks 
#Total Customers
select count(*) as Total_Customers from Customers;
#Total Products
select count(*) as Total_Products from Products;
#Total Orders
select count(*) as Total_Orders from Orders;
#Total Order Items
select count(*) as Total_Order_Details from Order_Details;
#Total Payments
select count(*) as Total_Payments from Payments;
#Total Returns
select count(*) as Total_Returns from Returns;

#[24]-First revenue check 
#SUM of Amount
select round(sum(Amount),2) as Average_Paid_Revenue from Payments
where Payment_Status ='Paid';
#AVERAGE of Amount
select round(avg(Amount),2) as Average_Paid_Amount from Payments
where Payment_Status ='Paid';

#[25]-First return-rate calculation
#rReturn Orders Percentage
select round(count(*)*100.0/(select count(*) from Orders),2) as Return_Rete_Percent from Returns;

#[26]Database Record Count Validation *
select
	(select count(*) from Categories) as Categories,
    (select count(*) from Employees) as Employees,
    (select count(*) from Customers) as Customers,
    (select count(*) from Products) as Products,
    (select count(*) from Orders) as Orders,
    (select count(*) from Order_Details) as Order_Details,
    (select count(*) from Payments) as Payments,
    (select count(*) from Returns) as Returns;
