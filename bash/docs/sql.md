# SQL
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

## 6. Update value
```
UPDATE table_name
SET column_name = new_value
WHERE condition;
```
* table_name is the name of the table you want to update.
* column_name is the name of the column you want to change.
* new_value is the new value you want to set for the column.
* condition specifies which rows should be updated. Without a WHERE clause, all rows in the table will be updated.
