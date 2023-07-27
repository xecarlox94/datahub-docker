!/usr/bin/bash

cd /images/

images=$(ls | tr "\n" " " | awk 'NF=10')

mkdir -p /data/demo/images

cp $images /data/demo/images

cd /mve/apps/makescene

./makescene -i /data/demo/images /data/demo/scene

cd /mve/apps/sfmrecon

./sfmrecon /data/demo/scene

cd /mve/apps/dmrecon

./dmrecon -s2 /data/demo/scene

cd /mve/apps/scene2pset

./scene2pset -F2 /data/demo/scene /data/demo/scene/pset-L2.ply

cd /mve/apps/fssrecon

./fssrecon /data/demo/scene/pset-L2.ply /data/demo/scene/surface-L2.ply

cd /mve/apps/meshclean

./meshclean -t10 /data/demo/scene/surface-L2.ply /data/demo/scene/surface-L2-clean.ply

#cp -r data/demo ~/mycontainer


echo "Coena, vim is the best!"
