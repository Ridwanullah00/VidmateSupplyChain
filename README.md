# Vidmate Supply Chain Analysis

## Project Overview

This project uses a supply chain dataset which contains 101 row and 26 columns, some notable columns include: Shipping times, Shipping carriers, Shipping costs, Supplier name, Location, Inspection results, Defect rates. The aim of this project is to analyze the dataset to improve efficiency, reduce costs, optimize inventory, and enhance delivery performance.

## Data Cleaning Process

The dataset was thoroughly checked for missing values, blanks, duplicates and outliers outliers. We found none, we then proceeded to

## Tools Used

MS Excel, MySQL

## Analysis Derived

MOST PRODUCTIVE SUPPLIER
```
SELECT `SUPPLIER NAME` name, SUM(total_revenue_generated) revenue
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;
```

DEFECT RATES COMPARISON
```
SELECT SKU product_id ,`DEFECT RATES` AS defect_rates,
	CASE
		WHEN `DEFECT RATES` > 4 THEN 'GOOD'
		WHEN `DEFECT RATES` > 3 THEN 'AVEARAGE'
		WHEN `DEFECT RATES` > 2 THEN 'POOR'
		ELSE 'BAD'
    END AS rating
FROM supply_chain_data;
```
RATE OF INSPECTION RESULTS

```
SELECT (`INSPECTION RESULTS`) RESULTS, 
		COUNT(*) AS no_of_results
FROM supply_chain_data 
GROUP BY 1
ORDER BY 2;
```
STOCK LEVELS BY SUPPLIER(AVERAGE, MINIMUM AND MAXIMUM)

```
SELECT 
	DISTINCT(`Supplier name`) Suppliers,
    ROUND(AVG(`Stock levels`),2) average_stock_levels,
    MIN(`Stock levels`) min_stock_levels,
    MAX(`Stock levels`) max_stock_levels
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;
```
SALES BY REGION

```
SELECT 
    LOCATION location,
	SUM(`Number of products sold`) total_sales
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 desc;
```

TOTAL COST BY SUPPLIER
```
SELECT `Supplier name`supplier_name, ROUND(SUM(COSTS),2) total_cost
FROM supply_chain_data 
GROUP BY 1
ORDER BY 2 DESC;
```

AVERAGE DEFECT RATES BY SUPPLIER
```
SELECT `SUPPLIER NAME` supplier_name,ROUND(AVG(`DEFECT RATES`),2) defect_rates
FROM supply_chain_data
GROUP BY 1
ORDER BY 2 DESC;
```

## Recommendations

1.	Since Supplier 1 demonstrated higher productivity than the others, a greater volume of products should be sold to this supplier to maximize profit.

2.	Products should be consistently inspected to ensure they are intact and in good condition before leaving the warehouse.

3.	Customer gender information should be properly recorded, as a significant number of customer records currently lack this detail.
