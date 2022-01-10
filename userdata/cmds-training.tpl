1. Run MLflow training server

sudo docker run -it --network="host" --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws --name mlflow-training ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-training:0.0.1 /bin/bash

2. Set the MLFLOW_TRACKING_URI environment variable to tracking server’s URI:

export MLFLOW_TRACKING_URI=http://<tracking.ip>:5000