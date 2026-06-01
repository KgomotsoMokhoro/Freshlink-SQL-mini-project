/*USE CASE NO.1*/
SELECT
supplier_name,
COUNT(SKU_ID) as total_sku_count,
ROUND(AVG(Supplier_ontime_pct),2) as avg_delivery_time
FROM grocery
GROUP BY supplier_name
ORDER BY 3 ;

/*USE CASE NO.2*/
SELECT
ABC_Class,
SUM(Total_Inventory_Value_USD) as total_inventory,
COUNT(SKU_ID) as SKU
FROM grocery
GROUP BY ABC_Class
ORDER BY 2 DESC;

/*USE CASE NO.3*/
SELECT
Inventory_Status,
Category,
COUNT(*) as Expiring_SKUs
FROM  grocery
WHERE Inventory_Status='Expiring Soon'
GROUP BY Category
ORDER BY 3 desc;

/*USE CASE NO.4*/
SELECT
Warehouse_Location,
SUM(Quantity_On_Hand) as TOH, 
ROUND(AVG(Stock_Age_Days),2) as avg_stock_age
FROM grocery
GROUP BY Warehouse_Location
ORDER BY 3 desc;

/*USE CASE NO.5*/
SELECT
Supplier_Name,
AVG(Lead_Time_Days) as lead_time
FROM grocery
GROUP BY Supplier_Name
HAVING AVG(Lead_Time_Days)
ORDER BY 2 DESC;

/*USE CASE NO.6*/
SELECT
Category,
ROUND(SUM(Quantity_On_Hand*Unit_Cost_USD),2) as total_calculated_value
FROM grocery
GROUP BY Category
ORDER BY 2 desc;
