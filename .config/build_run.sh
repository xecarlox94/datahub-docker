#!/bin/sh


clear && sudo docker build . -t jcc2000/opensfm:latest \
    && ./.config/run.sh
