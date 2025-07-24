# Data sources
### Folder structure
- `wrpracti_northwind.sql`: small-size dataset of the Northwind database. This file includes table definition and data insertion, the number of data records for each table has been reduced to minimise the size.
- `other_employees.csv`: additional data records for `Employees` table which is used in question 3.
- `other_employees.xlsx`: using Excel formula or Power Query, we created `INSERT` statements from the csv files.

### Details
For a schema of Northwind database, see https://www.w3resource.com/mysql-exercises/

In the Excel file, we managed to generate SQL Insert statements with the below formula and table combination in Power Query:
![image](https://github.com/user-attachments/assets/836764f5-26c5-4a7a-a644-c8b06cd0b5b8)

#### Formula:
```
="INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES('" & B2 & "'," & C2...
```
*String-type variable should be quoted, with single quotes. Hence, the need for `"',"` between every B2, C2, D2, etc in the formula.*

#### Power Query:
Pre-process data with Power Query, and combine the data into the part after `VALUES` of the `INSERT INTO` statement
![image](https://github.com/user-attachments/assets/86f64e98-688f-4fc9-b5d0-04855dda83e2)

This will save you time handling the data in Excel formula:
![image](https://github.com/user-attachments/assets/2308511d-319f-41c6-bafd-0480216f336d)
```
="INSERT INTO Employees (LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath,Salary) VALUES(" & A2 & ");"
```

