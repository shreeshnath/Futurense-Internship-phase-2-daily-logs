# Joins - classicmodels Data base .

#Queries.

--Write a query to display a list of customers who locate in the same city by joining the customers table to itself.
select a.city as city,a.customerName as customerName,b.customerName as customerName from customers a,customers b where a.customerNumber <> b.customerNumber AND a.city=b.city order by a.city;

--Write a query to get:
  --The productCode and productName from the products table.
  --The textDescription of product lines from the productlines table.
select p.productCode, p.productName, SUBSTR(q.textDescription,1,75) from products p inner join productlines q on p.productLine = q.productLine LIMIT 5;

--  Write a query that returns order number, order status, and total sales from the orders and orderdetails tables as follows:
select p.orderNumber, p.status,SUM( q.quantityOrdered*q.priceEach) from orders p inner join orderdetails q on p.orderNumber = q.orderNumber group by p.orderNumber LIMIT 5;

--Write a query to fetch the complete details of orders from the orders, orderDetails, and products table, and sort them by orderNumber and orderLineNumber as follows:
select ord.orderNumber,ord.orderDate, ordet.orderLineNumber,p.productName,ordet.quantityOrdered,ordet.priceEach from orders ord inner join orderdetails ordet on ord.orderNumber = ordet.orderNumber inner join products p on ordet.productCode = p.productCode order by ordet.orderNumber,ordet.orderLineNumber LIMIT 13;

--Write a query to perform INNER JOIN of four tables:
-- orderdetails,orders,products ,customers .
--Display the details sorted by orderNumber, orderLineNumber as per the following
select ordet.orderNumber, ord.orderDate, c.customerName,ordet.orderLineNumber, p.productName,ordet.quantityOrdered,ordet.priceEach from orderdetails ordet inner join orders ord on ordet.orderNumber =ord.orderNumber inner join customers c on ord.customerNumber = c.customerNumber inner join products p on ordet.productCode = p.productCode order by ord.orderNumber,ordet.orderLineNumber Limit 19;

--Write a query to find the sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product as follows:
select ordet.orderNumber,p.productName,p.msrp, ordet.priceEach from products p inner join orderdetails ordet on p.productCode = ordet.productCode and ordet.priceEach < p.msrp where ordet.productCode="S10_1678" limit 8;

--Write a query to find the sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product as follows:
SELECT c.customerNumber, c.customerName, o.ordernumber, o.status FROM customers c LEFT JOIN orders o ON c.customerNumber=o.customerNumber;

--Write a query that uses the LEFT JOIN to find customers who have no order:
SELECT c.customerNumber, c.customerName, o.ordernumber, o.status FROM customers c LEFT JOIN orders o ON c.customerNumber=o.customerNumber where orderNumber is NULL;

