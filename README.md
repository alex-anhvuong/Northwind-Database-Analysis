
# Northwind-Database-Analysis
### Project Overview
This project is an end-to-end analysis made on the data of Northwind - a fictitious company called “Northwind Traders,” which imports and exports specialty foods from around the world.

It focuses on reporting the revenue achieved by Northwind, and breakdown this information across multiple data dimension - such as customer, product type, time - to support business in finding a trend of revenue.

It demonstrates key data analytical skills such as:
- Data definition, management using Excel, SQL
- Procedures and views in SQL
- Data analysis 
- Data visualisation

### Key findings
1. Total revenue is xyz
2. Top 10 customers by revenue have revenue > xyz. There are xyz medium-large customers (sales > xyz) 
3. Top 10 product categories. The most popular categories are xyz.

### Analysis & implementation
A visualisation of the analysis is also available at xyz.
Image

Here are the queries and results used

#### 1. Total revenue of the business
```SQL
SELECT ROUND(SUM(UnitPrice * Quantity), 2) AS TotalRevenue
FROM OrderDetails
```

|TotalRevenue|
|:----|
|1354458.59|

2. Create a view with total revenues per customer
```SQL
CREATE VIEW CustomerTotalRevenue AS
SELECT 
    o.CustomerID,
    c.CompanyName,
    ROUND(SUM(od.UnitPrice * od.Quantity), 2) AS TotalRevenue
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID, c.CompanyName
ORDER BY TotalRevenue DESC;

SELECT * FROM `CustomerTotalRevenue`;
```

|CustomerID|CompanyName|TotalRevenue|
|:----|:----|:----|
|QUICK|QUICK-Stop|117483.39|
|SAVEA|Save-a-lot Markets|115673.39|
|ERNSH|Ernst Handel|113236.68|
|HUNGO|Hungry Owl All-Night Grocers|57317.39|
|RATTC|Rattlesnake Canyon Grocery|52245.90|
|HANAR|Hanari Carnes|34101.15|
|FOLKO|Folk och f HB|32555.55|
|MEREP|Mre Paillarde|32203.90|
|KOENE|Kniglich Essen|31745.75|
|QUEEN|Queen Cozinha|30226.10|

3. Problem
Query

4. Data procedure and views available

### Links and References
