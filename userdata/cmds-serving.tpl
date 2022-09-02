1. Opening a Port

sudo firewall-cmd --zone=public --add-port=1234/tcp --permanent
sudo firewall-cmd --reload

2. Run Mlflow to serve model:

Replace <access_key_id>, <secret_access_key>, <model_uri>, <tracking_uri> and <model-uri>. We don't save these values in this file.

sudo docker run -d --network="host" --rm -p 1234:1234 --name mlflow-serving -e MLFLOW_S3_ENDPOINT_URL=${s3_endpoint_url} -e AWS_ACCESS_KEY_ID=<access_key_id> -e AWS_SECRET_ACCESS_KEY=<secret_access_key> -e MLFLOW_TRACKING_URI=<tracking_uri> -e PORT=1234 -e MODEL_URI=<model-uri> ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-serving:0.0.1 
