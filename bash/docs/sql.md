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

