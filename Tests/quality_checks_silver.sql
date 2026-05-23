/*
===============================================================================
Data Quality Checks (Silver Layer)
===============================================================================
Purpose:
    This script validates data quality after Silver layer load.

    It checks for:
    - Duplicate or missing primary keys
    - Whitespace issues in string fields
    - Invalid or inconsistent values
    - Date anomalies
    - Business rule violations (e.g., sales = qty * price)

Note:
    These are diagnostic queries only and do not modify data.
===============================================================================
*/


-- =============================================================================
-- CRM Customer Table Checks
-- =============================================================================

-- duplicate or missing customer ids
SELECT cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- check for leading/trailing spaces
SELECT cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- check distinct values for consistency
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info;


-- =============================================================================
-- CRM Product Table Checks
-- =============================================================================

-- duplicate or missing product ids
SELECT prd_id, COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- whitespace check
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- invalid cost values
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- inconsistent product lines
SELECT DISTINCT prd_line
FROM silver.crm_prd_info;

-- invalid date logic
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;


-- =============================================================================
-- CRM Sales Table Checks
-- =============================================================================

-- invalid or inconsistent date values
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;

-- sales consistency check (business rule)
SELECT DISTINCT sls_sales, sls_quantity, sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL
   OR sls_quantity IS NULL
   OR sls_price IS NULL
   OR sls_sales <= 0
   OR sls_quantity <= 0
   OR sls_price <= 0;


-- =============================================================================
-- ERP Customer Demographics
-- =============================================================================

-- invalid birthdates
SELECT DISTINCT bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01'
   OR bdate > GETDATE();

-- gender consistency
SELECT DISTINCT gen
FROM silver.erp_cust_az12;


-- =============================================================================
-- ERP Location Data
-- =============================================================================

-- country standardization check
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry;


-- =============================================================================
-- ERP Product Categories
-- =============================================================================

-- whitespace check
SELECT *
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat)
   OR subcat != TRIM(subcat)
   OR maintenance != TRIM(maintenance);

-- consistency check
SELECT DISTINCT maintenance
FROM silver.erp_px_cat_g1v2;
