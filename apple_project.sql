-- ...................................................................
-- ...................... TABLE OF CONTENTS ..........................
-- ...................................................................

-- ...................... [1] EXPLORE TABLES .........................
-- [1.1] EXPLORE TABLE: category
--     [1.1.1] Inspect data type
--     [1.1.2] View first few rows
--     [1.1.3] Count total rows 
--     [1.1.4] Count number of missing
--     [1.1.5] Count number of duplicates
-- [1.2] EXPLORE TABLE: products
--     [1.2.1] Inspect data type
--     [1.2.2] View first few rows
--     [1.2.3] Count total rows 
--     [1.2.4] Count number of missing
--     [1.2.5] Count number of duplicates
-- [1.3] EXPLORE TABLE: sales
--     [1.3.1] Inspect data type
--     [1.3.2] View first few rows
--     [1.3.3] Count total rows 
--     [1.3.4] Count number of missing
--     [1.3.5] Count number of duplicates
-- [1.4] EXPLORE TABLE: warranty
--     [1.4.1] Inspect data type
--     [1.4.2] View first few rows
--     [1.4.3] Count total rows 
--     [1.4.4] Count number of missing
--     [1.4.5] Count number of duplicates
-- [1.5] EXPLORE TABLE: stores
--     [1.5.1] Inspect data type
--     [1.5.2] View first few rows
--     [1.5.3] Count total rows 
--     [1.5.4] Count number of missing

-- ......... [2] CREATE VIEWS WITH PROPER DATA TYPE ..................
-- [2.1] CREATE VIEW: products_modified
-- [2.2] CREATE VIEW: sales_modified
-- [2.3] CREATE VIEW: warranty_modified

-- .................... [3] GENERATE INSIGHTS ........................
-- [3.1] GENERATE INSIGHTS TABLE: Quantity Sold
--     [3.1.1] Rank of Categories
--     [3.1.2] Rank of Categories Per Year
--     [3.1.3] Rank of Products
-- [3.2] GENERATE INSIGHTS TABLE: Sales
--     [3.2.1] Rank Average Sales Per Category
--     [3.2.2] Rank Average Sales Per Category and Country
--     [3.2.3] Rank Average Sales Per Category and Country | Filter: Smartphones Only
--     [3.2.4] Rank Countries by Average Sales of Smartphones

----------------------------------------------------------------------

-- ...................................................................
-- ...................... [1] EXPLORE TABLES .........................
-- ...................................................................

-- ===================================================================
-- [1.1] EXPLORE TABLE: category
-- ===================================================================

----------------------------------------------------------------------
-- [1.1.1] Inspect data type
----------------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'category'

----------------------------------------------------------------------
-- [1.1.2] View first few rows
----------------------------------------------------------------------
SELECT *
FROM category

----------------------------------------------------------------------
-- [1.1.3] Count total rows 
----------------------------------------------------------------------
SELECT COUNT(*) as row_count
FROM category

----------------------------------------------------------------------
-- [1.1.4] Count number of missing
----------------------------------------------------------------------
SELECT
	COUNT(*) - COUNT(category_id) AS missing_category_id,
	COUNT(*) - COUNT(category_name) AS missing_category_name
FROM category

SELECT 
    SUM(CASE WHEN LTRIM(RTRIM(category_id)) = '' THEN 1 ELSE 0 END) AS empty_category_id,
    SUM(CASE WHEN LTRIM(RTRIM(category_name)) = '' THEN 1 ELSE 0 END) AS empty_category_name
FROM category

----------------------------------------------------------------------
-- [1.1.5] Count number of duplicates
----------------------------------------------------------------------
IF EXISTS (
	SELECT 1
	FROM category
	GROUP BY category_id, category_name
	HAVING COUNT(*) > 1
)
BEGIN
	SELECT category_id, category_name, COUNT(*) AS occurences
	FROM category
	GROUP BY category_id, category_name
	HAVING COUNT(*) > 1;
