1. Opening a Port

sudo firewall-cmd --zone=public --add-port=1234/tcp --permanent
sudo firewall-cmd --reload

2. Run Mlflow serving server:

Replace <access_key_id>, <secret_access_key>, <model_uri> and <tracking_uri>. We don't save these values in this file.

sudo docker run -it --network="host" --rm -p 1234:1234 --name mlflow-serving -e MLFLOW_S3_ENDPOINT_URL=${s3_endpoint_url} -e AWS_ACCESS_KEY_ID=<access_key_id> -e AWS_SECRET_ACCESS_KEY=<secret_access_key> -e MLFLOW_TRACKING_URI=<tracking_uri>  ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-serving:0.0.1 /bin/bash

3. Keep Your Container Running In The Background (optional) 

You have to use two combinations, one after the other: ctrl+p followed by ctrl+q.