#!/bin/bash
# You can get the latest installer from https://repo.continuum.io/archive/.

echo "====== Install Miniconda Distribution ======"
CONDA_HOME=/opt/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_HOME

echo -e 'export PATH="$CONDA_HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "====== Set Up a Machine Learning Sandbox Environment ======"
conda init bash
source ~/.bashrc
conda create -n mlflow python=3.8
conda activate mlflow

