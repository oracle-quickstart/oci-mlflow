1. Opening Ports

sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --zone=public --add-port=33060/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8888/tcp --permanent
sudo firewall-cmd --reload

2. Run MLflow dev server:

Replace <access_key_id>, <secret_access_key> and <tracking_uri>. We don't save these values in this file.

sudo docker run -it --rm -p 8888:8888 --name mlflow-dev -e MLFLOW_S3_ENDPOINT_URL=${s3_endpoint_url} -e AWS_ACCESS_KEY_ID=<access_key_id> -e AWS_SECRET_ACCESS_KEY=<secret_access_key> -e MLFLOW_TRACKING_URI=<tracking_uri>   ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-dev:0.0.1 /bin/bash

3. Install a certificate for Jupyter Notebook inside the container:

Install a certificate for encrypted communications over HTTPS. To install a self-signed certificate:
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout jupyter-key.key -out jupyter-cert.pem

4. Run jupyter inside the container:

jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --port=8888 --certfile=jupyter-cert.pem --keyfile=jupyter-key.key &

5. Keep Your Container Running In The Background (optional) 

You have to use two combinations, one after the other: ctrl+p followed by ctrl+q.
