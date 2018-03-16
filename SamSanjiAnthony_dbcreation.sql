CREATE DATABASE REI_Database;
GO

USE REI_Database;
GO

-- Create the Customer Table
CREATE TABLE Customer(
	CustomerID bigint NOT NULL PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Email varchar(50) NOT NULL,
	Phone char(10) NOT NULL,
	StreetAddress varchar(50) NOT NULL,
	City varchar(50),
	State varchar(20) NOT NULL,
	ZipCode char(10));

-- Create SalesReceipt Table
CREATE TABLE SalesReceipt(
	SalesReceiptID bigint NOT NULL PRIMARY KEY,
	EmployeeID bigint NOT NULL,
	CustomerID bigint NOT NULL,
	Date date NOT NULL,
	Subtotal money NOT NULL,
	TaxAmount money NOT NULL,
	TotalDue AS Subtotal + TaxAmount);

-- Create SalesLineItem Table
CREATE TABLE SalesLineItem(
	SalesLineItemID bigint NOT NULL PRIMARY KEY,
	SalesReceiptID bigint NOT NULL,
	ProductID bigint NOT NULL,
	OrderQuantity char(10) NOT NULL,
	ListPrice money NOT NULL,
	LineTotal AS OrderQuantity * ListPrice);

-- Create Employee Table
CREATE TABLE Employees(
	EmployeeID bigint NOT NULL PRIMARY KEY,
	FirstName varchar(50),
	LastName varchar(50),
	Job varchar(50),
	Email varchar(50));

-- Create Product Table
CREATE TABLE Products(
	ProductID bigint NOT NULL PRIMARY KEY,
	ProductName varchar(50) NOT NULL,
	Category varchar(50) NOT NULL,
	Subcategory varchar(50),
	Supplier varchar(50) NOT NULL,
	ListPrice money NOT NULL,
	Color varchar(20),
	Size varchar(50),
	Inventory int);


-- Add Foreign Key to SalesReceipt Table (SalesReceipt.EmployeeID = Employees.EmployeeID)

ALTER TABLE SalesReceipt
ADD CONSTRAINT FK_Employee_SalesReceipt
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

-- Add Foreign Key to SalesReceipt Table (SalesReceipt.CustomerID = Customer.CustomerID)

ALTER TABLE SalesReceipt
ADD CONSTRAINT FK_Customer_SalesReceipt
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

-- Add Foreign Key to SalesLineItem Table (SalesLineItem.SalesReceiptID = SalesReceipt.SalesReceiptID)

ALTER TABLE SalesLineItem
ADD CONSTRAINT FK_SalesReceipt_SalesLineItem
FOREIGN KEY (SalesReceiptID) REFERENCES SalesReceipt(SalesReceiptID);

-- Add Foreign Key to SalesLineItem Table (SalesLineItem.ProductID = Products.ProductID)

ALTER TABLE SalesLineItem
ADD CONSTRAINT FK_Products_SalesLineItem
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

