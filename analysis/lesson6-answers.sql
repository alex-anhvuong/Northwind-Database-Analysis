-- SQLBook: Markup
**!!Please open this file in VSCode. You'll need:**
- `MySQL` extension from `database-client.com`
- Right click on the SQL file, select "Open With..." and choose "SQL Book"
-- SQLBook: Code
-- Active: 1746427432550@@103-6-169-54.cloud-xip.com@3306@lesson6_northwind
USE lesson6_northwind;
-- SQLBook: Markup
### 1. Create a simple table Countries including columns `CountryID`, `CountryName`. What data type should the `CountryName` has according to previously made tables?
-- SQLBook: Code
-- Since we are creating a new table to store Country data, we need to check for existing information about countries from other tables.
SELECT DISTINCT Country FROM Suppliers;
-- +-------------+
-- | Country     |
-- |-------------|
-- | UK          |
-- | USA         |
-- | Japan       |
-- | Spain       |
-- | Australia   |
-- | Sweden      |
-- | Brazil      |
-- | Germany     |
-- | Italy       |
-- | Norway      |
-- | France      |
-- | Singapore   |
-- | Denmark     |
-- | Netherlands |
-- | Finland     |
-- | Canada      |
-- +-------------+

SELECT DISTINCT Country FROM Employees;
-- +-----------+
-- | Country   |
-- |-----------|
-- | USA       |
-- | UK        |
-- +-----------+
-- SQLBook: Code
-- Active: 1746427432550@@103-6-169-54.cloud-xip.com@3306
CREATE TABLE IF NOT EXISTS Countries (
  CountryID INT AUTO_INCREMENT PRIMARY KEY,
  CountryName VARCHAR(15) NOT NULL UNIQUE
);
-- SQLBook: Code
SHOW CREATE TABLE Countries;
-- SQLBook: Markup
### 2. Can you insert some sample data for the country table? Use existing data of any given countries from all other tables.
-- SQLBook: Code
INSERT INTO Countries (CountryName)
SELECT DISTINCT Country
FROM Suppliers
WHERE Country IS NOT NULL;
-- SQLBook: Code
SELECT * FROM Countries;
-- SQLBook: Code
# To link between other tables with Countries table, we can:
# 1. Add a CountryID column to the table that uses country information
ALTER TABLE Suppliers
ADD COLUMN CountryID INT;

# 2. Create a foreign key constraint to link the CountryID column in both tables
# the foreign key constraint is created in the table that uses information from Countries
ALTER TABLE Suppliers
ADD CONSTRAINT fk_suppliers_countryid
FOREIGN KEY (CountryID) REFERENCES Countries(CountryID);

SHOW CREATE TABLE Suppliers;

# 3. Populate data for CountryID in Suppliers table
UPDATE Suppliers s
JOIN Countries c ON s.Country = c.CountryName
SET s.CountryID = c.CountryID;

SELECT * FROM Suppliers;
-- SQLBook: Markup
### 3. I have a list of employees which are NOT imported into the database tables. Download it here. Can you help me import this file?
-- SQLBook: Code
SELECT * FROM Employees;

SHOW COLUMNS FROM Employees;

SHOW CREATE TABLE Employees;
-- SQLBook: Code
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Nguyen','Alex','IT Specialist','Mr.','1990-07-12','2021-02-15','123 Tech Lane','Sydney','NSW','2000','Australia','(02) 555-1000','100','Expert in system infrastructure and network security.',2,'http://accweb/employees/nguyen.bmp',5100.75);

