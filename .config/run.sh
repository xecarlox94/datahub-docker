#!/bin/sh

sudo docker run \
    -e SUB_DIR='rosbag_dataset' \
    -e FILE='test.bag' \
    -e CONTAINER='ci-datahub-publisher-container' \
    -e ACCOUNT_NAME='dlsdatahubdemouksouth' \
    -e MVE='/mve/apps' \
    -e DATA='/home/jcc2000/Desktop/datahub-docker' \
    --env-file=.env \
    -m="5g" \
    --privileged -it --rm  \
    jcc2000/opensfm:latest bash

#--gpus all \
