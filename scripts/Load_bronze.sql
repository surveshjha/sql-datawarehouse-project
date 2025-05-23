-- Create a stored procedure to load all bronze layer data from CSV files.
-- This procedure will truncate existing data and then copy new data from the specified paths.
CREATE OR REPLACE PROCEDURE load_bronze_data()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Starting data load for bronze layer...';

    -- Load crm_prd_info
    TRUNCATE TABLE bronze.crm_prd_info;
    COPY bronze.crm_prd_info (prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt)
    FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_crm/prd_info.csv'
    DELIMITER ','
    CSV
    HEADER;
    RAISE NOTICE 'Loaded bronze.crm_prd_info';

    -- Load crm_cust_info
    TRUNCATE TABLE bronze.crm_cust_info;
    COPY bronze.crm_cust_info (cst_id,cst_key,cst_firstname,cst_lastname,cst_marital_status,cst_gndr,cst_create_date)
    FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_crm/cust_info.csv'
    DELIMITER ','
    CSV
    HEADER;
    RAISE NOTICE 'Loaded bronze.crm_cust_info';

    -- Load crm_sales_details
    TRUNCATE TABLE bronze.crm_sales_details;
    COPY bronze.crm_sales_details (sls_ord_num,sls_prd_key,sls_cust_id,sls_order_d,sls_ship_dt,sls_due_dt,sls_sales,sls_quantit,sls_price)
    FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_crm/sales_details.csv'
    DELIMITER ','
    CSV
    HEADER;
    RAISE NOTICE 'Loaded bronze.crm_sales_details';

    -- Load erp_cat_g1v2
    TRUNCATE TABLE bronze.erp_cat_g1v2;
    COPY bronze.erp_cat_g1v2 (ID,CAT,SUBCAT,MAINTENANCE)
    FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
    DELIMITER ','
    CSV
    HEADER;
    RAISE NOTICE 'Loaded bronze.erp_cat_g1v2';

    -- Load erp_cust_az12
    TRUNCATE TABLE bronze.erp_cust_az12;
    COPY bronze.erp_cust_az12 (CID,BDATE,GEN)
    FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_erp/CUST_AZ12.csv'
    DELIMITER ','
    CSV
    HEADER;
    RAISE NOTICE 'Loaded bronze.erp_cust_az12';

    -- Load erp_loc_a101
    TRUNCATE TABLE bronze.erp_loc_a101;
    COPY bronze.erp_loc_a101(CID,CNTRY)
    FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_erp/LOC_A101.csv'
    DELIMITER ','
    CSV
    HEADER;
    RAISE NOTICE 'Loaded bronze.erp_loc_a101';

    RAISE NOTICE 'Data load for bronze layer completed.';
END;
$$;

-- Example of how to call the stored procedures:
-- CALL create_or_replace_crm_cust_info_table(); -- To manage just the crm_cust_info table
CALL load_bronze_data(); -- To load all bronze layer tables

-- To list all databases and verify creation:
-- \l

-- To list schemas in the current database:
-- \dn

-- To list tables in a specific schema (e.g., 'bronze'):
-- \dt bronze.*

-- To list stored procedures in the current database:
-- \dp
