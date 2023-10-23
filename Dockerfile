#FROM ubuntu:focal
FROM nvidia/cuda:12.2.0-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get install -y \
    	wget \
    	vim \
    	git \
        make \
        g++ \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i \
    	packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y \
    	libfuse3-dev \
    	fuse3 \
    && apt-get install -y \
    	blobfuse2 \
    && rm -rf \
    	/var/lib/apt/lists/* \
    	/tmp/* \
    	/var/tmp/* \
    && mkdir ~/mycontainer



# Install required packages using apt-get
RUN apt-get update && \
    apt-get install -y \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libgl-dev \
        qt5-qmake \
        qt5-default \
    && rm -rf /var/lib/apt/lists/* \
    && git config --global user.email "coenadas.nr@gmail.com" \
    && git clone --recursive https://github.com/simonfuhrmann/mve.git \
    && rm -rf \
    	/var/lib/apt/lists/* \
    	/tmp/* \
    	/var/tmp/* \

WORKDIR "/mve"

# Set the working directory and create the bin directory
#RUN mkdir
RUN make -j8
# Build the application using 'make all'
#RUN make all

#ENV PATH="${PATH}:/mve/bin"

#RUN pip3 install -r requirements.txt

ENV PATH="${PATH}:/"


WORKDIR "/"

COPY . .

#WORKDIR "~"

RUN echo "echo \"  subdirectory: \\\"\$SUB_DIR\\\"\" >> /config.yaml" >> ~/.bashrc
RUN echo "blobfuse2 mount ~/mycontainer --config-file=./config.yaml" >> ~/.bashrc
RUN echo "cd ~/mycontainer/" >> ~/.bashrc
RUN echo "source set_env.sh" >> ~/.bashrc
#
#RUN echo "/run_demo.sh" >> ~/.bashrc