SELECT * FROM Employees;
-- SQLBook: Code
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Tran','Linh','HR Manager','Ms.','1985-07-19','2018-09-1','22 Green Rd','Melbourne','VIC','3000','Australia','(03) 555-2345','101','Responsible for employee wellbeing and recruitment.',2,'http://accweb/employees/tran.bmp',4700.6);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Patel','Amit','Logistics Coordinator','Mr.','1987-07-4','2019-01-10','89 Distribution St','Brisbane','QLD','4000','Australia','(07) 555-3234','102','Manages transportation and goods flow.',5,'http://accweb/employees/patel.bmp',4200.9);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Smith','Emily','Finance Officer','Mrs.','1992-07-18','2020-06-11','14 Accounting Blvd','Perth','WA','6000','Australia','(08) 555-4852','103','Specialist in financial reporting and budgeting.',5,'http://accweb/employees/smith.bmp',4900);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Kumar','Raj','Marketing Manager','Mr.','1984-07-25','2017-04-7','66 Ad Street','Sydney','NSW','2000','Australia','(02) 555-6789','104','Leads campaigns and product launches.',2,'http://accweb/employees/kumar.bmp',5300.45);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Lee','Jessica','IT Support','Ms.','1993-07-14','2022-05-3','7 Tech Park Ln','Adelaide','SA','5000','Australia','(08) 555-9988','105','Provides technical support to all departments.',10,'http://accweb/employees/lee.bmp',3800.2);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Chen','Victor','HR Assistant','Mr.','1995-07-22','2021-08-1','98 Talent Ave','Darwin','NT','800','Australia','(08) 555-4123','106','Assists with onboarding and employee files.',11,'http://accweb/employees/chen.bmp',3600);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Gonzalez','Ana','Supply Chain Analyst','Mrs.','1986-07-29','2019-12-15','445 Logistics Dr','Hobart','TAS','7000','Australia','(03) 555-6598','107','Analyzes supply trends and demand forecasts.',12,'http://accweb/employees/gonzalez.bmp',4550.65);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Davis','Ben','Accountant','Mr.','1990-07-11','2020-02-20','212 Finance Rd','Melbourne','VIC','3000','Australia','(03) 555-1177','108','Handles payroll and tax compliance.',13,'http://accweb/employees/davis.bmp',4800.45);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Matsuda','Yuki','Marketing Assistant','Ms.','1996-07-28','2023-01-9','34 Campaign Ave','Sydney','NSW','2000','Australia','(02) 555-3344','109','Supports digital marketing efforts.',14,'http://accweb/employees/matsuda.bmp',3400);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Wilson','Harry','Warehouse Manager','Mr.','1983-07-7','2016-11-11','75 Storage Dr','Brisbane','QLD','4000','Australia','(07) 555-6464','110','Oversees inventory and stock levels.',5,'http://accweb/employees/wilson.bmp',5100.8);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Pham','Lisa','IT Project Manager','Mrs.','1988-07-2','2019-03-1','88 Innovation St','Sydney','NSW','2000','Australia','(02) 555-8383','111','Leads internal software deployment.',10,'http://accweb/employees/pham.bmp',5500);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Ng','Tom','Finance Analyst','Mr.','1991-07-15','2021-04-14','9 Ledger St','Canberra','ACT','2600','Australia','(02) 555-9191','112','Analyzes monthly and quarterly financials.',13,'http://accweb/employees/ng.bmp',4650.3);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Cruz','Isabella','Marketing Analyst','Ms.','1994-07-5','2022-07-1','56 Branding Ln','Melbourne','VIC','3000','Australia','(03) 555-2200','113','Conducts market research and surveys.',14,'http://accweb/employees/cruz.bmp',3900.55);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Ali','Sara','Customer Service Officer','Ms.','1997-07-20','2022-09-19','17 Help Desk St','Adelaide','SA','5000','Australia','(08) 555-7733','114','Handles customer queries and feedback.',20,'http://accweb/employees/ali.bmp',3100);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Thompson','James','Transport Supervisor','Mr.','1982-07-30','2015-10-10','102 Delivery Ln','Perth','WA','6000','Australia','(08) 555-4444','115','Coordinates delivery teams across regions.',12,'http://accweb/employees/thompson.bmp',4700);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Hassan','Omar','Payroll Officer','Mr.','1990-07-9','2020-01-8','33 Payslip St','Darwin','NT','800','Australia','(08) 555-6161','116','Responsible for salary disbursement and reports.',13,'http://accweb/employees/hassan.bmp',4300.75);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('White','Chloe','IT Intern','Ms.','2000-07-16','2024-02-1','21 Byte Rd','Canberra','ACT','2600','Australia','(02) 555-3030','117','Currently assisting the infrastructure team.',10,'http://accweb/employees/white.bmp',2800);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Moreno','Diego','Marketing Content Creator','Mr.','1993-07-6','2023-06-10','45 Story Ln','Melbourne','VIC','3000','Australia','(03) 555-2323','118','Creates engaging content for social platforms.',14,'http://accweb/employees/moreno.bmp',3750.6);
INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('Baker','Sophie','HR Advisor','Mrs.','1989-07-17','2021-11-1','76 Welfare Rd','Hobart','TAS','7000','Australia','(03) 555-3434','119','Advises on policies and employee development.',11,'http://accweb/employees/baker.bmp',4550.1);

