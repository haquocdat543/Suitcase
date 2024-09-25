# SONARQUBE

## PostgreSQL
Replace sonarqube password with your real password
```
CREATE USER sonarqube WITH PASSWORD 'sonarqube_user_password';
CREATE DATABASE sonarqube OWNER sonarqube;
GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonarqube;
GRANT CONNECT ON DATABASE sonarqube TO sonarqube;
\q
```

