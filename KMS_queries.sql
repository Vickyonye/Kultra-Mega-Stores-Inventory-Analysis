

CREATE TABLE
KMS_casestudy

----1 HIGHEST SALES BY CATEGORY

SELECT [product_category], SUM(sales) AS totalsales
FROM [dbo].[KMS Sql Case Study]
GROUP BY product_category
ORDER BY [totalsales] DESC;

2 TOP 3 & BUTTOM 3 REGIONS IN TERMS OF SALES

TOP 3
SELECT TOP 3 region, SUM(sales) AS totalsales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY totalsales DESC;

----BOTTOM 3
SELECT TOP 3 region, SUM(sales) AS Totalsales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY Totalsales ASC;


----3 TOTAL SALES OF APPLIANCES IN ONTARIO

SELECT SUM(sales) AS Appliancesales_ontario
FROM [dbo].[KMS Sql Case Study]
WHERE Province = 'ontario' AND [Product_Category] = 'APPLIANCES';


SELECT [Product_Category], SUM(sales) AS [totalsales]
FROM [dbo].[KMS Sql Case Study]
WHERE Province = 'ontario' AND [Product_Category] = 'APPLIANCES'
GROUP BY [Product_Category];


SELECT [Product_Category], SUM(sales) AS [totalsales]
FROM [dbo].[KMS Sql Case Study]
where Region = 'ontario'
GROUP BY [Product_Category];


----4 increase revenue from bottom 10 customers by total sales---
SELECT TOP 10 customer_name,shipping_cost,sales,discount,unit_price, SUM(Order_Quantity) AS [totalsales]
FROM [dbo].[KMS Sql Case Study]
group by Customer_Name, Shipping_Cost, Sales, Discount, Unit_Price
order by [totalsales] asc

SELECT TOP 10 [customer_name], SUM(sales) AS totalsales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY totalsales ASC;

SELECT TOP 10 [customer_name], 
	SUM(sales) AS totalsales,
	SUM([Order_Quantity]) AS totalquantity,
	SUM([Shipping_cost]) AS totalshippingcost
	FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY totalsales ASC;


----5 most costly shipping method

SELECT [Ship_Mode], SUM([Shipping_Cost]) AS TotalShippingCost
	FROM [dbo].[KMS Sql Case Study]
GROUP BY [Ship_Mode]
ORDER BY TotalShippingCost DESC;

----6 most valuable customers and what they buy

-- Top 5 customers by sales and what they buy
SELECT [Customer_Name], [Product_Category], SUM(Sales) AS TotalSales
	FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name], [Product_Category]
ORDER BY TotalSales DESC;

-- Top 5 customers by sales and what they buy
SELECT [customer_name],[Product_Sub_Category],[Customer_Segment] , SUM(Sales) AS TotalSales
	FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name], [Product_Sub_Category],[Customer_Segment]
ORDER BY TotalSales DESC;

---- 7 Top small business customer by sales----

SELECT TOP 1 [Customer_Name], SUM(Sales) AS TotalSales
	FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Small Business'
GROUP BY [Customer_Name]
ORDER BY TotalSales DESC;

SELECT TOP 1 *
	FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Small Business'
ORDER BY Sales DESC;

------8 corporate customer with most orders (2009-2012)
SELECT TOP 1 [Customer_Name], COUNT([Order_ID]) AS TotalOrders
	FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Corporate'
GROUP BY [Customer_Name]
ORDER BY TotalOrders DESC;



SELECT TOP 1 
    [Customer_Name], 
    COUNT([Order_ID]) AS TotalOrders,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Corporate'
GROUP BY [Customer_Name]
ORDER BY TotalOrders DESC;



---9. Most profitable consumer customer----

SELECT TOP 1 [Customer_Name], SUM(Profit) AS TotalProfit
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Consumer'
GROUP BY [Customer_Name]
ORDER BY TotalProfit DESC;

SELECT TOP 1 *
	FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'CONSUMER'
ORDER BY Profit DESC;

---10 Which customers returned items, and what segment?


SELECT DISTINCT k.[Customer_Name], k.[Customer_Segment]
	FROM [dbo].[KMS Sql Case Study] k
JOIN [dbo].[Order_Status] r ON k.[Order_ID] = r.[Order_ID]
WHERE r.Status = 'Returned';



---11 Did shipping cost match order priority?

SELECT [Order_Priority], [Ship_Mode], COUNT(*) AS OrderCount, SUM([Shipping_Cost]) AS TotalShippingCost
	FROM [dbo].[KMS Sql Case Study]
GROUP BY [Order_Priority], [Ship_Mode]
ORDER BY [Order_Priority], [Ship_Mode];

