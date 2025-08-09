/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse'. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
*/

-- Create database
CREATE DATABASE Datawarehouse;

-- Create schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
