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
	SalesReceiptID bigint NOT NULL PRIMARY KEY,
	EmployeeID bigint NOT NULL,
	CustomerID bigint NOT NULL,
	Date datetime NOT NULL,
	Subtotal money NOT NULL,
	TaxAmount money NOT NULL,
	TotalDue AS Subtotal + TaxAmount);

-- Create SalesLineItem Table
CREATE TABLE SalesLineItem(
	SalesLineItemID bigint NOT NULL,
	ProductID bigint NOT NULL,
	OrderQuantity char(10) NOT NULL,
	ListPrice money NOT NULL,
	LineTotal AS OrderQuantity * ListPrice);

-- Create Employee Table
CREATE TABLE Employees(
	EmployeeID bigint NOT NULL,
	FirstName varchar(50),
	LastName varchar(50),
	Job varchar(50),
	Email varchar(50));

-- Create Product Table
CREATE TABLE Products(
	ProductID bigint NOT NULL,
	ProductName varchar(50) NOT NULL,
	Category varchar(50) NOT NULL,
	Subcategory varchar(50) NOT NULL,
	Brand varchar(50) NOT NULL,
	ListPrice money NOT NULL,
	Color varchar(20),
	Size varchar(10),
	Supplier varchar(50) NOT NULL,
	Inventory char(10) NOT NULL);