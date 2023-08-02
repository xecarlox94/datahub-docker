#!/bin/sh


sudo docker run \
    -e SUB_DIR='rosbag_dataset' \
    -e FILE='test.bag' \
    -e CONTAINER='ci-datahub-publisher-container' \
    --env-file=.env \
    -m="5g" \
    --privileged -it --rm  \
    jcc2000/opensfm:latest bash

#--gpus all \