SELECT * FROM Employees;

-- SQLBook: Markup
### 4. Can you find the list of managers (a staff reports to a manager). Then, please update the employee table by adding in a new column IsManager . Finally, update the data of this column - whoever in the manager list should have the column value to be True .
-- SQLBook: Markup
https://medium.com/@haroldfinch01/you-cant-specify-target-table-for-update-in-from-clause-ecb4f5d83515
-- SQLBook: Code
-- Active: 1746427432550@@103-6-169-54.cloud-xip.com@3306@lesson6_northwind
-- Active: 1745903557222@@103-6-169-54.cloud-xip.com@3306@lesson6_northwind
SELECT * FROM `Employees`;

ALTER TABLE Employees
ADD COLUMN IsManager BOOLEAN;
-- SQLBook: Code
-- Manager list
SELECT DISTINCT `ReportsTo` FROM `Employees` WHERE `ReportsTo` IS NOT NULL;

UPDATE `Employees`
SET `IsManager` = FALSE;

DROP TABLE MangerList;

WITH ManagerList AS (
  SELECT DISTINCT `ReportsTo` AS ManagerID
  FROM `Employees`
  WHERE `ReportsTo` IS NOT NULL
)
UPDATE `Employees`
SET `IsManager` = TRUE
WHERE `EmployeeID` IN (SELECT ManagerID FROM ManagerList);

SELECT * FROM `Employees` WHERE `IsManager` = TRUE;

-- SQLBook: Markup
### 5. Create a stored procedure to insert a new employee into the Employee table. A record of employee requires at least their name, DOB, job title (feel free to add more data field requirements). Test this procedure by creating two new employees.
-- SQLBook: Code
CREATE PROCEDURE CreateNewEmployee (
  IN inFirstName VARCHAR(10),
  IN inLastName VARCHAR(20),
  IN inBirthDate DATETIME,
  IN inTitle VARCHAR(30),
  IN inHireDate DATETIME,
  IN inAddress VARCHAR(60),
  IN inCountry VARCHAR(15),
  IN inHomePhone VARCHAR(24)
)
BEGIN
  INSERT INTO Employees (
    FirstName, LastName, BirthDate, Title, HireDate, Address, Country, HomePhone
  )
  VALUES (
    inFirstName, inLastName, inBirthDate, inTitle, inHireDate, inAddress, inCountry, inHomePhone 
  );
END;
-- SQLBook: Code
SHOW CREATE TABLE Employees;
-- SQLBook: Code
CALL CreateNewEmployee('John', 'Doe', '1990-01-01', 'Software Engineer', '2025-10-01', '123 Main St', 'USA', '(123) 456-7890', 'New employee named John');
-- SQLBook: Code
DROP PROCEDURE IF EXISTS CreateNewEmployee;

