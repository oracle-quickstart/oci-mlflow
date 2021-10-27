1. Run MLflow dev server:

sudo docker run -it --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws --mount type=bind,source=$HOME/userdata,target=/root/userdata -p 8888:8888 --name mlflow-dev ${region_registry}.ocir.io/${tenancy_name}/${repo_name}/mlflow-dev:0.0.1 /bin/bash

2. Secure Jupyter Notebook inside the container:

Add a password to Jupyter Notebook. When prompted, enter a suitably strong password. You can run this command any time that you want to change the password:
jupyter notebook password

Install a certificate for encrypted communications over HTTPS. To install a self-signed certificate:
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout jupyter-key.key -out jupyter-cert.pem

3. Run jupyter inside the container:

jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --port=8888 --certfile=jupyter-cert.pem --keyfile=jupyter-key.key &


