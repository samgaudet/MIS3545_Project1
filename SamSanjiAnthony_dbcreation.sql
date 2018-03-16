﻿CREATE DATABASE REI_Database;
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
	Subtotal money,
	TaxAmount money,
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

-- Add Sales Receipts to the SalesReceipts Table

INSERT INTO SalesReceipt (SalesReceiptID, EmployeeID, CustomerID, Date, Subtotal, TaxAmount) VALUES
(1, 2, 8, '2015-01-03', 349.75, 21.86),
(2, 3, 11, '2015-01-09', 814.97, 50.94),
(3, 1, 17, '2015-01-12', 454.93, 28.43),
(4, 4, 1, '2015-01-12', 771.87, 48.24),
(5, 2, 17, '2015-01-13', 1008.99, 63.06),
(6, 1, 18, '2015-01-13', 2673, 167.06),
(7, 4, 18, '2015-02-04', 130, 8.13),
(8, 2, 4, '2015-02-06', 139.99, 8.75),
(9, 2, 12, '2015-02-07', 6689.93, 418.12),
(10, 2, 18, '2015-02-11', 4636.5, 289.78),
(11, 3, 17, '2015-02-17', 619.65, 38.73),
(12, 1, 5, '2015-03-02', 359.97, 22.5),
(13, 2, 15, '2015-03-04', 1799.7, 112.48),
(14, 4, 13, '2015-03-09', 74.97, 4.69),
(15, 3, 10, '2015-03-23', 719.94, 45),
(16, 3, 3, '2015-03-23', 349.75, 21.86),
(17, 1, 8, '2015-04-02', 298, 18.63),
(18, 1, 13, '2015-04-06', 869.91, 54.37),
(19, 4, 10, '2015-04-09', 2159.96, 135),
(20, 1, 10, '2015-04-17', 795, 49.69),
(21, 2, 4, '2015-04-17', 2842.98, 177.69),
(22, 2, 10, '2015-04-18', 449.95, 28.12),
(23, 1, 18, '2015-04-23', 587.98, 36.75),
(24, 4, 3, '2015-05-13', 779.5, 48.72),
(25, 3, 1, '2015-05-16', 1279.65, 79.98),
(26, 1, 11, '2015-05-20', 329.97, 20.62),
(27, 2, 12, '2015-05-26', 2599.95, 162.5),
(28, 4, 15, '2015-05-28', 195, 12.19),
(29, 1, 1, '2015-06-06', 649.7, 40.61),
(30, 2, 11, '2015-07-01', 596, 37.25),
(31, 4, 7, '2015-07-02', 584.96, 36.56),
(32, 1, 2, '2015-07-06', 859.99, 53.75),
(33, 1, 17, '2015-07-13', 539.94, 33.75),
(34, 3, 18, '2015-07-13', 479.96, 30),
(35, 1, 16, '2015-07-28', 1043, 65.19),
(36, 3, 7, '2015-07-28', 390, 24.38),
(37, 3, 2, '2015-08-10', 269.97, 16.87),
(38, 1, 1, '2015-08-14', 2598, 162.38),
(39, 4, 7, '2015-09-11', 1995, 124.69),
(40, 2, 9, '2015-09-11', 2478, 154.88),
(41, 4, 5, '2015-09-16', 90, 5.63),
(42, 1, 2, '2015-09-19', 745, 46.56),
(43, 2, 10, '2015-10-03', 1119.83, 69.99),
(44, 2, 11, '2015-10-19', 2278.9, 142.43),
(45, 2, 12, '2015-11-04', 1204.98, 75.31),
(46, 3, 6, '2015-12-01', 419.96, 26.25),
(47, 1, 4, '2015-12-04', 2319.66, 144.98),
(48, 3, 8, '2015-12-09', 1043, 65.19),
(49, 1, 2, '2015-12-12', 359.97, 22.5),
(50, 1, 5, '2015-12-14', 1192, 74.5),
(51, 4, 2, '2016-01-12', 1049.63, 65.6),
(52, 3, 19, '2016-01-20', 0, 0),
(53, 2, 11, '2016-01-21', 99.96, 6.25),
(54, 3, 11, '2016-01-30', 419.7, 26.23),
(55, 1, 11, '2016-02-04', 2699.97, 168.75),
(56, 4, 15, '2016-02-16', 1559.97, 97.5),
(57, 2, 16, '2016-02-18', 179.98, 11.25),
(58, 1, 2, '2016-02-26', 1274.7, 79.67),
(59, 1, 12, '2016-03-08', 2579.97, 161.25),
(60, 1, 20, '2016-03-09', 1902.95, 118.93),
(61, 4, 7, '2016-03-09', 1349.87, 84.37),
(62, 1, 10, '2016-03-18', 1972.92, 123.31),
(63, 3, 14, '2016-03-26', 224.94, 14.06),
(64, 3, 5, '2016-03-31', 2699.94, 168.75),
(65, 1, 2, '2016-04-06', 539.94, 33.75),
(66, 3, 15, '2016-04-08', 3689.89, 230.62),
(67, 3, 18, '2016-05-02', 69.95, 4.37),
(68, 4, 10, '2016-05-13', 399, 24.94),
(69, 2, 14, '2016-05-17', 15, 0.94),
(70, 2, 18, '2016-05-26', 954, 59.63),
(71, 2, 5, '2016-06-13', 199.96, 12.5),
(72, 2, 15, '2016-06-22', 279.8, 17.49),
(73, 3, 2, '2016-07-13', 359.97, 22.5),
(74, 1, 14, '2016-07-15', 195, 12.19),
(75, 4, 11, '2016-07-23', 1799.98, 112.5),
(76, 2, 2, '2016-07-27', 99.96, 6.25),
(77, 4, 3, '2016-07-27', 105, 6.56),
(78, 4, 2, '2016-07-30', 599.95, 37.5),
(79, 2, 15, '2016-08-01', 319.8, 19.99),
(80, 1, 10, '2016-08-04', 359.97, 22.5),
(81, 3, 1, '2016-08-09', 449.95, 28.12),
(82, 1, 8, '2016-08-13', 1499.75, 93.73),
(83, 1, 13, '2016-09-03', 239.85, 14.99),
(84, 3, 10, '2016-09-08', 390, 24.38),
(85, 3, 14, '2016-09-16', 2599.95, 162.5),
(86, 1, 8, '2016-09-20', 269.97, 16.87),
(87, 4, 4, '2016-09-24', 449.95, 28.12),
(88, 4, 15, '2016-09-24', 359.96, 22.5),
(89, 1, 6, '2016-09-29', 489.65, 30.6),
(90, 4, 17, '2016-10-01', 999.74, 62.48),
(91, 2, 20, '2016-10-11', 1169.89, 73.12),
(92, 3, 2, '2016-10-17', 599.95, 37.5),
(93, 4, 13, '2016-10-19', 409.95, 25.62),
(94, 1, 8, '2016-11-08', 408, 25.5),
(95, 2, 18, '2016-12-09', 979.93, 61.25),
(96, 4, 4, '2016-12-23', 60, 3.75),
(97, 2, 3, '2017-01-02', 260, 16.25),
(98, 3, 3, '2017-01-04', 559.96, 35),
(99, 3, 3, '2017-02-02', 3764.88, 235.31),
(100, 4, 20, '2017-02-16', 239.98, 15),
(101, 2, 20, '2017-03-04', 499.93, 31.25),
(102, 3, 7, '2017-03-18', 359.97, 22.5),
(103, 1, 14, '2017-03-24', 489.65, 30.6),
(104, 2, 12, '2017-03-30', 1199.8, 74.99),
(105, 4, 6, '2017-04-01', 1379, 86.19),
(106, 2, 13, '2017-04-17', 114.98, 7.19),
(107, 4, 11, '2017-04-18', 1197, 74.81),
(108, 1, 19, '2017-04-19', 5609.89, 350.62),
(109, 2, 20, '2017-05-06', 1351.91, 84.49),
(110, 4, 3, '2017-05-13', 539.94, 33.75),
(111, 2, 18, '2017-05-18', 1844.95, 115.31),
(112, 4, 8, '2017-05-20', 3712.98, 232.06),
(113, 1, 20, '2017-05-29', 4409.57, 275.6),
(114, 2, 14, '2017-06-02', 449.99, 28.12),
(115, 4, 14, '2017-06-05', 1948.5, 121.78),
(116, 1, 9, '2017-06-23', 3657.94, 228.62),
(117, 3, 5, '2017-06-24', 2013.7, 125.86),
(118, 2, 16, '2017-07-20', 2128.92, 133.06),
(119, 1, 19, '2017-07-22', 4569.92, 285.62),
(120, 4, 3, '2017-07-27', 999.83, 62.49),
(121, 1, 5, '2017-09-05', 2572.43, 160.78),
(122, 4, 13, '2017-09-28', 1579.8, 98.74),
(123, 4, 6, '2017-10-02', 599.95, 37.5),
(124, 2, 16, '2017-10-03', 3179.9, 198.74),
(125, 3, 7, '2017-10-12', 260, 16.25),
(126, 4, 8, '2017-10-16', 839.93, 52.5),
(127, 1, 14, '2017-10-25', 837.94, 52.37),
(128, 3, 7, '2017-11-02', 99.96, 6.25),
(129, 1, 3, '2017-11-07', 159.9, 9.99),
(130, 3, 7, '2017-11-09', 629.93, 39.37),
(131, 4, 5, '2017-11-17', 745, 46.56),
(132, 1, 14, '2017-11-23', 839.93, 52.5),
(133, 4, 3, '2017-11-25', 74.97, 4.69),
(134, 2, 3, '2017-12-04', 629.93, 39.37),
(135, 1, 12, '2017-12-07', 959.92, 60),
(136, 3, 2, '2017-12-09', 4456.65, 278.54),
(137, 3, 15, '2017-12-14', 239.98, 15),
(138, 3, 2, '2017-12-21', 359.97, 22.5),
(139, 1, 12, '2017-12-22', 340, 21.25),
(140, 1, 10, '2017-12-30', 599.95, 37.5),
(141, 2, 10, '2017-12-30', 264.9, 16.56),
(142, 4, 5, '2018-01-16', 899.99, 56.25),
(143, 2, 15, '2018-01-22', 449.95, 28.12),
(144, 1, 19, '2018-01-24', 359.97, 22.5),
(145, 3, 8, '2018-02-16', 6899.88, 431.24),
(146, 3, 7, '2018-02-20', 139.9, 8.74),
(147, 2, 8, '2018-02-21', 298, 18.63),
(148, 3, 19, '2018-02-23', 24.99, 1.56),
(149, 3, 10, '2018-02-24', 179.98, 11.25),
(150, 2, 4, '2018-03-14', 629.93, 39.37);