END
ELSE
BEGIN
	SELECT 'No Duplicates' AS message
END

-- ===================================================================
-- [1.2] EXPLORE TABLE: products
-- ===================================================================

----------------------------------------------------------------------
-- [1.2.1] Inspect data type
----------------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products'

----------------------------------------------------------------------
-- [1.2.2] View first few rows
----------------------------------------------------------------------
SELECT *
FROM products

----------------------------------------------------------------------
-- [1.2.3] Count total rows 
----------------------------------------------------------------------
SELECT COUNT(*) as row_count
FROM products

----------------------------------------------------------------------
-- [1.2.4] Count number of missing
----------------------------------------------------------------------
SELECT 
	COUNT(*) - COUNT(product_id) AS missing_product_id,
	COUNT(*) - COUNT(product_name) AS missing_product_name,
	COUNT(*) - COUNT(category_id) AS missing_category_id,
	COUNT(*) - COUNT(launch_date) AS missing_launch_date,
	COUNT(*) - COUNT(price) AS missing_price
FROM products

SELECT 
    SUM(CASE WHEN LTRIM(RTRIM(product_id)) = '' THEN 1 ELSE 0 END) AS empty_product_id,
    SUM(CASE WHEN LTRIM(RTRIM(product_name)) = '' THEN 1 ELSE 0 END) AS empty_product_name,
	SUM(CASE WHEN LTRIM(RTRIM(category_id)) = '' THEN 1 ELSE 0 END) as empty_category_id,
	SUM(CASE WHEN LTRIM(RTRIM(launch_date)) = '' THEN 1 ELSE 0 END) as empty_launch_date,
	SUM(CASE WHEN LTRIM(RTRIM(price)) = '' THEN 1 ELSE 0 END) as empty_price
FROM products

----------------------------------------------------------------------
-- [1.2.5] Count number of duplicates
----------------------------------------------------------------------
IF EXISTS(
	SELECT 1
	FROM products
	GROUP BY product_id, product_name, category_id, launch_date, price
	HAVING COUNT(*) > 1
)
BEGIN
	SELECT product_id, product_name, category_id, launch_date, price, COUNT(*) AS duplicates
	FROM products
	GROUP BY product_id, product_name, category_id, launch_date, price
	HAVING COUNT(*) > 1
END
ELSE
BEGIN
	SELECT 'No Duplicates' AS message
END

-- ===================================================================
-- [1.3] EXPLORE TABLE: sales
-- ===================================================================

----------------------------------------------------------------------
-- [1.3.1] Inspect data type
----------------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sales'

----------------------------------------------------------------------
-- [1.3.2] View first few rows
----------------------------------------------------------------------
SELECT TOP 10 *
FROM sales

----------------------------------------------------------------------
-- [1.3.3] Count total rows 
----------------------------------------------------------------------
SELECT COUNT(*) as row_count
FROM sales

SELECT *
FROM sales
WHERE YEAR(CONVERT(date, sale_date, 105)) = 1900;

SELECT COUNT(*) AS year_1900_count
FROM sales
WHERE YEAR(CONVERT(date, sale_date, 105)) = 1900;

SELECT DISTINCT YEAR(CONVERT(date, sale_date, 105)) AS sale_year
FROM sales
WHERE ISDATE(sale_date) = 1
ORDER BY sale_year;

----------------------------------------------------------------------
-- [1.3.4] Count number of missing
----------------------------------------------------------------------
SELECT 
	COUNT(*) - COUNT(sale_id) AS missing_sale_id,
	COUNT(*) - COUNT(sale_date) AS missing_sale_date,
	COUNT(*) - COUNT(store_id) AS missing_store_id,
	COUNT(*) - COUNT(product_id) AS missing_product_id,
	COUNT(*) - COUNT(quantity) AS missing_quantity
FROM sales

