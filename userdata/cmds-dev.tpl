1. Run MLflow dev server:

sudo docker run -it --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws --mount type=bind,source=$HOME/userdata,target=/root/userdata -p 8888:8888 --name mlflow-dev ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-dev:0.0.1 /bin/bash

2. Run jupyter inside the container:

jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --port=8888 --certfile=/root/userdata/jupyter-cert.pem --keyfile=/root/userdata/jupyter-key.key &


