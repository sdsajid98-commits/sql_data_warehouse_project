/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
    Creates the Data Warehouse database and required schemas
    for the Medallion Architecture (Bronze, Silver, Gold).

    If the database already exists, it will be dropped and recreated.
    Schemas are then initialized for the ETL layers.
=============================================================
*/

USE master;

-- drop and recreate database if it already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'data_warehouse')
BEGIN
    ALTER DATABASE data_warehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE data_warehouse;
END;
GO

-- create fresh database
CREATE DATABASE data_warehouse;
GO

USE data_warehouse;
GO

-- create schemas for medallion layers
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
