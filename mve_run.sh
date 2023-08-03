#!/usr/bin/bash


MVE=/home/jcc2000/Sources/mve/apps

DATA=/home/jcc2000/Desktop/datahub-docker



IMG_DIR="$DATA/scene"

IMG_ENH_DIR=$DATA/enhanced_images \
    && ! [ -d $IMG_ENH_DIR ] \
    && mkdir -p $IMG_ENH_DIR

# conversion to mve scene
$MVE/makescene/makescene -i $IMG_ENH_DIR $IMG_DIR

# sfm reconstruction on images
$MVE/sfmrecon/sfmrecon $IMG_DIR


# multi-view stereo reconstruction
$MVE/dmrecon/dmrecon -s2 $IMG_DIR

# create extremely dense point-cloud
$MVE/scene2pset/scene2pset -F2 $IMG_DIR $IMG_DIR/pset-L2.ply

# final surface from the dense point cloud
$MVE/fssrecon/fssrecon $IMG_DIR/pset-L2.ply $IMG_DIR/surface-L2.ply

# clean mesh
$MVE/meshclean/meshclean -t10 $IMG_DIR/surface-L2.ply $IMG_DIR/surface-L2-clean.ply


echo "Done!"
