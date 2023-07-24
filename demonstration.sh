#!/usr/bin/bash


./build_run.sh \
    && az login --tenant d660b123-1953-4239-8c43-988d36f8930b \
    && az storage copy  \
        --source https://dlsdatahubdemouksouth.blob.core.windows.net/ci-datahub-publisher-container/rosbag_dataset/demo  \
        --recursive  \
        -d . \
    &&
