SELECT * FROM supply_chain.supply_chain_data;

-- PRODUCTS WITH THE HIGHEST AND LOWEST SALES 
SELECT DISTINCT(`PRODUCT TYPE`), SUM(`Number of products sold`) no_of_quantities
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;

-- CREATING A COLUMN FOR TOTAL SALES 
ALTER TABLE supply_chain_data 
ADD COLUMN `Total Sales` DECIMAL(10,2);
 
UPDATE supply_chain_data SET `Total Sales` = `Price` * `Number of products sold`;

-- GENDER THAT BOUGHT THE MOST
SELECT DISTINCT (`CUSTOMER DEMOGRAPHICS`) gender, SUM(`TOTAL SALES`) total_sales
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;

-- MOST PRODUCTIVE SUPPLIER
SELECT `SUPPLIER NAME` name, SUM(`REVENUE GENERATED`) revenue
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;

-- DEFECT RATES COMPARISON
SELECT SKU product_id ,`DEFECT RATES` AS defect_rates,
	CASE
		WHEN `DEFECT RATES` > 4 THEN 'GOOD'
		WHEN `DEFECT RATES` > 3 THEN 'AVEARAGE'
		WHEN `DEFECT RATES` > 2 THEN 'POOR'
		ELSE 'BAD'
    END AS rating
FROM supply_chain_data;

-- RATE OF INSPECTION RESULTS
SELECT (`INSPECTION RESULTS`) RESULTS, 
		COUNT(*) AS no_of_results
FROM supply_chain_data 
GROUP BY 1
ORDER BY 2;

-- STOCK LEVELS(AVERAGE, MINIMUM AND MAXIMUM)
SELECT 
	DISTINCT(`Product type`) stock_levels,
	ROUND(AVG(`Stock levels`),2) average_stock_levels,
    MIN(`Stock levels`) min_stock_levels,
    MAX(`Stock levels`) max_stock_levels
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;

-- DELIVERY TIME BY REGION AND SUPPLIER
SELECT 
	(`Supplier name`)supplier_name,
    LOCATION location,
	SUM(`Number of products sold`) total_sales
FROM supply_chain_data
GROUP BY 1,2
ORDER BY 1;

-- COST BY SUPPLIER
SELECT `Supplier name`supplier_name, ROUND(SUM(COSTS),2) total_cost
FROM supply_chain_data 
GROUP BY 1
ORDER BY 2 DESC;

-- AVERAGE DEFECT RATES BY SUPPLIER
SELECT `SUPPLIER NAME` supplier_name,ROUND(AVG(`DEFECT RATES`),2) defect_rates
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;