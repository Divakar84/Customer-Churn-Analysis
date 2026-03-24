-- ============================================================================
-- RETAIL BUSINESS PERFORMANCE & PROFITABILITY ANALYSIS
-- SQL QUERIES FOR POWER BI AND DATA ANALYSIS
-- ============================================================================
-- Dataset: Global Superstore Sales Data (2011-2014)
-- Total Records: 9,994 transactions
-- Created: March 24, 2026
-- ============================================================================

-- ============================================================================
-- SECTION 1: PROFIT MARGIN ANALYSIS
-- ============================================================================

-- 1.1: Overall Profitability Metrics
SELECT 
    COUNT(*) AS Total_Transactions,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Overall_Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order,
    ROUND(MIN(Order_Date), 0) AS First_Order_Date,
    ROUND(MAX(Order_Date), 0) AS Last_Order_Date
FROM retail_data;

-- 1.2: Profit Margin by Category
SELECT 
    Category,
    COUNT(*) AS Transaction_Count,
    COUNT(DISTINCT Product_ID) AS Unique_Products,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percent
FROM retail_data
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

-- 1.3: Profit Margin by Sub-Category (Detailed Analysis)
SELECT 
    Category,
    Sub_Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percent,
    ROUND(SUM(Quantity), 0) AS Total_Units_Sold
FROM retail_data
GROUP BY Category, Sub_Category
ORDER BY Profit_Margin_Percent ASC;

-- 1.4: Loss-Making Products (Negative Profit Margin)
SELECT 
    Category,
    Sub_Category,
    Product_Name,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Loss,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percent
FROM retail_data
WHERE SUM(Profit) < 0
GROUP BY Category, Sub_Category, Product_Name
ORDER BY Total_Loss ASC;

-- 1.5: High-Margin Products (Top 20)
SELECT TOP 
    Category,
    Sub_Category,
    Product_Name,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Category, Sub_Category, Product_Name
ORDER BY Profit_Margin_Percent DESC;

-- ============================================================================
-- SECTION 2: SEASONAL PERFORMANCE ANALYSIS
-- ============================================================================

-- 2.1: Seasonal Sales and Profit Trends
SELECT 
    CASE 
        WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM retail_data
GROUP BY CASE 
    WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter'
    WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring'
    WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer'
    WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall'
END
ORDER BY CASE 
    WHEN CASE WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter' WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring' WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer' WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall' END = 'Winter' THEN 1
    WHEN CASE WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter' WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring' WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer' WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall' END = 'Spring' THEN 2
    WHEN CASE WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter' WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring' WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer' WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall' END = 'Summer' THEN 3
    WHEN CASE WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter' WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring' WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer' WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall' END = 'Fall' THEN 4
END;

-- 2.2: Category Performance by Season
SELECT 
    Category,
    CASE 
        WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Category, CASE 
    WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter'
    WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring'
    WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer'
    WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall'
END
ORDER BY Category, CASE 
    WHEN MONTH(Order_Date) IN (12, 1, 2) THEN 'Winter' THEN 1
    WHEN MONTH(Order_Date) IN (3, 4, 5) THEN 'Spring' THEN 2
    WHEN MONTH(Order_Date) IN (6, 7, 8) THEN 'Summer' THEN 3
    WHEN MONTH(Order_Date) IN (9, 10, 11) THEN 'Fall' THEN 4
END;

-- 2.3: Monthly Sales Trend
SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM retail_data
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

-- ============================================================================
-- SECTION 3: REGIONAL PERFORMANCE ANALYSIS
-- ============================================================================

-- 3.1: Sales and Profit by Region
SELECT 
    Region,
    COUNT(*) AS Transaction_Count,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value,
    ROUND(SUM(Profit) / COUNT(*), 2) AS Avg_Profit_Per_Transaction
FROM retail_data
GROUP BY Region
ORDER BY Total_Profit DESC;

-- 3.2: Category Performance by Region
SELECT 
    Region,
    Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Region, Category
ORDER BY Region, Profit_Margin_Percent DESC;

-- 3.3: Regional Profitability Ranking
SELECT 
    Region,
    RANK() OVER (ORDER BY SUM(Profit) DESC) AS Profit_Rank,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(SUM(Sales) / (SELECT SUM(Sales) FROM retail_data) * 100, 2) AS Percent_Of_Total_Sales
FROM retail_data
GROUP BY Region
ORDER BY Profit_Rank;

-- ============================================================================
-- SECTION 4: CUSTOMER SEGMENT ANALYSIS
-- ============================================================================

