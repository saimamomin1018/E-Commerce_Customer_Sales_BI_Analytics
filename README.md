# 📊 E-Commerce Customer & Sales Analytics


## 📌 Project Overview

**E-Commerce Customer & Sales Analytics** is an end-to-end Data Analytics and Business Intelligence project developed to analyze e-commerce sales, customers, products, orders, payments, returns, and operational performance.

The project uses **MySQL and SQL for database management and analysis** and **Microsoft Power BI for data modeling, DAX calculations, interactive visualization, KPI tracking, business insights, and recommendations**.

The main objective is to transform raw e-commerce data into meaningful business information that can help organizations understand **sales performance, customer behavior, product performance, regional performance, order status, discounts, returns, and revenue leakage**.

---

## 🎯 Business Problem

E-commerce businesses generate large amounts of data from customers, products, orders, payments, and returns.

However, raw data alone does not easily answer important business questions such as:

- How much revenue is being generated?
- Which products and categories perform best?
- Which regions and cities generate the most sales?
- How are sales changing over time?
- How many orders are cancelled or returned?
- What is the return and cancellation rate?
- How do discounts affect sales?
- Which customers contribute significantly to revenue?
- Where is the business losing revenue?
- What actions can management take to improve performance?

This project addresses these questions through **SQL analysis and an interactive Power BI dashboard**.

---

## 🎯 Project Objectives

- Analyze overall e-commerce sales performance.
- Analyze customer and order information.
- Identify top-performing products and categories.
- Analyze regional and city-level sales.
- Analyze monthly and quarterly sales trends.
- Monitor order status performance.
- Analyze payments and returns.
- Calculate important business KPIs.
- Analyze discount impact on sales.
- Identify revenue leakage.
- Generate business insights.
- Provide actionable business recommendations.
- Build an interactive Power BI dashboard for decision-making.

---

## 🛠️ Tools & Technologies

| Tool / Technology | Purpose |
|---|---|
| **MySQL** | Database creation and management |
| **SQL** | Data analysis and business queries |
| **Power BI** | Interactive dashboard and visualization |
| **DAX** | KPI and business calculations |
| **CSV** | Data storage and data transfer |
| **GitHub** | Project documentation and portfolio |

---

## 🗄️ Database Structure

The project contains **8 related tables**:

### 1. Customers
Contains customer information used for customer and sales analysis.

### 2. Employees
Contains employee information related to order processing.

### 3. Categories
Contains product category information.

### 4. Products
Contains product-level information and category relationships.

### 5. Orders
Contains order-level information including:
- Customer
- Employee
- Order date
- Order status
- Shipping city
- Shipping state
- Shipping region

### 6. Order_Details
Contains detailed information about products included in each order.

### 7. Payments
Contains payment-related information for orders.

### 8. Returns
Contains information about returned orders/products.

---

## 🔗 Data Relationship

The database follows a relational structure where customer, product, order, payment, return, employee, and category information are connected through appropriate keys.

```text
Customers
     ↓
Orders
     ↓
Order_Details
     ↓
Products
     ↓
Categories

Orders
 ↓
Payments

Orders
 ↓
Returns

Employees
 ↓
Orders
```

---

## 🧹 Data Validation

Before performing analysis, the data was validated to check the quality and consistency of the database.

Validation activities included:

- Checking record counts
- Checking duplicate records
- Checking NULL values
- Checking primary keys
- Checking foreign-key relationships
- Checking invalid values
- Checking order relationships
- Checking payment relationships
- Checking return relationships
- Verifying data consistency between tables

---

## 🔎 SQL Analysis

SQL was used to perform both **basic/intermediate and advanced business analysis**.

### Basic & Intermediate SQL

The analysis covered commonly used Data Analyst SQL concepts such as:

- SELECT
- WHERE
- ORDER BY
- DISTINCT
- Aggregate Functions
- GROUP BY
- HAVING
- CASE
- Date Functions
- String Functions
- INNER JOIN
- LEFT JOIN
- Filtering
- Sorting
- Aggregation
- Business KPI calculations

These queries were used to answer real business questions related to sales, customers, products, orders, and regions.

### Advanced SQL

Advanced SQL analysis covered:

- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Ranking
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- Running totals
- Comparative analysis
- Customer analysis
- Product ranking
- Sales trends
- Revenue analysis
- Business problem solving

The objective was not only to practice SQL syntax but to use SQL to answer **real-world business questions**.

---

## 📊 Power BI Dashboard

After completing the SQL analysis, the data was used to create an interactive **Power BI Business Intelligence dashboard**.

The final dashboard contains **2 pages**.

### Data Modeling & DAX
After connecting the data to Power BI, I created a dedicated Date Table to support time-based analysis such as monthly and quarterly sales trends.
I also created DAX measures to calculate the major business KPIs used in the dashboard, including:
- Total Sales
- Net Sales
- Total Orders
- Total Customers
- Return Rate
- Cancellation Rate
These DAX measures were then used in KPI cards, charts, and dashboard analysis.

---

# 📄 Page 1 — E-Commerce Sales Performance

The first page focuses on overall sales and business performance.

## KPIs

The dashboard contains 6 major KPIs:

1. **Total Sales**
2. **Net Sales**
3. **Total Orders**
4. **Total Customers**
5. **Return Rate**
6. **Cancellation Rate**

### KPI Results

| KPI | Value |
|---|---:|
| Total Sales | **$7.66M** |
| Net Sales | **$6.62M** |
| Total Orders | **1,000** |
| Total Customers | **1,000** |
| Return Rate | **20%** |
| Cancellation Rate | **12.5%** |

## 🎛️ Dashboard Slicers

- State
- Region
- Category
- Date
- Order Status
- Quarter

## 📈 Page 1 Visualizations

