create database zara;
rename table zara to clothes;
select * from clothes;

-- 1 What is the average sales volume for products with promotions compared to those without? 

select promotion, avg(`Sales Volume`) as avg_sales_volume from clothes group by promotion;

-- 2.Which product categories have the highest and lowest sales volumes?

select `Product Category`, sum(`Sales Volume`) as total_sales 
from clothes 
group by `Product Category` 
order by total_sales desc;


-- 3.Identify the top 5 most expensive products for each category. 
WITH RankedProducts AS (SELECT`product category`,name,price,ROW_NUMBER() OVER 
(PARTITION BY `product category` ORDER BY price DESC) AS ran
FROM clothes
)
SELECT `product category`,name,price
FROM RankedProducts
WHERE ran <= 5;

-- 4.How many products are seasonal vs. non-seasonal, and what is their average price?

select seasonal, COUNT(*) AS Product_Count, avg(price) from clothes group by seasonal;

-- 5 Retrieve all products in a specific section (e.g., "MAN") with a price above a certain threshold.

select * from clothes where section = "man" and price >100;


-- 6 Find products where the description contains specific keywords like "jacket."

select * from clothes where description like "%jacket%";

-- 7 Calculate total sales volume by product category and position (e.g., Aisle vs. End-cap).

select `Product Category` AS category,
`Product Position` AS position,
sum(`Sales Volume`) AS total_sales_volume 
from clothes group by `Product Category`,`Product Position`;

-- 8 Summarize the total revenue generated per category.

select `product category`,sum(price * `sales volume`) as total_revenue 
from clothes group by `product category`;

