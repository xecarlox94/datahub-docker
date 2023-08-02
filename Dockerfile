FROM nvidia/cuda:12.2.0-base-ubuntu20.04
ARG DEBIAN_FRONTEND=noninteractive

COPY config.yaml .
COPY set_env.sh .

RUN apt-get update && apt-get install -y \
        wget \
        vim \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update && apt-get install -y \
        libfuse3-dev \
        fuse3 \
    && apt-get install -y blobfuse2 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir ~/mycontainer \
    && echo "source /set_env.sh" >> ~/.bashrc








