# SQL
## Progress

Check syntax ->> Check meaning ->> Check shared pool:
* if SHARED_POOL: `HARD_PARSE` ->> 
* if not SHARED_POOL: `SOFT_PARSE` ->>

## 1. Run sql file
```
sql> source \home\user\Desktop\test.sql;
```
```
mysql -u yourusername -p yourpassword yourdatabase < text_file
```
## 2. Setup security
```
sudo mysql_secure_installation 
```

## 3. Change root pasword
```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root-password';
```

With max user connection:
```
CREATE USER 'exporter'@'localhost' IDENTIFIED BY 'enter_password_here' WITH MAX_USER_CONNECTIONS 3;
```

Grant user permission:
```
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'localhost';
```

## 4. Count value in a table
```
SELECT COUNT(*) FROM your_table_name
```

```
SELECT COUNT(*) AS total FROM your_table_name
```
* `COUNT(*)` counts all rows in the table.
* `AS total_count` gives a name to the result column for readability

```
SELECT COUNT(1) FROM your_table_name
```

## 5. Search by column value
```
SELECT * FROM your_table_name WHERE your_column_name LIKE '%search_pattern%';
```

## 6. Fetch value with row limit
```
SELECT * FROM table_name LIMIT 10;
```
* select `first ten line` from table `table_name`

## 7. Update value
```
UPDATE table_name
SET column_name = new_value
WHERE condition;
```
* table_name is the name of the table you want to update.
* column_name is the name of the column you want to change.
* new_value is the new value you want to set for the column.
* condition specifies which rows should be updated. Without a WHERE clause, all rows in the table will be updated.

## 8. Procedure
Create new procedure:
```
CREATE PROCEDURE procedure_name
AS
sql_statement
GO;
```

Execute defined procedure:
```
EXEC procedure_name;
```

Example procedure:
```
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;
```

Example of using defined procedure:
```
EXEC SelectAllCustomers;
```

With one parameter:
```
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;
```

Execute defined procedure with one precedure:
```
EXEC SelectAllCustomers @City = 'London';
```

With multiple parameters
```
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;
```

Execute defined procedure:
```
EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';
```

# SQL OPTIMIZATION

Delete 2 million records from a table:
```
DELETE FROM <TABLE_NAME>
```

or
```
TRUNCATE FROM <TABLE_NAME>
```

conditional:
```
CREATE INDEX <INDEX_NAME> ON <TABLE_NAME(<field>)>
```

# SQL OPERATION
from local server:
```
mysqldump -u local_user -p local_database | mysql -h remote_host -u remote_user -p remote_database
```

from files:
```
gunzip -c your_dump_file.sql.gz | mysql -h remote.example.com -u remote_user -p remote_db
```

# SQL EXPORTER
```
# /etc/systemd/system/mysql_exporter.service

[Unit]
Description=Mysql Exporter
Wants=network-online.target
After=network-online.target


[Service]
User=root
Group=root
Type=simple
Environment='DATA_SOURCE_NAME=exporter:exporter@(localhost:3306)/'
ExecStart=/root/mysqld_exporter-0.10.0.linux-amd64/mysqld_exporter

[Install]
WantedBy=multi-user.target
```

# SQL TYPE
Show all types:
```
SELECT      n.nspname as schema, t.typname as type 
FROM        pg_type t 
LEFT JOIN   pg_catalog.pg_namespace n ON n.oid = t.typnamespace 
WHERE       (t.typrelid = 0 OR (SELECT c.relkind = 'c' FROM pg_catalog.pg_class c WHERE c.oid = t.typrelid)) 
AND     NOT EXISTS(SELECT 1 FROM pg_catalog.pg_type el WHERE el.oid = t.typelem AND el.typarray = t.oid)
AND     n.nspname NOT IN ('pg_catalog', 'information_schema');
```

# POSTGRESQL
move db:

create dump:
```
pg_dump dbname | gzip > filename.gz
```

reload:
```
gunzip -c filename.gz | psql dbname

