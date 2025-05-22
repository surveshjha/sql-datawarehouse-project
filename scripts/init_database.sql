/*
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE DATABASE AND SCHEMAS 

SCRIPT PURPOSE:
    This scripts creates a new database in datawarehouse if it already exists and creates a new database
    named datawarehouse, Alternatively in case of Postgresql we need to connect with the database and open
    the query tool in that database and run the Create schema script generate 3 dedicated layers as Bronze,
    silver & gold. Each serving its own purpose.

-- IMPORTANT: This will permanently delete all data in the database.

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
*/

-- First, disconnect all other active sessions from the database
-- This is necessary if you encounter "database is being accessed by other users" error.

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'datawarehouse'
  AND pid <> pg_backend_pid();

DROP DATABASE IF EXISTS datawarehouse;
-- Create the new database 'your_database_name'.

CREATE DATABASE datawarehouse;

-- You can connect to the newly created database using:
-- \c your_database_name;

--BEFORE CREATING SCHEMA CONNECT TO THE DATABASE AND OPEN QUERY TOOL IN THAT DATABASE AND EXECUTE THE QUERY

CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;
