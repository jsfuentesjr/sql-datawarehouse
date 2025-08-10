# PostgresSQL Datawarehouse

This project showcases the development of a fully functional data warehousing and analytics solution. It encompasses the design and implementation of a PostgreSQL-based data warehouse, along with the processes for data integration, transformation, and analysis, to deliver actionable business insights.

## Data Architecture
The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:
<img width="849" height="425" alt="Image" src="https://github.com/user-attachments/assets/58dd35e8-6450-43ea-94db-28fbb1443e83" />

1. **Bronze Layer**: Contains raw, unprocessed data directly ingested from source systems. In this project, data is imported from CSV files into the SQL Server database.
2. **Silver Layer**: Performs data cleansing, standardization, and normalization to ensure consistency and quality, preparing the data for analytical processing.
3. **Gold Layer**: Stores business-ready, curated data modeled in a star schema format, optimized for reporting and advanced analytics.

## Project Overview
This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.

## Project Star Schema
Dimensional modeling is performed in this project to create a star schema that organizes data into fact and dimension tables, enabling efficient querying, simplified reporting, and improved analytical performance.
<img width="723" height="353" alt="Image" src="https://github.com/user-attachments/assets/9fe9649e-bd72-4cbe-851e-c1e19de28def" />

**Customers Dimension** 
Stores enriched customer data by integrating CRM and ERP records. Includes surrogate keys, personal details, location, marital status, gender, birthdate, and account creation date, enabling consistent and reliable customer analysis.

**Products Dimension** 
Contains product master data with surrogate keys, identifiers, names, categories, subcategories, maintenance info, costs, product lines, and start dates. Filters out discontinued or historical records to maintain a current view of active products.

**Sales Fact** 
Captures transactional sales data linked to products and customers via surrogate keys. Records order dates, shipping and due dates, sales amounts, quantities, and prices, forming the central table for performance tracking and analytical reporting.
