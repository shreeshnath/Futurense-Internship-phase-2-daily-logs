#Navigating Complex Operators and Patterns in MySQL .

--Part 1: Mastering Pattern Matching with LIKE

--Scenario: Product Catalog Search
--Task 1.1: Wildcard Searches for Product Names

--code;
SELECT productName FROM products WHERE productName LIKE 'Classic%Car';

--Explanation:
--This query selects product names from the 'products' table where the product name starts with "Classic", followed by any characters (% wildcard), and ends with "Car". The LIKE operator with appropriate wildcards facilitates pattern matching.

--Task 1.2: Flexible Search for Customer Addresses

--code;
SELECT customerName, address FROM customers WHERE address LIKE '%Street%' OR address LIKE '%Avenue%';

--Explanation:
--Here, we retrieve customer names and addresses from the 'customers' table where the address contains the words "Street" or "Avenue" in any part of the address field. The % wildcard matches any sequence of characters.

--Part 2: Utilizing Range Queries with BETWEEN
--Scenario: Sales and Payment Analysis

--Task 2.1: Orders within a Price Range

--code;
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS totalAmount FROM orderdetails GROUP BY orderNumber HAVING totalAmount BETWEEN 1000 AND 2000;

--Explanation:
--This query calculates the total amount for each order by summing the product of quantity ordered and price each. Then, it filters orders with total amounts falling between $1000 and $2000 using the BETWEEN operator.

--Task 2.2: Payments within a Date Range

--code;
SELECT * FROM payments WHERE paymentDate BETWEEN '2003-01-01' AND '2003-06-30';

--Explanation:
--This query retrieves all payments made within the date range from January 1, 2003, to June 30, 2003, utilizing the BETWEEN operator to filter payment dates.

--Part 3: Exploring Subqueries with ANY and ALL
--Scenario: Comparative Sales Analysis

--Task 3.1: Orders Exceeding Average Sale Amount 

--code;
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS totalAmount FROM orderdetails GROUP BY orderNumber HAVING totalAmount > ANY (SELECT AVG(quantityOrdered * priceEach) FROM orderdetails);

--Explanation:
--Here, we compare the total amount of each order against the average sale amount across all orders. The subquery calculates the average sale amount, and the > ANY operator compares individual order totals against this average.

--Task 3.2: Products with Maximum Order Quantity sql

--code;
SELECT productName FROM products WHERE quantityOrdered = ALL (SELECT MAX(quantityOrdered) FROM orderdetails);

--Explanation:
--This query identifies products ordered in quantities equal to the maximum quantity ordered for any product. The subquery finds the maximum order quantity, and the = ALL operator selects products matching this quantity.

--Part 4: Combining Operators for Complex Queries
--Scenario: Customer and Sales Insight

-- Task 4.1: High-Value Customers in Specific Regions

-- code;
SELECT customerName, country, amount FROM customers JOIN ( SELECT customerNumber, SUM(amount) AS amount FROM payments GROUP BY customerNumber HAVING amount > ANY ( SELECT 0.9 * SUM(amount) FROM payments ) ) AS topCustomers ON customers.customerNumber = topCustomers.customerNumber WHERE country LIKE 'USA' OR country LIKE 'Canada';

-- Explanation:
-- This query identifies high-value customers located in the USA or Canada. It combines LIKE for geographic matching, a subquery with ANY to compare against top payments, and JOIN to retrieve customer details.

-- Task 4.2: Seasonal Sales Analysis

-- code;
SELECT productName, SUM(CASE WHEN MONTH(orderDate) BETWEEN 1 AND 3 THEN quantityOrdered ELSE 0 END) AS Q1_Sales, AVG(quantityOrdered) AS Avg_Annual_Sales FROM orderdetails JOIN products ON orderdetails.productCode = products.productCode GROUP BY productName HAVING Q1_Sales > 1.5 * Avg_Annual_Sales;

-- Explanation:
-- This query analyzes seasonal sales, identifying products with significantly higher sales in the first quarter compared to their annual average. It uses BETWEEN to define seasonal date ranges, aggregates for calculations, and HAVING to filter based on the specified condition.
