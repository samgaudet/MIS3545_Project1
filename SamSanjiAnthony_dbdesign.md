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
```Email``` The email address of the customer, text.  
```Phone``` The phone number of the customer.  
```Street Address``` The street address of the customer.  
```City``` The city of the customer's address.  
```State``` The state in which the customer lives.  
```ZipCode``` The postal code for the city in which the customer lives.

**Sales Table**

```SaleID``` A primary key, unique identifier for each sale.  
```EmployeeID``` A foreign key, the employee ID of the employee who made the sale.  
```CustomerID``` A foreign key, the customer ID of the customer who bought the product(s).  
```Date``` The date of the sale, datetime.  
```ProductID``` A foreign key, the product that the customer is purchasing.  
```OrderQuantity``` How many units of the specified product the customer is purchasing.  

**Employee Table**

```EmployeeID``` A primary key, unique identifier for each employee.  
```FirstName``` The first name of the customer, text.  
```LastName``` The last name of the customer, text.  
```Job``` The job function of a given employee, text.  
```Email``` The business email address of a given employee, text.

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