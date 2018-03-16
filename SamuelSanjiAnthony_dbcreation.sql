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
	Date datetime NOT NULL,
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
	Subcategory varchar(50) NOT NULL,
	Brand varchar(50) NOT NULL,
	ListPrice money NOT NULL,
	Color varchar(20),
	Size varchar(10),
	Supplier varchar(50) NOT NULL,
	Inventory char(10) NOT NULL);

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
(7, 'Ebony', 'Mascarenas', 'ebony10@aol.com', 4857705482, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(8, 'Jeanice', 'More', 'jeanice69@aol.com', 6178733362, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(9, 'Herman', 'Albright', 'herman420@hotmail.com', 6011591607, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(10, 'Vella', 'Mccook', 'manillavella@aol.com', 7018456081, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(11, 'Jule', 'Blakemore', 'juuljule@gmail.com', 2629544297, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(12, 'Shanel', 'Pua', 'shanel@babson.edu', 5935971729, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(13, 'Jacquie', 'Clinard', 'jax@aol.com', 2336767620, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(14, 'Andres', 'Friedman', 'andres@aol.com', 4718827140, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(15, 'Regena', 'Rieves', 'regena_spex@aol.com', 1364924899, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(16, 'Sabra', 'Parks', 'hummusqueen@aol.com', 2299234857, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(17, 'Osvaldo', 'Millington', 'osvaldo@msn.com', 3535096284, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(18, 'Tien', 'Krejci', 'tien@aol.com', 5333072188, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(19, 'Christel', 'Vencill', 'christel@aol.com', 6123937459, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106),
(20, 'Natalie', 'Crisp', 'crispnatalie@gmail.com', 1985792142, '22 Northfield Road', 'Longmeadow', 'Massachusetts', 01106);