-- Add customer records to the Customers Table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone, StreetAddress, City, State, ZipCode) VALUES 
(1, 'Sanji', 'Johari', 'sanji@aol.com', 9972074773, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(2, 'Carmine', 'Melson', 'carmine@aol.com', 7686714901, '2057 Joanne Lane', 'Harvard', 'Massachusetts', 01451),
(3, 'Loura', 'Baley', 'loura23@aol.com', 6774387687, '3366 C Street', 'Boston', 'Massachusetts', 02199),
(4, 'Mariette', 'Rutan', 'mariette1@aol.com', 4889549857, '3841 Kovar Road', 'Boston', 'Massachusetts', 02110),
(5, 'Maia', 'Sibert', 'maiamom@aol.com', 6358832627, '4488 Cedar Lane', 'East Boston', 'Massachusetts', 02128),
(6, 'Ivey', 'Mcdougle', 'iveryhorn@aol.com', 3131908191, '3301 Stadium Drive', 'Dedham', 'Massachusetts', 02026),
(7, 'Ebony', 'Mascarenas', 'ebony10@aol.com', 4857705482, '2744 Huntz Lane', 'Worcester', 'Massachusetts', 01608),
(8, 'Jeanice', 'More', 'jeanice69@aol.com', 6178733362, '1164 Lyon Avenue', 'Boston', 'Massachusetts', 02110),
(9, 'Herman', 'Albright', 'herman420@hotmail.com', 6011591607, '3995 Rockford Road', 'Bolton', 'Massachusetts', 01740),
(10, 'Vella', 'McCook', 'manillavella@aol.com', 7018456081, '1230 Randolph Street', 'Worcester', 'Massachusetts', 01610),
(11, 'Jule', 'Blakemore', 'juuljule@gmail.com', 2629544297, '4159 Gerald L. Bates Drive', 'Boston', 'Massachusetts', 02107),
(12, 'Shanel', 'Pua', 'shanel@babson.edu', 5935971729, '717 Hilltop Street', 'Springfield', 'Massachusetts', 01103),
(13, 'Jacquie', 'Clinard', 'jax@aol.com', 2336767620, '1339 Romano Street', 'Franklin', 'Massachusetts', 02038),
(14, 'Andres', 'Friedman', 'andres@aol.com', 4718827140, '783 Raindy Day Drive', 'Charlestown', 'Massachusetts', 02129),
(15, 'Regena', 'Rieves', 'regena_spex@aol.com', 1364924899, '2679 Pearlman Avenue', 'Bedford', 'Massachusetts', 01730),
(16, 'Sabra', 'Parks', 'hummusqueen@aol.com', 2299234857, '2242 Ferguson Street', 'Boston', 'Massachusetts', 02110),
(17, 'Osvaldo', 'Millington', 'osvaldo@msn.com', 3535096284, '1036 Gerald L. Bates Drive', 'Brighton', 'Massachusetts', 02135),
(18, 'Tien', 'Krejci', 'tien@aol.com', 5333072188, '3672 Hillside Drive', 'North Billerica', 'Massachusetts', 01862),
(19, 'Christel', 'Vencill', 'christel@aol.com', 6123937459, '2091 Hampton Meadows', 'South Boston', 'Massachusetts', 02127),
(20, 'Natalie', 'Crisp', 'crispnatalie@gmail.com', 1985792142, '314 Lyon Avenue', 'Boston', 'Massachusetts', 02110);

-- Add employee records to the Employees Table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Job, Email) VALUES
(1, 'Velma', 'Copeland', 'Sales Representative', 'vcopeland@rei.com'),
(2, 'Lynne', 'Delgado', 'Sales Representative', 'ldelgado@rei.com'),
(3, 'Ramiro', 'Watson', 'Sales Representative', 'rwatson@rei.com'),
(4, 'Jackie', 'Spencer', 'Sales Representative', 'jspencer@rei.com'),
(5, 'Allan', 'Price', 'Sales Manager', 'aprice@rei.com'),
(6, 'Sue', 'Parker', 'Customer Service', 'sparker@rei.com'),
(7, 'Margaret', 'Griffin', 'Customer Service', 'mgriffin@rei.com'),
(8, 'Matt', 'Buchanan', 'Regional Manager', 'mbuchanan@rei.com');

-- Add product records to the Products Table

BULK INSERT Products
FROM 'C:\Users\sgaudet1\Documents\GitHub\MIS3545_Project1\table_records\Products.csv'
WITH
(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	ROWS_PER_BATCH = 129,
	FIRSTROW = 2
);


-- Add sales receipt records to the Sales Receipt Table (NOTE: calculated field need NOT be specified)
--INSERT INTO SalesReceipt (SalesReceiptID, EmployeeID, CustomerID, Date, Subtotal, TaxAmount) VALUES
--(1, 1, 1, 2018-02-22, 100, 10);