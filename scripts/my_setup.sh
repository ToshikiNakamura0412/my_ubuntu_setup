#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# change folder name from Japanese to English
LANG=C xdg-user-dirs-gtk-update

# wallpaper
if [ ! -d ~/Pictures ]; then
    mkdir -p -v ~/Pictures
fi
echo "setting wallpaper... "
cp -f -v $SCRIPT_DIR/../wallpaper.png ~/Pictures
gsettings set org.gnome.desktop.background picture-uri "file:$HOME/Pictures/wallpaper.png"
echo ">>> Done"
echo ""

# git user config
echo -n "setting user config for git... "
git config --global user.name "Toshiki Nakamura"
git config --global user.email "ee193014@meiji.ac.jp"
echo ">>> Done"
echo ""
