# Relational Database Design

Team Members: Sam Gaudet, Sanji Johari, Anthony Krichevskiy

## Company Background

Recreational Equipment, Inc., *REI*, is an American retail and outdoor recreation services corporation. REI was founded in Seattle, WA in 1938, and now has approximately 154 stores in 36 states.

REI is organized as a consumer cooperative, where members have the ability to purchase a lifetime membership in order to receive classes, access to events, and a 5% per-year dividend. REI sells sporting goods, camping gear, travel equipment, and clothing, while focusing on environmental and social responsibility as well.

## Relational Database Design

At its core, REI buys inventory from suppliers and sells these items to their customers. Their relational database must store customer information and history, orders and sales invoices, and supply chain information including costs and inventory shipments. The database designed in this project represents the database that would manage one store's personnel, customers, products, inventory, etc. Therefore, there is no online sales information included in this database design, as it is outside of the operations of a single store.

## Database Tables & Fields

**Customer Table**

```CustomerID``` A primary key, unique identifier for each customer.  
```FirstName``` The first name of the customer, text.  
```LastName``` The last name of the customer, text.  

**Order Table**

```OrderID``` A primary key, unique identifier for each order.

**Sales Table**

```SaleID``` A primary key, unique identifier for each sale.

**Employee Table**

```EmployeeID``` A primary key, unique identifier for each employee.  
```FirstName``` The first name of the customer, text.  
```LastName``` The last name of the customer, text.  
```Job``` The job function of a given employee, text.

**Product Table**

```ProductID```
```ProductName```
```Category```
```Subcategory```
```Brand```
```ListPrice```
```Color```
```Size```
```Inventory```