/*
===============================================================================
Gold Layer Data Quality Checks
===============================================================================
Purpose:
    This script validates the integrity of the Gold layer used for analytics.

    It ensures:
    - Uniqueness of surrogate keys in dimension tables
    - Referential integrity between fact and dimension tables
    - Overall consistency of the star schema model
===============================================================================
*/


-- =============================================================================
-- Dimension: Customers
-- =============================================================================

-- check duplicate surrogate keys
SELECT customer_key, COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- =============================================================================
-- Dimension: Products
-- =============================================================================

-- check duplicate surrogate keys
SELECT product_key, COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- =============================================================================
-- Fact: Sales Integrity Check
-- =============================================================================

-- validate relationships between fact and dimensions
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE c.customer_key IS NULL
   OR p.product_key IS NULL;
