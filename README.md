
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
> 1. :moneybag: Total revenue of the company is **$1,354,458.59**
> 2. :business_suit_levitating: Top 10 customers by revenue have revenue > **$30k**. There are **41** medium-large customers (revenue > $10k) 
> 3. :coffee: Top 10 product categories. The most popular categories are **beverages, dairy products, meat/poultry**.

### Analysis & implementation
A visualisation of the analysis is also available at [this Power BI public report](https://app.powerbi.com/view?r=eyJrIjoiMjZhYjk1ZWYtMGQzNS00YTU5LWI2MzctMDQ2OWZhZmM1NzEyIiwidCI6Ijc4NGU5YWE4LWI4ZjQtNGFhOS1iMTgzLTE5ODExNjE5YjllZSJ9).
![image](https://github.com/user-attachments/assets/8c33a0de-cd58-4dea-941f-ea669077fe9f)

Here are the queries and results used

#### 1. Total revenue of the business
```SQL
SELECT ROUND(SUM(UnitPrice * Quantity), 2) AS TotalRevenue
FROM OrderDetails
```

|TotalRevenue|
|:----|
|1354458.59|

#### 2. Create a view with total revenues per customer
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

SELECT * FROM `CustomerTotalRevenue` LIMIT 10;
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

#### 3. Top revenue by product categories
```SQL
CREATE VIEW RevenueByProductType AS
SELECT 
    c.CategoryName,
    ROUND(SUM(od.UnitPrice * od.Quantity), 2) AS TotalRevenue
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalRevenue DESC;

SELECT * FROM `RevenueByProductType` LIMIT 10;
```

|CategoryName|TotalRevenue|
|:----|:----|
|Beverages|286526.95|
|Dairy Products|251330.50|
|Meat/Poultry|178188.80|
|Confections|177099.10|
|Seafood|141623.09|
|Condiments|113694.75|
|Produce|105268.60|
|Grains/Cereals|100726.80|


#### 4. Other available data procedure and views
- A view to list products with their supplier and category names
- A view to show customers who haven’t placed any orders

```SQL
CREATE VIEW ProductDetails AS
SELECT 
    p.ProductID,
    p.ProductName,
    s.CompanyName AS SupplierName,
    c.CategoryName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;

CREATE VIEW CustomersWithoutOrders AS
SELECT 
    c.CustomerID,
    c.CompanyName,
    c.ContactName,
    c.City,
    c.Country
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;
```

|ProductID|ProductName|SupplierName|CategoryName|
|:----|:----|:----|:----|
|1|Chai|Exotic Liquids|Beverages|
|2|Chang|Exotic Liquids|Beverages|
|24|Guaran Fantstica|Refrescos Americanas LTDA|Beverages|
|34|Sasquatch Ale|Bigfoot Breweries|Beverages|
|35|Steeleye Stout|Bigfoot Breweries|Beverages|
|38|Cte de Blaye|Aux joyeux ecclsiastiques|Beverages|
|39|Chartreuse verte|Aux joyeux ecclsiastiques|Beverages|
|43|Ipoh Coffee|Leka Trading|Beverages|
|67|Laughing Lumberjack Lager|Bigfoot Breweries|Beverages|
|70|Outback Lager|Pavlova| Ltd.|Beverages|

|CustomerID|CompanyName|ContactName|City|Country|
|:----|:----|:----|:----|:----|
|FISSA|FISSA Fabrica Inter. Salchichas S.A.|Diego Roel|Madrid|Spain|
|PARIS|Paris spcialits|Marie Bertrand|Paris|France|
|Val2 |IT|Val2|NULL|NULL|
|VALON|IT|Valon Hoti|NULL|NULL|

### Links and References
1. Northwind dataset: https://docs.yugabyte.com/preview/sample-data/northwind/
2. Power BI theme: https://community.fabric.microsoft.com/t5/Themes-Gallery/Tumble-Road-Red-Blue-Theme/td-p/144793
