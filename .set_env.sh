#!/usr/bin/env bash

sed -i "\
        s/<acc_name>/"$ACCOUNT_NAME"/g; \
        s/<acc_key>/"$ACCOUNT_KEY"/g; \
        s/<container>/"$CONTAINER"/g; \
        s/<sub_dir>/"$SUB_DIR"/g; \
    " /config.yaml \
    && unset ACCOUNT_KEY \
    && blobfuse2 \
        mount ~/mycontainer \
        --config-file=/config.yaml \
    && rm /config.yaml \
    && cd ~/mycontainer/ \
    && sed -i "/\. \/\.set_env.sh/d" ~/.bashrc

