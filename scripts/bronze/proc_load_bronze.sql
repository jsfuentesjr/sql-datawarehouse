/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `COPY` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze ()
LANGUAGE plpgsql
AS $$
BEGIN
	RAISE NOTICE 'Starting CSV Load....';

	BEGIN 
		RAISE NOTICE 'Truncating Table: crm_cust_info';
		TRUNCATE bronze.crm_cust_info;
		RAISE NOTICE 'Loading Table: crm_cust_info';
		COPY bronze.crm_cust_info (cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date)
		FROM '/tmp/cust_info.csv'
		DELIMITER ','
		CSV HEADER;

		RAISE NOTICE 'cust_info.csv has been successfully loaded';

		RAISE NOTICE 'Truncating Table: bronze.crm_prd_info';
		TRUNCATE bronze.crm_prd_info;
		RAISE NOTICE 'Loading Table: crm_prd_info';
		COPY bronze.crm_prd_info (prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt)
		FROM '/tmp/prd_info.csv'
		DELIMITER ','
		CSV HEADER;

		RAISE NOTICE 'prd_info.csv has been successfully loaded';

		RAISE NOTICE 'Truncating Table: crm_sales_details';
		TRUNCATE bronze.crm_sales_details;
		RAISE NOTICE 'Loading Table: crm_sales_details';
		COPY bronze.crm_sales_details (sls_ord_num, sls_prd_key, sls_cust_id, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price)
		FROM '/tmp/sales_details.csv'
		DELIMITER ','
		CSV HEADER;

		RAISE NOTICE 'sales_details.csv has been successfully loaded';

		RAISE NOTICE 'Truncating Table: erp_cust_az12';
		TRUNCATE bronze.erp_cust_az12;
		RAISE NOTICE 'Loading Table: erp_cust_az12';
		COPY bronze.erp_cust_az12 (cid, bdate, gen)
		FROM '/tmp/cust_az12.csv'
		DELIMITER ','
		CSV HEADER;

		RAISE NOTICE 'cust_az12.csv has been successfully loaded';

		RAISE NOTICE 'Truncating Table: erp_loc_a101';
		TRUNCATE bronze.erp_loc_a101;
		RAISE NOTICE 'Loading Table: erp_loc_a101';
		COPY bronze.erp_loc_a101 (cid, cntry)
		FROM '/tmp/loc_a101.csv'
		DELIMITER ','
		CSV HEADER;

		RAISE NOTICE 'loc_a101.csv has been successfully loaded';


		RAISE NOTICE 'Truncating Table: erp_loc_a101';
		TRUNCATE bronze.erp_loc_a101;
		RAISE NOTICE 'Loading Table: erp_loc_a101';
		COPY bronze.erp_loc_a101 (cid, cntry)
		FROM '/tmp/loc_a101.csv'
		DELIMITER ','
		CSV HEADER;

		RAISE NOTICE 'loc_a101.csv has been successfully loaded';

		RAISE NOTICE 'Truncating Table: erp_px_cat_g1v2';
		TRUNCATE bronze.erp_px_cat_g1v2;
		RAISE NOTICE 'Loading Table: erp_px_cat_g1v2';
		COPY bronze.erp_px_cat_g1v2 (id, cat, subcat, maintenance)
		FROM '/tmp/px_cat_g1v2.csv'
		DELIMITER ','
		CSV HEADER;

		RAISE NOTICE 'px_cat_g1v2.csv has been successfully loaded';
	
	EXCEPTION
		WHEN OTHERS THEN
			RAISE WARNING 'Error loading CSV: %', SQLERRM;
	END;
END;
$$
