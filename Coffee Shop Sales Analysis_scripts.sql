CREATE DATABASE Portifolio_Project;

-- Check NULL value
SELECT count(*)
FROM Portifolio_Project.sales
WHERE transaction_id IS NULL;


-- Showing monthly transcation vs monthly total bill 
SELECT 
	Month,
	COUNT(transaction_id) AS num_of_transaction,
    SUM(Total_Bill) AS amount
FROM Portifolio_Project.sales
GROUP BY month
ORDER BY Month;


-- Showing sales by product category
SELECT 
	product_category,
	COUNT(transaction_id) AS num_of_transaction
FROM Portifolio_Project.sales
GROUP BY product_category
ORDER BY num_of_transaction DESC;


-- Top 3 best-selling product in coffee
SELECT 
	product_type,
	COUNT(transaction_id) AS num_of_transaction
FROM Portifolio_Project.sales
WHERE product_category = 'coffee'
GROUP BY product_type
ORDER BY num_of_transaction DESC
LIMIT 3;


-- Average quantity and bill for each transcaction
SELECT 
	AVG(transaction_qty) AS avg_qty,
    AVG(Total_Bill) AS avg_bill
FROM Portifolio_Project.sales;


-- Peak period for sales
SELECT 
	CASE 
		WHEN Hour BETWEEN 8 AND 11 THEN 'Morning'
        WHEN Hour BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening' END AS peak_period,
	COUNT(transaction_id) AS num_of_transaction
FROM Portifolio_Project.sales
GROUP BY peak_period;
