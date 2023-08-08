FROM nvidia/cuda:12.2.0-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -qq -y \
        wget vim git make \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update -qq && apt-get install -qq -y \
        libfuse3-dev fuse3 \
    && apt-get install -qq -y \
        blobfuse2 \
    && rm -rf \
        /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir ~/mycontainer \
    && echo ". /.set_env.sh" >> ~/.bashrc \
    && echo "[ -f \"/.set_env.sh\" ] && rm /.set_env.sh" >> ~/.bashrc


COPY .set_env.sh .
COPY config.yaml .



###############################################################################################
#
#   Initialisation layer
#
###############################################################################################


# maybe
#RUN pip3 install -r /python/requirements.txt
#RUN pip3 install -r /underwater_image_dehazing/requirements.txt

# this one, for sure
RUN apt-get update -y && apt-get install -y build-essential


# move code up, later
########################################################



# Install required packages using apt-get
RUN apt-get update && \
    apt-get install -y \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libgl-dev \
        qt5-qmake \
        qt5-default \
    && git clone --recursive https://github.com/simonfuhrmann/mve.git \
    && rm -rf \
    	/var/lib/apt/lists/* \
    	/tmp/* \
    	/var/tmp/*




WORKDIR "/mve"


RUN make -j8



ENV PATH="${PATH}:/mve/bin"

ENV MVE='/mve/apps'



# TODO
#COPY enhanced pictures folder



WORKDIR "/"

COPY . .