-- 4.1: Segment Performance
SELECT 
    Segment,
    COUNT(*) AS Transaction_Count,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value,
    ROUND(SUM(Profit) / COUNT(*), 2) AS Avg_Profit_Per_Transaction
FROM retail_data
GROUP BY Segment
ORDER BY Profit_Margin_Percent DESC;

-- 4.2: Segment and Category Cross-Analysis
SELECT 
    Segment,
    Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Segment, Category
ORDER BY Segment, Profit_Margin_Percent DESC;

-- 4.3: Customer Lifetime Value Analysis
SELECT TOP 20
    Customer_ID,
    Customer_Name,
    Segment,
    Region,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Spent,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Customer_ID, Customer_Name, Segment, Region
ORDER BY Total_Profit DESC;

-- ============================================================================
-- SECTION 5: DISCOUNT IMPACT ANALYSIS
-- ============================================================================

-- 5.1: Discount Effectiveness
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.1 THEN '1-10%'
        WHEN Discount <= 0.2 THEN '11-20%'
        ELSE 'Over 20%'
    END AS Discount_Range,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percent
FROM retail_data
GROUP BY CASE 
    WHEN Discount = 0 THEN 'No Discount'
    WHEN Discount <= 0.1 THEN '1-10%'
    WHEN Discount <= 0.2 THEN '11-20%'
    ELSE 'Over 20%'
END
ORDER BY CASE 
    WHEN CASE WHEN Discount = 0 THEN 'No Discount' WHEN Discount <= 0.1 THEN '1-10%' WHEN Discount <= 0.2 THEN '11-20%' ELSE 'Over 20%' END = 'No Discount' THEN 1
    WHEN CASE WHEN Discount = 0 THEN 'No Discount' WHEN Discount <= 0.1 THEN '1-10%' WHEN Discount <= 0.2 THEN '11-20%' ELSE 'Over 20%' END = '1-10%' THEN 2
    WHEN CASE WHEN Discount = 0 THEN 'No Discount' WHEN Discount <= 0.1 THEN '1-10%' WHEN Discount <= 0.2 THEN '11-20%' ELSE 'Over 20%' END = '11-20%' THEN 3
    ELSE 4
END;

-- 5.2: Discount Impact by Category
SELECT 
    Category,
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.1 THEN '1-10%'
        WHEN Discount <= 0.2 THEN '11-20%'
        ELSE 'Over 20%'
    END AS Discount_Range,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Category, CASE 
    WHEN Discount = 0 THEN 'No Discount'
    WHEN Discount <= 0.1 THEN '1-10%'
    WHEN Discount <= 0.2 THEN '11-20%'
    ELSE 'Over 20%'
END
ORDER BY Category, CASE 
    WHEN CASE WHEN Discount = 0 THEN 'No Discount' WHEN Discount <= 0.1 THEN '1-10%' WHEN Discount <= 0.2 THEN '11-20%' ELSE 'Over 20%' END = 'No Discount' THEN 1
    WHEN CASE WHEN Discount = 0 THEN 'No Discount' WHEN Discount <= 0.1 THEN '1-10%' WHEN Discount <= 0.2 THEN '11-20%' ELSE 'Over 20%' END = '1-10%' THEN 2
    WHEN CASE WHEN Discount = 0 THEN 'No Discount' WHEN Discount <= 0.1 THEN '1-10%' WHEN Discount <= 0.2 THEN '11-20%' ELSE 'Over 20%' END = '11-20%' THEN 3
    ELSE 4
END;

-- ============================================================================
-- SECTION 6: PRODUCT PERFORMANCE ANALYSIS
-- ============================================================================

-- 6.1: Top 20 Products by Profit
SELECT TOP 20
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM retail_data
GROUP BY Product_ID, Product_Name, Category, Sub_Category
ORDER BY Total_Profit DESC;

-- 6.2: Bottom 20 Products by Profit (Loss-Makers)
SELECT TOP 20
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Loss,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Product_ID, Product_Name, Category, Sub_Category
ORDER BY Total_Loss ASC;

-- 6.3: Product Performance Ranking
SELECT 
    Product_Name,
    Category,
    Sub_Category,
    RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS Profit_Rank_In_Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM retail_data
GROUP BY Product_Name, Category, Sub_Category
ORDER BY Category, Profit_Rank_In_Category;

-- ============================================================================
-- SECTION 7: INVENTORY AND OPERATIONAL ANALYSIS
-- ============================================================================

-- 7.1: Inventory Days Analysis
SELECT 
    Inventory_Days,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM retail_data
GROUP BY Inventory_Days
ORDER BY Inventory_Days;

-- 7.2: Order Priority Impact
SELECT 
    Order_Priority,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Shipping_Cost), 2) AS Avg_Shipping_Cost
