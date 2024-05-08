#A Comprehensive Exercise on Grouping, Filtering, and Analyzing Data in MySQL.

--Task 1.1: Total Sales by Product Line

--code;
SELECT p.productLine, SUM(od.quantityOrdered * od.priceEach) AS totalSales FROM orderdetails od JOIN products p ON od.productCode = p.productCode GROUP BY p.productLine;

--Explanation:
--This query calculates the total sales for each product line by joining the orderdetails table with the products table to access the product line. It then aggregates the sales using the SUM() function and groups the results by product line.

--Task 1.2: Total Quantity Sold by Product Line

--code;
SELECT p.productLine, SUM(od.quantityOrdered) AS totalQuantitySold FROM orderdetails od JOIN products p ON od.productCode = p.productCode GROUP BY p.productLine;

--Explanation:
--Here, we determine the total quantity sold for each product line by summing the quantity ordered from the orderdetails table. The join with the products table allows access to the product line information, and the results are grouped by product line.

--Part 2: Advanced Grouping and Filtering with HAVING in classicmodels
--Scenario: High-Value Transactions Analysis

--Task 2.1: Average Sale Amount by Product Line with Filtering

--code;
SELECT p.productLine, AVG(od.quantityOrdered * od.priceEach) AS avgSaleAmount FROM orderdetails od JOIN products p ON od.productCode = p.productCode GROUP BY p.productLine HAVING avgSaleAmount > 10000;

--Explanation:
--This query calculates the average sale amount for each product line by joining the orderdetails table with the products table and using the AVG() function. The HAVING clause filters out product lines with an average sale amount above the specified threshold.

--Part 3: Complex Aggregations in world
--Scenario: Continent Demographics Analysis

--Task 3.1: Average Population and Total GDP by Continent

--code;
SELECT co.Continent, AVG(co.Population) AS avgPopulation, SUM(co.Population * co.GNP) AS totalGDP FROM country co GROUP BY co.Continent;

--Explanation:
--For each continent, this query calculates the average population using the AVG() function and the total GDP by multiplying population with GNP (Gross National Product) and then summing the results. The data is grouped by continent.

--Task 3.2: Countries with Multiple Official Languages

--code;
SELECT c.Name AS countryName FROM country c JOIN ( SELECT CountryCode FROM countrylanguage WHERE IsOfficial = 'T' GROUP BY CountryCode HAVING COUNT(*) > 1 ) AS cl ON c.Code = cl.CountryCode;

--Explanation:
--This query identifies countries with multiple official languages by joining the country table with a subquery that counts the number of official languages per country (where IsOfficial is 'T'). Countries with a count greater than 1 are selected.

--Part 4: Time Series Analysis in classicmodels
--Scenario: Sales Trends Analysis

--Task 4.1: Month-over-Month Sales Growth

--code;
SELECT YEAR(o.orderDate) AS year, MONTH(o.orderDate) AS month, p.productLine, (SUM(od.quantityOrdered * od.priceEach) - LAG(SUM(od.quantityOrdered * od.priceEach)) OVER (PARTITION BY p.productLine ORDER BY YEAR(o.orderDate), MONTH(o.orderDate))) / LAG(SUM(od.quantityOrdered * od.priceEach)) OVER (PARTITION BY p.productLine ORDER BY YEAR(o.orderDate), MONTH(o.orderDate)) * 100 AS salesGrowthPercentage FROM orders o JOIN orderdetails od ON o.orderNumber = od.orderNumber JOIN products p ON od.productCode = p.productCode GROUP BY year, month, p.productLine;

--Explanation:
--This query calculates the month-over-month sales growth percentage for each product line by utilizing window functions like LAG() to compare current month sales to the previous month. The results are grouped by year, month, and product line.

Task 4.2: Quarterly Sales Analysis

--code;
SELECT YEAR(o.orderDate) AS year, QUARTER(o.orderDate) AS quarter, o.officeCode, SUM(od.quantityOrdered * od.priceEach) AS totalSales FROM orders o JOIN orderdetails od ON o.orderNumber = od.orderNumber GROUP BY year, quarter, o.officeCode;

--Explanation:
Here, we perform quarterly sales analysis by summarizing sales data quarterly using the QUARTER() function to extract the quarter from the order date. The results are grouped by year, quarter, and office code to identify quarters with significantly higher sales for each office.








