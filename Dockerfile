#FROM ubuntu:focal
FROM nvidia/cuda:12.2.0-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get install wget vim -y \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install libfuse3-dev fuse3 -y \
    && apt-get install blobfuse2 -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*





# Install apt-getable dependencies
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        git \
        libeigen3-dev \
        libopencv-dev \
        libceres-dev \
        python3-dev \
        python3-numpy \
        python3-opencv \
        python3-pip \
        python3-pyproj \
        python3-scipy \
        python3-yaml \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



RUN git clone --recursive https://github.com/mapillary/OpenSfM
WORKDIR "/OpenSfM"
RUN pip3 install -r requirements.txt \
    &&  python3 setup.py build
WORKDIR "/"

ENV PATH="${PATH}:/OpenSfM/bin"
ENV PATH="${PATH}:/"




COPY . .


RUN pip3 install -r requirements.txt

RUN mkdir ~/mycontainer
RUN rm packages-microsoft-prod.deb


RUN echo "echo \"  subdirectory: \\\"\$SUB_DIR\\\"\" >> /config.yaml" >> ~/.bashrc
RUN echo "blobfuse2 mount ~/mycontainer --config-file=./config.yaml" >> ~/.bashrc
RUN echo "cd ~/mycontainer/" >> ~/.bashrc
RUN echo "source set_env.sh" >> ~/.bashrc

#RUN echo "/run_demo.sh" >> ~/.bashrc