### 1. Sales Trend Over Time
Analyzes changes in sales across the selected time period.

### 2. Sales Contribution by Category
Identifies which product categories contribute the most to sales.

### 3. Sales by Region
Compares sales performance across different regions.

### 4. Top 10 Products by Sales
Identifies the highest-performing products.

### 5. Quarterly Sales Performance
Compares sales performance across quarters.

### 6. Order Status Distribution
Analyzes the distribution of delivered, cancelled, processing, shipped, and returned orders.

---

# 📄 Page 2 — Customer & Operational Intelligence

The second page focuses on customer geography and operational/business performance.

## Visualizations

### 7. Top 10 Cities by Sales
Identifies cities generating the highest sales.

### 8. Discount vs Sales Performance
Analyzes the relationship between discount levels and sales.

### 9. Revenue Leakage Analysis
Analyzes the difference between sales and net sales and highlights the impact of business adjustments such as discounts and returns.

---

## 💡 Key Business Insights

### 01 — Revenue Performance
Total Sales reached approximately **$7.66M**, while Net Sales were approximately **$6.62M**, showing a meaningful difference between gross and net revenue.

### 02 — Quarterly Performance
Sales performance varies across quarters, helping identify stronger and weaker periods for the business.

### 03 — Category Performance
The dashboard helps identify the strongest-performing product categories and their contribution to overall revenue.

### 04 — Order Fulfillment
Order status analysis helps identify the proportion of delivered, shipped, processing, cancelled, and returned orders.

### 05 — Regional Performance
Regional and city-level analysis helps identify high-performing geographical markets.

### 06 — Product Concentration
The Top 10 Products analysis helps identify products that contribute significantly to overall sales.

---

## 💼 Business Recommendations

### 01 — Optimize Discount Strategy
Analyze whether discounts generate sufficient additional sales and reduce discounts that do not provide meaningful business value.

### 02 — Improve Weak Sales Periods
Investigate weaker quarters and develop targeted promotional and marketing campaigns.

### 03 — Focus on High-Performing Categories
Increase inventory, marketing, and promotional focus on categories generating strong revenue.

### 04 — Reduce Returns & Cancellations
Investigate the major causes of returns and cancellations and improve product information, fulfillment, and customer service processes.

### 05 — Target High-Performing Cities
Focus marketing and inventory strategies on cities that generate higher sales.

### 06 — Promote Top Products
Use high-performing products for cross-selling, upselling, and targeted promotional campaigns.

---

## 🔄 Project Workflow

```text
Raw E-Commerce Data
        ↓
CSV Data
        ↓
MySQL Database
        ↓
Database & Table Creation
        ↓
Data Insertion
        ↓
Data Validation
        ↓
Basic & Intermediate SQL Analysis
        ↓
Advanced SQL Analysis
        ↓
Power BI Data Connection
        ↓
Data Modeling
        ↓
Date Table
        ↓
DAX Measures
        ↓
KPI Development
        ↓
Interactive Visualizations
        ↓
Dashboard Development
        ↓
Business Insights
        ↓
Recommendations
```

---

## 📁 Project Structure

```text
E-Commerce_Customer_Sales_BI/
│
├── README.md
│
├── 1.SQL/
│   ├── 01_Database/
│   ├── 02_Schema/
│   ├── 03_Data/
│   ├── 04_Validation/
│   └── 05_Analysis/
│
├── 2.Data/
│   ├── Categories.csv
│   ├── Customers.csv
│   ├── Employees.csv
│   ├── Order_Details.csv
│   ├── Orders.csv
│   ├── Payments.csv
│   ├── Products.csv
│   └── Returns.csv
│
├── 3.PowerBI/
│   └── ECommerce_Customer_Sales_BI.pbix
│
├── 4.Screenshots/
│   ├── ER_Diagram.png
│   ├── Dashboard_Page_1.png
│   └── Dashboard_Page_2.png
│
└── 5.Documentation/
    └── Project_Report.pdf
```

---

## 📸 Dashboard Preview

### Sales Performance Dashboard

Add the Page 1 dashboard screenshot here:

```markdown
[E-Commerce Sales Performance](4.Screenshots/Dashboard_Page_1_Sales_Performance.png)
```

### Customer & Operational Intelligence

Add the Page 2 dashboard screenshot here:

```markdown
[Customer and Operational Intelligence](4.Screenshots/Dashboard_Page_2_Customer_Operations.png)
```

---

## 📌 Key Skills Demonstrated

This project demonstrates practical skills in:

- SQL
- MySQL
- Relational Database Design
- Data Validation
- Data Cleaning
- Data Analysis
- Joins
- Aggregations
- CTEs
- Window Functions
- Business KPI Development
- Power BI
- Data Modeling
- Date Table & Time Intelligence
- DAX Measures
- KPI Development
- Data Visualization
- Dashboard Design
- Business Intelligence
- Business Problem Solving
- Insight Generation
- Business Recommendations

---

## 🎓 Project Type

**Academic Project / Data Analytics Portfolio Project**

### Domain
**E-Commerce & Business Intelligence**

### Focus
**Sales Analytics | Customer Analytics | Product Analytics | Operational Analytics**

---

## 👩‍💻 Author

**Saima Momin**

Aspiring Data Analyst

**Skills:** SQL | MySQL | Power BI | DAX | Excel | Data Analytics | Business Intelligence

---

## 📌 Conclusion

This project demonstrates an end-to-end approach to solving business problems using data.

Starting from a relational e-commerce database, SQL was used for data validation and analysis, followed by Power BI data modeling, DAX calculations, KPI development, visualization, and dashboard creation.

The final dashboard transforms raw e-commerce data into actionable information that can help businesses understand **sales performance, customer and product behavior, regional performance, operational issues, and potential revenue opportunities**.
