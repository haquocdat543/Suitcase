# SQL
## Progress

Check syntax ->> Check meaning ->> Check shared pool:
* if SHARED_POOL: `HARD_PARSE` ->> 
* if not SHARED_POOL: `SOFT_PARSE` ->>

## 1. Run sql file
```bash
sql> source \home\user\Desktop\test.sql;
```
```bash
mysql -u yourusername -p yourpassword yourdatabase < text_file
```
## 2. Setup security
```bash
sudo mysql_secure_installation 
```

## 3. Change root pasword
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root-password';
```

With max user connection:
```sql
CREATE USER 'exporter'@'localhost' IDENTIFIED BY 'enter_password_here' WITH MAX_USER_CONNECTIONS 3;
```

Grant user permission:
```sql
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'localhost';
```

## 4. Count value in a table
```sql
SELECT COUNT(*) FROM your_table_name
```

```sql
SELECT COUNT(*) AS total FROM your_table_name
```
* `COUNT(*)` counts all rows in the table.
* `AS total_count` gives a name to the result column for readability

```sql
SELECT COUNT(1) FROM your_table_name
```

## 5. Search by column value
```sql
SELECT * FROM your_table_name WHERE your_column_name LIKE '%search_pattern%';
```

## 6. Fetch value with row limit
```sql
SELECT * FROM table_name LIMIT 10;
```
* select `first ten line` from table `table_name`

## 7. Update value
```sql
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
```sql
CREATE PROCEDURE procedure_name
AS
sql_statement
GO;
```

Execute defined procedure:
```sql
EXEC procedure_name;
```

Example procedure:
```sql
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;
```

Example of using defined procedure:
```sql
EXEC SelectAllCustomers;
```

With one parameter:
```sql
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;
```

Execute defined procedure with one precedure:
```sql
EXEC SelectAllCustomers @City = 'London';
```

With multiple parameters
```sql
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;
```

Execute defined procedure:
```sql
EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';
```

# SQL OPTIMIZATION

Delete 2 million records from a table:
```sql
DELETE FROM <TABLE_NAME>
```

or
```sql
TRUNCATE FROM <TABLE_NAME>
```

conditional:
```sql
CREATE INDEX <INDEX_NAME> ON <TABLE_NAME(<field>)>
```

# SQL OPERATION
from local server:
```bash
mysqldump -u local_user -p local_database | mysql -h remote_host -u remote_user -p remote_database
```

from files:
```bash
gunzip -c your_dump_file.sql.gz | mysql -h remote.example.com -u remote_user -p remote_db
```

# SQL EXPORTER
```toml
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
```sql
SELECT      n.nspname as schema, t.typname as type 
FROM        pg_type t 
LEFT JOIN   pg_catalog.pg_namespace n ON n.oid = t.typnamespace 
WHERE       (t.typrelid = 0 OR (SELECT c.relkind = 'c' FROM pg_catalog.pg_class c WHERE c.oid = t.typrelid)) 
AND     NOT EXISTS(SELECT 1 FROM pg_catalog.pg_type el WHERE el.oid = t.typelem AND el.typarray = t.oid)
AND     n.nspname NOT IN ('pg_catalog', 'information_schema');
```

# POSTGRESQL
## DATA OPERATIONS
move db:

create dump:
```bash
pg_dump dbname | gzip > filename.gz
```

reload:
```bash
gunzip -c filename.gz | psql dbname
```

## CONFIG OPERATIONS
```bash
vim /etc/postgresql/13/main/postgresql.conf   # For Debian/Ubuntu
```

```bash
vim /var/lib/pgsql/13/data/postgresql.conf   # For RedHat/CentOS
```

* `log_statement`: Controls which SQL statements are logged.
```toml
log_statement = 'all'  # Log all SQL statements. Options: 'none', 'ddl', 'mod', 'all'
```

* `max_connections`: Specifies the maximum number of concurrent connections.
```toml
max_connections = 200  # Set the maximum number of database connections
```

* `shared_buffers`: The amount of memory the database server uses for shared memory buffers.
```toml
shared_buffers = 1GB  # Adjust depending on available memory on your server
```

* `work_mem`: The amount of memory to be used by each query operation (like sorts or joins).
```toml
work_mem = 16MB  # Size of memory for each query sort operation
```

* `effective_cache_size`: The effective size of the disk cache used by PostgreSQL to optimize queries.
```toml
effective_cache_size = 4GB  # Typically set to 50-75% of your server's RAM
```

* `maintenance_work_mem`: The memory allocated for maintenance operations like VACUUM and CREATE INDEX.
```toml
maintenance_work_mem = 256MB  # The amount of memory used for maintenance operations
```

* `autovacuum`: Enable or disable the automatic vacuuming of tables.
```toml
autovacuum = on  # Make sure this is turned on for automatic cleanup
```

* `log_min_duration_statement`: Specifies the minimum execution time for a query to be logged.
```toml
log_min_duration_statement = 1000  # Log queries taking longer than 1 second
```

* `timezone`: Set the server time zone.
```toml
timezone = 'UTC'  # Set to your preferred timezone
```

* `synchronous_commit`: Controls whether the server waits for confirmation that a transaction has been written to disk.
```toml
synchronous_commit = on  # Ensures durability but may slow performance
```
