#!/bin/sh


sudo docker run \
    -e SUB_DIR='rosbag_dataset' \
    -e FILE='aris.bag' \
    -m="5g" \
    --gpus all \
    --env-file .env
    --privileged -it --rm  \
    jcc2000/opensfm:latest bash
