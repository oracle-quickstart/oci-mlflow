1. Run MLflow tracking server

sudo docker run -it --network="host" --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws -p 5000:5000 --name mlflow-tracking ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-tracking:0.0.1 /bin/bash

2. Run mlflow tracking server inside the container

Replace <mysql_mlflow_username> and <mysql_mlflow_password> with your Terraform input variable values. We don't save these values in this file.

mlflow server --backend-store-uri mysql+pymysql://<mysql_mlflow_username>:'<mysql_mlflow_password>'@${database_ip}:${database_port}/${dbname} --default-artifact-root ${bucket-url} --host 0.0.0.0 &

3. Keep Your Container Running In The Background

You have to use two combinations, one after the other: ctrl+p followed by ctrl+q.