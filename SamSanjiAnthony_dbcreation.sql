CREATE DATABASE REI_Database;
GO

USE REI_Database;
GO

-- Create the Customer Table
CREATE TABLE Customer(
	CustomertID bigint NOT NULL PRIMARY KEY,
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
	SaleID bigint NOT NULL PRIMARY KEY,
	EmployeeID bigint NOT NULL,
	CustomerID bigint NOT NULL,
	Date datetime NOT NULL,
	Subtotal money NOT NULL,
	TaxAmount money NOT NULL,
	TotalDue AS Subtotal + TaxAmount);

