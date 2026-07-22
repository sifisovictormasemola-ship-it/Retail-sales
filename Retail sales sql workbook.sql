-- Databricks notebook source
SELECT *
FROM retail.sales.dataset;

SELECT -- This syntax is to show which gender buys most. (Female)
`Gender`,
SUM(`Total Amount`) as total_spending,
COUNT(*) as transaction_count,
AVG(`Total Amount`) as avg_transaction_value
FROM `retail`.`sales`.`dataset`
WHERE `Gender` IS NOT NULL
GROUP BY `Gender`
ORDER BY total_spending DESC;

SELECT`Product Category`, --This syntax shows which category makes the most revenue. (Electronics) 
SUM(`Total Amount`) as total_revenue,
SUM(`Quantity`) as total_quantity_sold,
COUNT(DISTINCT `Transaction ID`) as transaction_count
FROM `retail`.`sales`.`dataset`
WHERE `Product Category` IS NOT NULL
GROUP BY `Product Category`
ORDER BY total_revenue DESC;

SELECT
DATE_TRUNC('month', `Date`) as month,
SUM(`Total Amount`) as total_sales,
SUM(`Quantity`) as total_quantity,
COUNT(DISTINCT `Transaction ID`) as transaction_count
FROM `retail`.`sales`.`dataset`
WHERE `Date` IS NOT NULL
GROUP BY DATE_TRUNC('month', `Date`)
ORDER BY month;
--This query aggregates sales data by month, calculating total sales revenue, total quantity sold, and
--the number of transactions for each month.
--Key Findingsretail.sales.dataset
