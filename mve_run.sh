#!/usr/bin/bash


MVE=/home/coena98/mve/apps

DATA=/home/coena98/olter


$MVE/makescene/makescene -i $DATA/enhanced_images $DATA/scene2

$MVE/sfmrecon/sfmrecon $DATA/scene2

$MVE/dmrecon/dmrecon -s2 $DATA/scene2

$MVE/scene2pset/scene2pset -F2 $DATA/scene2 $DATA/scene2/pset-L2.ply

$MVE/fssrecon/fssrecon $DATA/scene2/pset-L2.ply $DATA/scene2/surface-L2.ply

$MVE/meshclean/meshclean -t10 $DATA/scene2/surface-L2.ply $DATA/scene2/surface-L2-clean.ply


echo "Done!"
