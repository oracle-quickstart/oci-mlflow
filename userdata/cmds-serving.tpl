1. Run Mlflow serving server:

sudo docker run -it --network="host" --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws -p 1234:1234 --name mlflow-serving ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-serving:0.0.1 /bin/bash


