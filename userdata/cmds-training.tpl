1. Run MLflow training server

Replace <access_key_id>, <secret_access_key> and <tracking_uri>. We don't save these values in this file.

sudo docker run -it --network="host" --rm --name mlflow-training -e MLFLOW_S3_ENDPOINT_URL=${s3_endpoint_url} -e AWS_ACCESS_KEY_ID=<access_key_id> -e AWS_SECRET_ACCESS_KEY=<secret_access_key> -e MLFLOW_TRACKING_URI=<tracking_uri>  ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-training:0.0.1 /bin/bash

2. Keep Your Container Running In The Background (optional) 

You have to use two combinations, one after the other: ctrl+p followed by ctrl+q.