#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# wallpaper
if [ ! -d ~/Pictures ]; then
    mkdir -p -v ~/Pictures
fi
if [ ! -e ~/Pictures/wallpaper.png ]; then
    echo "copy wallpaper... "
    cp -f -v $SCRIPT_DIR/wallpaper.png ~/Pictures
    echo ">>> Done!"
fi
