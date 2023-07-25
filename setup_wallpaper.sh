#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# wallpaper
if [ ! -d ~/Pictures ]; then
    mkdir -p -v ~/Pictures
fi
if [ ! -e ~/Pictures/wallpaper.png ]; then
    echo "copy wallpaper... "
    cp -f -v $SCRIPT_DIR/wallpaper.png $HOME/Pictures
    gsettings set org.gnome.desktop.background picture-uri "file:$HOME/Pictures/wallpaper.png"
    echo ">>> Done"
    echo ""
fi
