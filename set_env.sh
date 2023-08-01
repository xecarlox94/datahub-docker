#!/usr/bin/env bash


echo "  subdirectory: \"$SUB_DIR\"" >> ./config.yaml

blobfuse2 mount ~/mycontainer --config-file=./config.yaml

cd ~/mycontainer/


export CONTAINER=$(\
    cat /config.yaml \
        | grep container \
        | sed 's/^[ \t]*//;s/[ \t]*$//' \
        | tr -d '"' \
        | awk '{print $2}')
