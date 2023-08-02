#!/usr/bin/env bash


echo "  subdirectory: \"$SUB_DIR\"" >> /config.yaml \
    && blobfuse2 \
        mount ~/mycontainer \
        --config-file=/config.yaml \
    && cd ~/mycontainer/


#sed -i 's/<acc_name>/TEST!!!!!!!!!!!!!/g' /config.yaml