SELECT 
    SUM(CASE WHEN LTRIM(RTRIM(sale_id)) = '' THEN 1 ELSE 0 END) AS empty_sale_id,
    SUM(CASE WHEN LTRIM(RTRIM(sale_date)) = '' THEN 1 ELSE 0 END) AS empty_sale_date,
	SUM(CASE WHEN LTRIM(RTRIM(store_id)) = '' THEN 1 ELSE 0 END) as empty_store_id,
	SUM(CASE WHEN LTRIM(RTRIM(product_id)) = '' THEN 1 ELSE 0 END) as empty_product_id,
	SUM(CASE WHEN LTRIM(RTRIM(quantity)) = '' THEN 1 ELSE 0 END) as empty_quantity
FROM sales

----------------------------------------------------------------------
-- [1.3.5] Count number of duplicates
----------------------------------------------------------------------
IF EXISTS(
	SELECT 1
	FROM sales
	GROUP BY sale_id, sale_date, store_id, product_id, quantity
	HAVING COUNT(*) > 1
)
BEGIN
	SELECT sale_id, sale_date, store_id, product_id, quantity, COUNT(*) AS duplicates
	FROM sales
	GROUP BY sale_id, sale_date, store_id, product_id, quantity
	HAVING COUNT(*) > 1
END
ELSE
BEGIN
	SELECT 'No Duplicates' AS message
END

-- ===================================================================
-- [1.4] EXPLORE TABLE: warranty
-- ===================================================================

----------------------------------------------------------------------
-- [1.4.1] Inspect data type
----------------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'warranty'

----------------------------------------------------------------------
-- [1.4.2] View first few rows
----------------------------------------------------------------------
SELECT *
FROM warranty

----------------------------------------------------------------------
-- [1.4.3] Count total rows 
----------------------------------------------------------------------
SELECT COUNT(*) as row_count
FROM warranty

----------------------------------------------------------------------
-- [1.4.4] Count number of missing
----------------------------------------------------------------------
SELECT 
	COUNT(*) - COUNT(claim_id) AS missing_claim_id,
	COUNT(*) - COUNT(claim_date) AS missing_claim_date,
	COUNT(*) - COUNT(sale_id) AS missing_sale_id,
	COUNT(*) - COUNT(repair_status) AS missing_repair_status
FROM warranty

SELECT 
    SUM(CASE WHEN LTRIM(RTRIM(claim_id)) = '' THEN 1 ELSE 0 END) AS empty_claim_id,
    SUM(CASE WHEN LTRIM(RTRIM(claim_date)) = '' THEN 1 ELSE 0 END) AS empty_claim_date,
	SUM(CASE WHEN LTRIM(RTRIM(sale_id)) = '' THEN 1 ELSE 0 END) as empty_sale_id,
	SUM(CASE WHEN LTRIM(RTRIM(repair_status)) = '' THEN 1 ELSE 0 END) as empty_repair_status
FROM warranty

----------------------------------------------------------------------
-- [1.4.5] Count number of duplicates
----------------------------------------------------------------------
IF EXISTS(
	SELECT 1
	FROM warranty
	GROUP BY claim_id, claim_date, sale_id, repair_status
	HAVING COUNT(*) > 1
)
BEGIN
	SELECT claim_id, claim_date, sale_id, repair_status, COUNT(*) AS duplicates
	FROM warranty
	GROUP BY claim_id, claim_date, sale_id, repair_status
	HAVING COUNT(*) > 1
END
ELSE
BEGIN
	SELECT 'No Duplicates' AS message
END

-- ===================================================================
-- [1.5] EXPLORE TABLE: stores
-- ===================================================================

----------------------------------------------------------------------
-- [1.5.1] Inspect data type
----------------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'stores'

----------------------------------------------------------------------
-- [1.5.2] View first few rows
----------------------------------------------------------------------
SELECT *
FROM stores

----------------------------------------------------------------------
-- [1.5.3] Count total rows 
----------------------------------------------------------------------
SELECT COUNT(*) as row_count
FROM stores

