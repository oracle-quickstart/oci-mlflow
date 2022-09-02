1. Opening a Port

sudo firewall-cmd --zone=public --add-port=5000/tcp --permanent
sudo firewall-cmd --reload

2. Run MLflow tracking server

Replace <access_key_id>, <secret_access_key>, <mysql_mlflow_username> and <mysql_mlflow_password>. We don't save these values in this file.

sudo docker run -d --network="host" --rm -p 5000:5000 --name mlflow-tracking -e MLFLOW_S3_ENDPOINT_URL=${s3_endpoint_url} -e AWS_ACCESS_KEY_ID=<access_key_id> -e AWS_SECRET_ACCESS_KEY=<secret_access_key> -e BUCKET_URL=${bucket-url} -e MYSQL_USER=<mysql_mlflow_username> -e MYSQL_PWD='<mysql_mlflow_password>' -e MYSQL_HOST=${database_ip} -e MYSQL_PORT=${database_port} -e DBNAME=${dbname} ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-tracking:0.0.1 


