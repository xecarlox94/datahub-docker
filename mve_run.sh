#!/usr/bin/bash


MVE=/home/jcc2000/Sources/mve/apps

DATA=/home/jcc2000/Desktop/datahub-docker

IMG_DIR="$DATA/scene"

$MVE/makescene/makescene -i $DATA/enhanced_images $IMG_DIR

$MVE/sfmrecon/sfmrecon $IMG_DIR

$MVE/dmrecon/dmrecon -s2 $IMG_DIR

$MVE/scene2pset/scene2pset -F2 $IMG_DIR $IMG_DIR/pset-L2.ply

$MVE/fssrecon/fssrecon $IMG_DIR/pset-L2.ply $IMG_DIR/surface-L2.ply

$MVE/meshclean/meshclean -t10 $IMG_DIR/surface-L2.ply $IMG_DIR/surface-L2-clean.ply


echo "Done!"
