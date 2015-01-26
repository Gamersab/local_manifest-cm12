#!/bin/bash

if [ -f ~/bin/paths-12.0.sh ]; then
    source ~/bin/paths-12.0.sh
fi

if [ ! -d ".repo" ]; then
    echo -e "No .repo directory found.  Is this an Android build tree?"
    exit 1
fi

if [ "${android}" = "" ]; then
    android="${PWD}"
fi

# frameworks/av : Add back missing msm7x27a to fix compilation
cherries+=(79582)

# Build : Add back support for msm7x27a Board
#cherries+=(79581)

# build: Add option to disable block-based ota
cherries+=(78849)

# Allow low RAM devices have multiple users
cherries+=(78423)

#bcmdhd: workaround for driver compiled as a module
cherries+=(82598)

# mtdutils: Fix mounting partitions by-name
cherries+=(83404)

# install: disable signature checking on eng and userdebug builds
cherries+=(81797)

${android}/build/tools/repopick.py -b ${cherries[@]}
