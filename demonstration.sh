#!/usr/bin/bash


#&& ./build_run.sh \
zathura /home/jcc2000/Desktop/OLTER_presentation/lecture.pdf \
    && az login --tenant d660b123-1953-4239-8c43-988d36f8930b \
    && az storage copy  \
        --source https://dlsdatahubdemouksouth.blob.core.windows.net/ci-datahub-publisher-container/rosbag_dataset/imgs  \
        --recursive  \
        -d . \
    && az storage copy  \
        --source https://dlsdatahubdemouksouth.blob.core.windows.net/ci-datahub-publisher-container/rosbag_dataset/demo  \
        --recursive  \
        -d . \
    && mkdir -p ~/Sources/OpenSfM/data/demo/images \
    && cp imgs/* ~/Sources/OpenSfM/data/demo/images \
    && cd ~/Sources/OpenSfM/ \
    && sed \
        's/depthmap_min_consistent_views: 2/depthmap_min_consistent_views: 5/g' \
        ~/Sources/OpenSfM/data/berlin/config.yaml > ~/Sources/OpenSfM/data/demo/config.yaml \
    && bin/opensfm_run_all data/demo \
    && python3 viewer/server.py -d data/demo



# build
# copy files from blob storage
# run reconstruction locally
# present results (python viewer; meshlab)
