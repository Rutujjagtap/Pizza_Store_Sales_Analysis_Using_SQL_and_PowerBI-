--Using the Database
USE [Pizza DB];

--Previewing the Database
SELECT * FROM pizza_sales;

--Total Revenue : Sum of the total price of all pizza orders
SELECT CAST(SUM(total_price) as Decimal(10,2)) as Total_Revenue
FROM pizza_sales;

--Average Order Value : Average amount spent per order
SELECT CAST(SUM(total_price)/COUNT(DISTINCT order_id) as decimal(10,2)) as Average_Order_Value
FROM pizza_sales;

--Total Pizzas Sold : 
SELECT SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales;

--Total Order :
SELECT COUNT(Distinct order_id) as Total_Orders
FROM pizza_sales;

--Average Quantity of Pizzas per order :
SELECT CAST(CAST(SUM(quantity) as decimal(10,2))/CAST(COUNT(DISTINCT order_Id) as decimal(10,2)) as decimal(10,2)) as Average_Pizzas_per_Order
FROM pizza_sales;


--Daily Trend for Total Orders :
SELECT DATENAME(DW, order_date) as Day_of_Week, COUNT(DISTINCT order_id) as Order_Count
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

--Monthly Trend for Total Orders :
SELECT DATENAME(mm, order_id) as Month, COUNT(DISTINCT order_id) as Order_Count
FROM pizza_sales
GROUP BY DATENAME(mm, order_id); 

--Percentage of Sales by Pizza Category :
SELECT pizza_category, CAST((SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales))*100 as DECIMAL(10,2)) as Percentage_Sales
FROM pizza_sales
GROUP BY pizza_category;

--Percentage of Sales by Pizza Size :
SELECT pizza_size, CAST((SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales))*100 as DECIMAL(10,2)) as Percentage_Sales
FROM pizza_sales
GROUP BY pizza_size;

--Total Pizzas sold by Pizza Category :
SELECT pizza_category, SUM(quantity) as Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category;

--Top 5 Best Sellers by Revenue :
SELECT TOP 5 pizza_name, CAST(SUM(total_price) as decimal(10,2)) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC;

--Top 5 Best Sellers by Quantity :
SELECT TOP 5 pizza_name, SUM(quantity) as Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;

--Top 5 Best Sellers by Orders :
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) DESC;

--Bottom 5 Best Sellers by Revenue :
SELECT TOP 5 pizza_name, CAST(SUM(total_price) as decimal(10,2)) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) ASC;

--Bottom 5 Best Sellers by Quantity :
SELECT TOP 5 pizza_name, SUM(quantity) as Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;

--Bottom 5 Best Sellers by Orders :
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY COUNT(DISTINCT order_id) ASC;