-- Add Sales Line Item data to the SalesLineItem Table

INSERT INTO SalesLineItem (SalesLineItemID, SalesReceiptID, ProductID, OrderQuantity, ListPrice) VALUES
(1, 1, 26, 5, 69.95),
(2, 2, 38, 3, 119.99),
(3, 2, 92, 7, 65),
(4, 3, 66, 7, 15),
(5, 3, 100, 7, 49.99),
(6, 4, 34, 2, 69.95),
(7, 4, 46, 3, 119.99),
(8, 4, 62, 4, 68),
(9, 5, 13, 1, 859.99),
(10, 5, 114, 1, 149),
(11, 6, 4, 4, 649.5),
(12, 6, 66, 5, 15),
(13, 7, 91, 2, 65),
(14, 8, 18, 1, 139.99),
(15, 9, 14, 7, 899.99),
(16, 9, 93, 6, 65),
(17, 10, 1, 7, 649.5),
(18, 10, 66, 6, 15),
(19, 11, 35, 7, 69.95),
(20, 11, 89, 2, 65),
(21, 12, 122, 3, 119.99),
(22, 13, 23, 6, 299.95),
(23, 14, 97, 3, 24.99),
(24, 15, 44, 6, 119.99),
(25, 16, 34, 5, 69.95),
(26, 17, 115, 2, 149),
(27, 18, 39, 2, 119.99),
(28, 18, 69, 7, 89.99),
(29, 19, 10, 4, 539.99),
(30, 20, 21, 5, 159),
(31, 21, 15, 7, 399),
(32, 21, 99, 2, 24.99),
(33, 22, 80, 5, 89.99),
(34, 23, 59, 6, 68),
(35, 23, 75, 2, 89.99),
(36, 24, 2, 1, 689.5),
(37, 24, 66, 6, 15),
(38, 25, 34, 6, 69.95),
(39, 25, 89, 4, 65),
(40, 25, 124, 5, 119.99),
(41, 26, 38, 2, 119.99),
(42, 26, 75, 1, 89.99),
(43, 27, 9, 5, 519.99),
(44, 28, 91, 3, 65),
(45, 29, 53, 5, 79.95),
(46, 29, 101, 5, 49.99),
(47, 30, 115, 4, 149),
(48, 31, 66, 7, 15),
(49, 31, 120, 4, 119.99),
(50, 32, 13, 1, 859.99),
(51, 33, 86, 6, 89.99),
(52, 34, 128, 4, 119.99),
(53, 35, 115, 7, 149),
(54, 36, 107, 6, 65),
(55, 37, 87, 3, 89.99),
(56, 38, 4, 4, 649.5),
(57, 39, 16, 5, 399),
(58, 40, 3, 4, 619.5),
(59, 41, 67, 6, 15),
(60, 42, 111, 5, 149),
(61, 43, 17, 7, 139.99),
(62, 43, 35, 2, 69.95),
(63, 44, 5, 2, 689.5),
(64, 44, 74, 7, 89.99),
(65, 44, 83, 3, 89.99),
(66, 45, 6, 2, 439.99),
(67, 45, 104, 5, 65),
(68, 46, 42, 2, 119.99),
(69, 46, 80, 2, 89.99),
(70, 47, 8, 4, 459.99),
(71, 47, 53, 6, 79.95),
(72, 48, 116, 7, 149),
(73, 49, 43, 3, 119.99),
(74, 50, 112, 6, 149),
(75, 50, 114, 2, 149),
(76, 51, 32, 6, 69.95),
(77, 51, 69, 7, 89.99),
(78, 53, 98, 4, 24.99),
(79, 54, 26, 6, 69.95),
(80, 55, 14, 3, 899.99),
(81, 56, 9, 3, 519.99),
(82, 57, 80, 2, 89.99),
(83, 58, 32, 5, 69.95),
(84, 58, 44, 5, 119.99),
(85, 58, 92, 5, 65),
(86, 59, 13, 3, 859.99),
(87, 60, 88, 4, 65),
(88, 60, 118, 7, 149),
(89, 60, 120, 5, 119.99),
(90, 61, 77, 7, 89.99),
(91, 61, 121, 6, 119.99),
(92, 62, 45, 7, 119.99),
(93, 62, 83, 1, 89.99),
(94, 62, 111, 7, 149),
(95, 63, 95, 3, 24.99),
(96, 63, 100, 1, 49.99),
(97, 63, 102, 2, 49.99),
(98, 64, 7, 6, 449.99),
(99, 65, 84, 6, 89.99),
(100, 66, 10, 6, 539.99),
(101, 66, 84, 5, 89.99),
(102, 67, 30, 1, 69.95),
(103, 68, 15, 1, 399),
(104, 69, 67, 1, 15),
(105, 70, 20, 6, 159),
(106, 71, 101, 4, 49.99),
(107, 72, 35, 4, 69.95),
(108, 73, 43, 3, 119.99),
(109, 74, 88, 3, 65),
(110, 75, 14, 2, 899.99),
(111, 76, 94, 4, 24.99),
(112, 77, 65, 7, 15),
(113, 78, 127, 5, 119.99),
(114, 79, 52, 4, 79.95),
(115, 80, 43, 3, 119.99),
(116, 81, 73, 5, 89.99),
(117, 82, 24, 5, 299.95),
(118, 83, 54, 3, 79.95),
(119, 84, 104, 6, 65),
(120, 85, 9, 5, 519.99),
(121, 86, 74, 3, 89.99),
(122, 87, 74, 5, 89.99),
(123, 88, 71, 4, 89.99),
(124, 89, 31, 7, 69.95),
(125, 90, 29, 4, 69.95),
(126, 90, 45, 6, 119.99),
(127, 91, 76, 5, 89.99),
(128, 91, 126, 6, 119.99),
(129, 92, 48, 5, 119.99),
(130, 93, 99, 2, 24.99),
(131, 93, 126, 3, 119.99),
(132, 94, 60, 6, 68),
(133, 95, 19, 7, 139.99),
(134, 96, 66, 4, 15),
(135, 97, 93, 4, 65),
(136, 98, 17, 4, 139.99),
(137, 99, 9, 7, 519.99),
(138, 99, 99, 5, 24.99),
(139, 100, 46, 2, 119.99),
(140, 101, 90, 5, 65),
(141, 101, 96, 7, 24.99),
(142, 102, 120, 3, 119.99),
(143, 103, 26, 7, 69.95),
(144, 104, 23, 4, 299.95),
(145, 105, 5, 2, 689.5),
(146, 106, 83, 1, 89.99),
(147, 106, 97, 1, 24.99),
(148, 107, 16, 3, 399),
(149, 108, 13, 6, 859.99),
(150, 108, 77, 5, 89.99),
(151, 109, 39, 7, 119.99),
(152, 109, 58, 4, 68),
(153, 109, 126, 2, 119.99),
(154, 110, 81, 6, 89.99),
(155, 111, 19, 3, 139.99),
(156, 111, 20, 5, 159),
(157, 111, 106, 6, 65),
(158, 111, 121, 2, 119.99),
(159, 112, 8, 2, 459.99),
(160, 112, 15, 7, 399),
(161, 113, 11, 6, 559.99),
(162, 113, 27, 6, 69.95),
(163, 113, 68, 7, 89.99),
(164, 114, 7, 1, 449.99),
(165, 115, 1, 3, 649.5),
(166, 116, 11, 6, 559.99),
(167, 116, 113, 2, 149),
(168, 117, 25, 6, 299.95),
(169, 117, 88, 1, 65),
(170, 117, 110, 1, 149),
(171, 118, 2, 2, 689.5),
(172, 118, 83, 7, 89.99),
(173, 118, 126, 1, 119.99),
(174, 119, 13, 5, 859.99),
(175, 119, 81, 3, 89.99),
(176, 120, 55, 2, 79.95),
(177, 120, 128, 7, 119.99),
(178, 121, 24, 3, 299.95),
(179, 121, 32, 5, 69.95),
(180, 121, 50, 3, 79.95),
(181, 121, 64, 2, 19.99),
(182, 121, 117, 7, 149),
(183, 122, 33, 2, 69.95),
(184, 122, 70, 5, 89.99),
(185, 122, 108, 6, 65),
(186, 122, 123, 5, 119.99),
(187, 123, 125, 5, 119.99),
(188, 124, 7, 6, 449.99),
(189, 124, 39, 4, 119.99),
(190, 125, 104, 4, 65),
(191, 126, 47, 7, 119.99),
(192, 127, 85, 6, 89.99),
(193, 127, 117, 2, 149),
(194, 128, 99, 4, 24.99),
(195, 129, 55, 2, 79.95),
(196, 130, 82, 7, 89.99),
(197, 131, 116, 5, 149),
(198, 132, 121, 7, 119.99),
(199, 133, 98, 3, 24.99),
(200, 134, 72, 7, 89.99),
(201, 135, 119, 7, 119.99),
(202, 135, 123, 1, 119.99),
(203, 136, 4, 6, 649.5),
(204, 136, 56, 7, 79.95),
(205, 137, 46, 2, 119.99),
(206, 138, 40, 3, 119.99),
(207, 139, 58, 5, 68),
(208, 140, 44, 5, 119.99),
(209, 141, 51, 2, 79.95),
(210, 141, 67, 7, 15),
(211, 142, 14, 1, 899.99),
(212, 143, 76, 5, 89.99),
(213, 144, 43, 3, 119.99),
(214, 145, 14, 7, 899.99),
(215, 145, 41, 5, 119.99),
(216, 146, 32, 2, 69.95),
(217, 147, 114, 2, 149),
(218, 148, 96, 1, 24.99),
(219, 149, 87, 2, 89.99),
(220, 150, 76, 2, 89.99),
(221, 150, 77, 5, 89.99);