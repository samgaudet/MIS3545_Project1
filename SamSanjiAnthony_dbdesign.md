# Relational Database Design

Team Members: Sam Gaudet, Sanji Johari, Anthony Krichevskiy

## Company Background

Recreational Equipment, Inc., *REI*, is an American retail and outdoor recreation services corporation. REI was founded in Seattle, WA in 1938, and now has approximately 154 stores in 36 states.

REI is organized as a consumer cooperative, where members have the ability to purchase a lifetime membership in order to receive classes, access to events, and a 5% per-year dividend. REI sells sporting goods, camping gear, travel equipment, and clothing, while focusing on environmental and social responsibility as well.

## Relational Database Design

At its core, REI buys inventory from suppliers and sells these items to their customers. Their relational database must store customer information and history, orders and sales invoices, and supply chain information including costs and inventory shipments. The database designed in this project represents the database that would manage one store's personnel, customers, products, inventory, etc. Therefore, there is no online sales information included in this database design, as it is outside of the operations of a single store.

## Database Tables & Fields

Here is the Entity Relationship Diagram for the REI database designed for this project, and described below:

![REI ERD](/images/Project1_ERD.png)

**Customer Table**

```CustomerID``` A primary key, unique identifier for each customer, bigint.  
```FirstName``` The first name of the customer, text.  
```LastName``` The last name of the customer, text.  
```Email``` The email address of the customer, text.  
```Phone``` The phone number of the customer, char.  
```StreetAddress``` The street address of the customer, text.  
```City``` The city of the customer's address, text.  
```State``` The state in which the customer lives, text.  
```ZipCode``` The postal code for the city in which the customer lives, char.

**SalesReceipt Table**

```SalesReceiptID``` A primary key, unique to each receipt, bigint.  
```SaleLineItemID``` A foreign key, unique for each line item sale, bigint.  
```EmployeeID``` A foreign key, the employee ID of the employee who made the sale, bigint.  
```CustomerID``` A foreign key, the customer ID of the customer who bought the product(s), bigint.  
```Date``` The date of the sale, datetime, date.  
```Subtotal``` The total from all of the LineTotal corresponding to the SaleID, money.  
```TaxAmount``` The tax associated with the Subtotal, money.  
```TotalDue``` The subtotal plus the tax amount, calculated (```Subtotal``` + ```TaxAmount```).  

**SalesLineItem Table**

```SalesLineItemID``` A primary key, unique identifier for each line item sale, bigint.  
```SalesReceiptID``` A foreign key, the sales receipt associated with specific sales line items, bigint.  
```ProductID``` A foreign key, the product that the customer is purchasing, bigint.  
```OrderQuantity``` How many units of the specified product the customer is purchasing, char.  
```ListPrice``` Per-unit price of each product, money.  
```LineTotal``` The total price for a given number of units of a certain product, calculated (```ListPrice``` * ```OrderQuantity```).

**Employee Table**

```EmployeeID``` A primary key, unique identifier for each employee, bigint.  
```FirstName``` The first name of the customer, text.  
```LastName``` The last name of the customer, text.  
```Job``` The job function of a given employee, text.  
```Email``` The business email address of a given employee, text.

**Product Table**

```ProductID``` A primary key, unique identifier for each product, bigint.  
```ProductName``` The name of a given product, text.  
```Category``` The category name of a given product, text.  
```Subcategory``` The subcategory name of a given product, text.  
```Supplier``` The brand name of the product, text.  
```ListPrice``` The listed retail price of the product, money.  
```Color``` The associated color of a product if relevant, text.  
```Size``` The associated size of a product if relevant, text.  
```Inventory``` The on-hand inventory of a product in the store, integer.  