----------------------------------------------------------------------
-- [1.5.4] Count number of missing
----------------------------------------------------------------------
SELECT 
	COUNT(*) - COUNT(Store_ID) AS missing_store_id,
	COUNT(*) - COUNT(Store_Name) AS missing_store_name,
	COUNT(*) - COUNT(City) AS missing_city,
	COUNT(*) - COUNT(Country) AS missing_country
FROM stores

SELECT 
    SUM(CASE WHEN LTRIM(RTRIM(Store_ID)) = '' THEN 1 ELSE 0 END) AS empty_store_id,
    SUM(CASE WHEN LTRIM(RTRIM(Store_Name)) = '' THEN 1 ELSE 0 END) AS empty_store_name,
	SUM(CASE WHEN LTRIM(RTRIM(City)) = '' THEN 1 ELSE 0 END) as empty_missing_city,
	SUM(CASE WHEN LTRIM(RTRIM(Country)) = '' THEN 1 ELSE 0 END) as empty_missing_country
FROM stores

-- ...................................................................
-- ......... [2] CREATE VIEWS WITH PROPER DATA TYPE ..................
-- ...................................................................

-- ===================================================================
-- [2.1] CREATE VIEW: products
-- ===================================================================
CREATE VIEW products_modified AS
SELECT
    product_id,
    product_name,
    category_id,
    CONVERT(DATE, launch_date, 120) AS launch_date,  -- 120 = yyyy-mm-dd
    CAST(price AS INT) AS price
FROM products;

-- Confirm data type change
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products_modified'

-- View first few rows
SELECT *
FROM products_modified;

-- ===================================================================
-- [2.2] CREATE VIEW: sales
-- ===================================================================

CREATE OR ALTER VIEW sales_modified AS
SELECT
    sale_id,
    CONVERT(DATE, sale_date, 105) AS sale_date,
    store_id,
    product_id,
    CAST(quantity AS INT) AS quantity
FROM sales
WHERE YEAR(CONVERT(DATE, sale_date, 105)) <> 1900;

-- Confirm data type change
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sales_modified'

-- View first few rows
SELECT *
FROM sales_modified;

-- ===================================================================
-- [2.3] CREATE VIEW: warranty
-- ===================================================================
CREATE OR ALTER VIEW warranty_modified AS
SELECT
    claim_id,
    CONVERT(DATE, claim_date, 120) AS claim_date, -- 120 = yyyy-mm-dd
    sale_id,
    repair_status
FROM warranty;

-- Confirm data type change
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'warranty_modified'

-- View first few rows
SELECT *
FROM warranty_modified;

-- ...................................................................
-- .................... [4] GENERATE INSIGHTS ........................
-- ...................................................................

SELECT TOP 3 *
FROM category;

SELECT TOP 3 *
FROM products_modified;

SELECT TOP 3 *
FROM sales_modified;

SELECT TOP 3 *
FROM warranty_modified;

-- ===================================================================
-- [3.1] GENERATE INSIGHTS TABLE: Quantity Sold
-- ===================================================================

----------------------------------------------------------------------
-- [3.1.1] Rank of Categories
----------------------------------------------------------------------
SELECT 
    c.category_name,
    SUM(s.quantity) AS total_quantity_sold,
    RANK() OVER (ORDER BY SUM(s.quantity) DESC) AS category_rank
FROM sales_modified s
JOIN products_modified p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY category_rank;

----------------------------------------------------------------------
-- [3.1.2] Rank of Categories Per Year
----------------------------------------------------------------------
WITH CategorySalesByYear AS (
    SELECT 
        YEAR(s.sale_date) AS sale_year,
        c.category_name,
        SUM(s.quantity) AS total_quantity_sold
    FROM sales_modified s
    JOIN products_modified p ON s.product_id = p.product_id
    JOIN category c ON p.category_id = c.category_id
    GROUP BY 
        YEAR(s.sale_date),
        c.category_name
)
SELECT 
    sale_year,
    category_name,
    total_quantity_sold,
    RANK() OVER (
        PARTITION BY sale_year 
        ORDER BY total_quantity_sold DESC
    ) AS category_rank