FROM retail_data
GROUP BY Order_Priority
ORDER BY CASE 
    WHEN Order_Priority = 'Critical' THEN 1
    WHEN Order_Priority = 'High' THEN 2
    WHEN Order_Priority = 'Medium' THEN 3
    WHEN Order_Priority = 'Low' THEN 4
END;

-- 7.3: Shipping Mode Analysis
SELECT 
    Ship_Mode,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Shipping_Cost), 2) AS Avg_Shipping_Cost,
    ROUND(AVG(DATEDIFF(DAY, Order_Date, Ship_Date)), 0) AS Avg_Days_To_Ship
FROM retail_data
GROUP BY Ship_Mode
ORDER BY Profit_Margin_Percent DESC;

-- ============================================================================
-- SECTION 8: SUMMARY STATISTICS AND KPIs
-- ============================================================================

-- 8.1: Year-over-Year Comparison
SELECT 
    YEAR(Order_Date) AS Year,
    COUNT(*) AS Transaction_Count,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM retail_data
GROUP BY YEAR(Order_Date)
ORDER BY Year;

-- 8.2: Profitability Distribution
SELECT 
    CASE 
        WHEN Profit < 0 THEN 'Loss'
        WHEN Profit = 0 THEN 'Break Even'
        WHEN Profit <= 100 THEN 'Low Profit (0-100)'
        WHEN Profit <= 500 THEN 'Medium Profit (100-500)'
        WHEN Profit <= 1000 THEN 'High Profit (500-1000)'
        ELSE 'Very High Profit (>1000)'
    END AS Profit_Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM retail_data
GROUP BY CASE 
    WHEN Profit < 0 THEN 'Loss'
    WHEN Profit = 0 THEN 'Break Even'
    WHEN Profit <= 100 THEN 'Low Profit (0-100)'
    WHEN Profit <= 500 THEN 'Medium Profit (100-500)'
    WHEN Profit <= 1000 THEN 'High Profit (500-1000)'
    ELSE 'Very High Profit (>1000)'
END
ORDER BY CASE 
    WHEN CASE WHEN Profit < 0 THEN 'Loss' WHEN Profit = 0 THEN 'Break Even' WHEN Profit <= 100 THEN 'Low Profit (0-100)' WHEN Profit <= 500 THEN 'Medium Profit (100-500)' WHEN Profit <= 1000 THEN 'High Profit (500-1000)' ELSE 'Very High Profit (>1000)' END = 'Loss' THEN 1
    WHEN CASE WHEN Profit < 0 THEN 'Loss' WHEN Profit = 0 THEN 'Break Even' WHEN Profit <= 100 THEN 'Low Profit (0-100)' WHEN Profit <= 500 THEN 'Medium Profit (100-500)' WHEN Profit <= 1000 THEN 'High Profit (500-1000)' ELSE 'Very High Profit (>1000)' END = 'Break Even' THEN 2
    WHEN CASE WHEN Profit < 0 THEN 'Loss' WHEN Profit = 0 THEN 'Break Even' WHEN Profit <= 100 THEN 'Low Profit (0-100)' WHEN Profit <= 500 THEN 'Medium Profit (100-500)' WHEN Profit <= 1000 THEN 'High Profit (500-1000)' ELSE 'Very High Profit (>1000)' END = 'Low Profit (0-100)' THEN 3
    WHEN CASE WHEN Profit < 0 THEN 'Loss' WHEN Profit = 0 THEN 'Break Even' WHEN Profit <= 100 THEN 'Low Profit (0-100)' WHEN Profit <= 500 THEN 'Medium Profit (100-500)' WHEN Profit <= 1000 THEN 'High Profit (500-1000)' ELSE 'Very High Profit (>1000)' END = 'Medium Profit (100-500)' THEN 4
    WHEN CASE WHEN Profit < 0 THEN 'Loss' WHEN Profit = 0 THEN 'Break Even' WHEN Profit <= 100 THEN 'Low Profit (0-100)' WHEN Profit <= 500 THEN 'Medium Profit (100-500)' WHEN Profit <= 1000 THEN 'High Profit (500-1000)' ELSE 'Very High Profit (>1000)' END = 'High Profit (500-1000)' THEN 5
    ELSE 6
END;

-- 8.3: Market Performance
SELECT 
    Market,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    ROUND(SUM(Sales) / (SELECT SUM(Sales) FROM retail_data) * 100, 2) AS Percent_Of_Total_Sales
FROM retail_data
GROUP BY Market
ORDER BY Total_Profit DESC;

-- ============================================================================
-- END OF SQL QUERIES
-- ============================================================================