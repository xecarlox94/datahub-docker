FROM nvidia/cuda:12.2.0-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -qq -y \
        wget \
        vim \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update -qq && apt-get install -qq -y \
        libfuse3-dev \
        fuse3 \
    && apt-get install -qq -y blobfuse2 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir ~/mycontainer \
    && echo ". /.set_env.sh" >> ~/.bashrc \
    && echo "[ -f \"/.set_env.sh\" ] && rm /.set_env.sh" >> ~/.bashrc


COPY .set_env.sh .
COPY config.yaml .