FROM CategorySalesByYear
ORDER BY 
    sale_year,
    category_rank;

----------------------------------------------------------------------
-- [3.1.3] Rank of Products
----------------------------------------------------------------------
SELECT 
    p.product_name,
    c.category_name,
    SUM(s.quantity) AS total_quantity_sold,
    RANK() OVER (ORDER BY SUM(s.quantity) DESC) AS product_rank
FROM sales_modified s
JOIN products_modified p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
GROUP BY p.product_name, c.category_name
ORDER BY product_rank;

-- ===================================================================
-- [3.2] GENERATE INSIGHTS TABLE: Sales
-- ===================================================================

----------------------------------------------------------------------
-- [3.2.1] Rank Average Sales Per Category
----------------------------------------------------------------------
SELECT 
    c.category_name,
    SUM(p.price * s.quantity) AS total_sales,
    COUNT(s.sale_id) AS total_transactions,

	-- Average sale per transaction (revenue ÷ number of transactions)
    CAST(SUM(p.price * s.quantity) AS FLOAT) / COUNT(s.sale_id) AS average_sale_per_transaction,

    -- Ranking categories based on their average sale per transaction (highest first)
    RANK() OVER (
        ORDER BY CAST(SUM(p.price * s.quantity) AS FLOAT) / COUNT(s.sale_id) DESC
    ) AS rank_by_average_sale
FROM sales_modified s
JOIN products_modified p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY rank_by_average_sale;

----------------------------------------------------------------------
-- [3.2.1] Rank Average Sales Per Category and Country
----------------------------------------------------------------------
-- Step 1: CTE to calculate total sales and transaction counts by category and country
WITH CategoryCountrySales AS (
    SELECT 
        c.category_name,
        st.Country,
        SUM(p.price * s.quantity) AS total_sales,
        COUNT(s.sale_id) AS total_transactions,
        CAST(SUM(p.price * s.quantity) AS FLOAT) / COUNT(s.sale_id) AS average_sale_per_transaction
    FROM sales_modified s
    JOIN products_modified p ON s.product_id = p.product_id
    JOIN category c ON p.category_id = c.category_id
    JOIN stores st ON s.store_id = st.Store_ID
    GROUP BY 
        c.category_name,
        st.Country
)

-- Step 2: Final query to apply ranking within each country
SELECT 
    Country,
    category_name,
    total_sales,
    total_transactions,
    average_sale_per_transaction,
    RANK() OVER (
        PARTITION BY Country 
        ORDER BY average_sale_per_transaction DESC
    ) AS rank_by_avg_sale
FROM CategoryCountrySales
ORDER BY 
    Country,
    rank_by_avg_sale;

----------------------------------------------------------------------
-- [3.2.1] Rank Average Sales Per Category and Country | Filter only for smartphones
----------------------------------------------------------------------
-- CTE: Total and average sales for smartphones by country
WITH SmartphoneSalesByCountry AS (
    SELECT 
        st.Country,
        SUM(p.price * s.quantity) AS total_sales,
        COUNT(s.sale_id) AS total_transactions,
        CAST(SUM(p.price * s.quantity) AS FLOAT) / COUNT(s.sale_id) AS average_sale_per_transaction
    FROM sales_modified s
    JOIN products_modified p ON s.product_id = p.product_id
    JOIN category c ON p.category_id = c.category_id
    JOIN stores st ON s.store_id = st.Store_ID
    WHERE c.category_name = 'Smartphone'
    GROUP BY st.Country
)
-- Final output: rank countries by average sale
SELECT 
    Country,
    total_sales,
    total_transactions,
    average_sale_per_transaction,
    RANK() OVER (
        ORDER BY average_sale_per_transaction DESC
    ) AS rank_by_avg_sale
FROM SmartphoneSalesByCountry
ORDER BY rank_by_avg_sale;

-- ...................................................................
-- ............................ END ..................................
-- ...................................................................
