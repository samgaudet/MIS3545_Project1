# Relational Database Design

Team Members: Sam Gaudet, Sanji Johari, Anthony Krichevskiy

## Company Background

Recreational Equipment, Inc., *REI*, is an American retail corporation that sells sporting goods and outdoor gear. REI was founded in 1938, and now has approximately 154 stores in 36 states.

## Relational Database Design

At its core, REI buys inventory from suppliers and sells these items to their customers. Their relational database must store customer information and history, orders and sales invoices, and supply chain information including costs and inventory shipments.

## Database Tables & Fields

**Customer Table**

```CustomerID``` A primary key, unique identifier for each customer.  
```FirstName``` The first name of the customer, text.  
```LastName``` The last name of the customer, text.  