TRUNCATE TABLE bronze.crm_prd_info;
COPY bronze.crm_prd_info (prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt)
FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_crm/prd_info.csv' -- e.g., 'C:/data/crm_products.csv' on Windows or '/home/user/data/crm_products.csv' on Linux
DELIMITER ','                  -- Specifies that columns are separated by commas
CSV                            -- Indicates that the source file is in CSV format
HEADER;
SELECT * FROM bronze.crm_prd_info; 

TRUNCATE TABLE bronze.crm_cust_info;
COPY bronze.crm_cust_info (cst_id,cst_key,cst_firstname,cst_lastname,cst_marital_status,cst_gndr,cst_create_date)
FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_crm/cust_info.csv' -- e.g., 'C:/data/crm_products.csv' on Windows or '/home/user/data/crm_products.csv' on Linux
DELIMITER ','                  -- Specifies that columns are separated by commas
CSV                            -- Indicates that the source file is in CSV format
HEADER;
SELECT * FROM bronze.crm_cust_info;

TRUNCATE TABLE bronze.crm_sales_details;
COPY bronze.crm_sales_details (sls_ord_num,sls_prd_key,sls_cust_id,sls_order_d,sls_ship_dt,sls_due_dt,sls_sales,sls_quantit,sls_price)
FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_crm/sales_details.csv' -- e.g., 'C:/data/crm_products.csv' on Windows or '/home/user/data/crm_products.csv' on Linux
DELIMITER ','                  -- Specifies that columns are separated by commas
CSV                            -- Indicates that the source file is in CSV format
HEADER;
SELECT * FROM bronze.crm_sales_details;

TRUNCATE TABLE bronze.erp_cat_g1v2;
COPY bronze.erp_cat_g1v2 (ID,CAT,SUBCAT,MAINTENANCE)
FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_erp/PX_CAT_G1V2.csv' -- e.g., 'C:/data/crm_products.csv' on Windows or '/home/user/data/crm_products.csv' on Linux
DELIMITER ','                  -- Specifies that columns are separated by commas
CSV                            -- Indicates that the source file is in CSV format
HEADER;
SELECT * FROM bronze.erp_cat_g1v2;

TRUNCATE TABLE bronze.erp_cust_az12;
COPY bronze.erp_cust_az12 (CID,BDATE,GEN)
FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_erp/CUST_AZ12.csv' -- e.g., 'C:/data/crm_products.csv' on Windows or '/home/user/data/crm_products.csv' on Linux
DELIMITER ','                  -- Specifies that columns are separated by commas
CSV                            -- Indicates that the source file is in CSV format
HEADER;
SELECT * FROM bronze.erp_cust_az12;

TRUNCATE TABLE bronze.erp_loc_a101;
COPY bronze.erp_loc_a101(CID,CNTRY)
FROM 'E:/DataEngineering/Git/sql-datawarehouse-project/datasets/source_erp/LOC_A101.csv' -- e.g., 'C:/data/crm_products.csv' on Windows or '/home/user/data/crm_products.csv' on Linux
DELIMITER ','                  -- Specifies that columns are separated by commas
CSV                            -- Indicates that the source file is in CSV format
HEADER;
SELECT * FROM bronze.erp_loc_a101;