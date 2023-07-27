#!/usr/bin/bash


mkdir -p ~/mycontainer/imgs/

python3 /preproc_ros.py

cd ~/mycontainer/imgs/

images=$(ls | tr "\n" " " | awk 'NF=10')

mkdir -p /OpenSfM/data/demo/images

cp $images /OpenSfM/data/demo/images

cp /OpenSfM/data/berlin/config.yaml /OpenSfM/data/demo

cd /OpenSfM/

bin/opensfm_run_all data/demo

cp -r data/demo ~/mycontainer