-- Correct
CREATE PROCEDURE CreateNewEmployee (
  IN inFirstName VARCHAR(10),
  IN inLastName VARCHAR(20),
  IN inBirthDate DATETIME,
  IN inTitle VARCHAR(30),
  IN inHireDate DATETIME,
  IN inAddress VARCHAR(60),
  IN inCountry VARCHAR(15),
  IN inNotes VARCHAR(255),
  IN inHomePhone VARCHAR(24)
)
BEGIN
  INSERT INTO Employees (
    FirstName, LastName, BirthDate, Title, HireDate, Address, Country, HomePhone, Notes
  )
  VALUES (
    inFirstName, inLastName, inBirthDate, inTitle, inHireDate, inAddress, inCountry, inHomePhone, inNotes
  );
END;
-- SQLBook: Code
CALL CreateNewEmployee('Alex', 'Vuong', '1998-02-02', 'Data Analyst', '2025-05-20', 'Auburn Grove', 'AU', '0412345678', 'New employee named Alex');
-- SQLBook: Code
SELECT * FROM `Employees`;
-- SQLBook: Markup
### 6. Create a database user named finance_db_admin . Create a procedure that helps update an employee salary using their employee’s ID. Give the finance_db_admin permission to run this procedure. Test it by logging in as finance_db_admin and modify the salary for two people.
-- SQLBook: Code
CREATE USER 'finance_db_admin'@'%' IDENTIFIED BY 'Financ3!';
-- SQLBook: Code
CREATE PROCEDURE UpdateEmployeeSalary (
  IN inEmployeeID INT,
  IN inNewSalary DECIMAL(10,2)
)
BEGIN
  UPDATE Employees
  SET Salary = inNewSalary
  WHERE EmployeeID = inEmployeeID;
END;
-- SQLBook: Code
GRANT SELECT ON lesson6_northwind.* TO 'finance_db_admin'@'%';

GRANT EXECUTE ON PROCEDURE UpdateEmployeeSalary TO 'finance_db_admin'@'%';
-- SQLBook: Code
-- Active: 1747715163842@@103-6-169-54.cloud-xip.com@3306@lesson6_northwind
CALL `UpdateEmployeeSalary`(31, 999999.00);

SELECT * FROM `Employees`;
-- SQLBook: Markup
### 7. Create a view with total revenues per customer.
-- SQLBook: Markup
Can show KPI of total revenue and by customers
-- SQLBook: Code
SELECT * FROM `OrderDetails`;

SELECT * FROM `OrderDetails` WHERE `Discount` > 0;

SELECT 
    ROUND(SUM(UnitPrice * od.Quantity), 2) AS TotalRevenue
FROM OrderDetails
-- SQLBook: Code
-- Active: 1746427432550@@103-6-169-54.cloud-xip.com@3306@lesson6_northwind
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

DROP VIEW IF EXISTS CustomerTotalRevenue;
-- SQLBook: Code
SELECT * FROM `CustomerTotalRevenue`;
-- SQLBook: Markup
### 8. Create a view to list products with their supplier and category names.
-- SQLBook: Markup
Can do analysis of sales by product category
-- SQLBook: Code
CREATE VIEW ProductDetails AS
SELECT 
    p.ProductID,
    p.ProductName,
    s.CompanyName AS SupplierName,
    c.CategoryName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;
-- SQLBook: Code
SELECT * FROM `ProductDetails`;
-- SQLBook: Markup
### 9. Create a view to show customers who haven’t placed any orders.
-- SQLBook: Code
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
-- SQLBook: Code
SELECT * FROM CustomersWithoutOrders;
-- SQLBook: Markup
### 10. Create a view that uses the view from question 7, but only showing customers with revenue > 10000.
-- SQLBook: Markup
Can show KPI of # of medium, large customers
-- SQLBook: Code
CREATE VIEW HighValueCustomers AS
SELECT *
FROM CustomerTotalRevenue
WHERE TotalRevenue > 10000;
-- SQLBook: Code
SELECT * FROM HighValueCustomers
ORDER BY TotalRevenue DESC;
-- SQLBook: Markup
### Bonus
-- SQLBook: Code
SHOW TABLES;
-- SQLBook: Code
SELECT * FROM CustomerDemographics;
-- SQLBook: Code
-- Active: 1746427432550@@103-6-169-54.cloud-xip.com@3306@lesson6_northwind
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
