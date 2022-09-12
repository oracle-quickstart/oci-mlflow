1. Opening a Port

sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload

2. Setup HTTP Basic authentication

# Install and enable NGINX 
sudo dnf install -y nginx httpd-tools
sudo systemctl enable --now nginx.service
sudo systemctl status nginx

# Allow httpd network connections 
sudo setsebool -P httpd_can_network_connect 1

# Manage user file for basic authentication
sudo htpasswd -c /etc/nginx/.htpasswd <first_username>
sudo htpasswd /etc/nginx/.htpasswd <other_username>

# Create a custom NGINX configuration file /etc/nginx/conf.d/mlflow.conf with the following:

server {
    listen 3000;
    server_name localhost;
    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location / {
        proxy_pass http://localhost:5000;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host "localhost";
        proxy_redirect off;
    }
}

# Restart the NGINX web service to load the new configuration
sudo systemctl restart nginx

3. Run MLflow tracking server

Replace <access_key_id>, <secret_access_key>, <mysql_mlflow_username> and <mysql_mlflow_password>. We don't save these values in this file.

sudo docker run -d --network="host" --rm -p 5000:5000 --name mlflow-tracking -e MLFLOW_S3_ENDPOINT_URL=${s3_endpoint_url} -e AWS_ACCESS_KEY_ID=<access_key_id> -e AWS_SECRET_ACCESS_KEY=<secret_access_key> -e BUCKET_URL=${bucket-url} -e MYSQL_USER=<mysql_mlflow_username> -e MYSQL_PWD='<mysql_mlflow_password>' -e MYSQL_HOST=${database_ip} -e MYSQL_PORT=${database_port} -e DB_NAME=${dbname} ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-tracking:0.0.1 
