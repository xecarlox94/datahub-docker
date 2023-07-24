#!/bin/bash

# Clone the GitHub repository
git clone https://github.com/simonfuhrmann/mve.git

# Navigate into the cloned repository directory
cd mve


# Build the software
make -j8


# Navigate to the umve directory
cd apps/umve/
qmake && make -j8

#run the visulization software
./umve /home/coena98/olter/scene


