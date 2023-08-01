#!/bin/sh



sudo docker build . -t jcc2000/opensfm:latest \
    && sudo docker run \
        -e SUB_DIR='rosbag_dataset' \
        -e FILE='test.bag' \
        -m="5g" \
        --env-file .env \
        --privileged -it --rm  \
        jcc2000/opensfm:latest bash
#--gpus all \
