CREATE DATABASE ${dbname};
CREATE USER '${mysql_mlflow_username}'@'%' IDENTIFIED BY '${mysql_mlflow_password}';
GRANT ALL PRIVILEGES ON ${dbname}.* TO '${mysql_mlflow_username}'@'%' WITH GRANT OPTION;
