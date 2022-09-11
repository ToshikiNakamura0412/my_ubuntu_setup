#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# hide home folder
echo -n "hiding home folder in desktop ... "
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
echo "Done!"

# Xmodmap
echo -n "copy keymap config ... "
cat $SCRIPT_DIR/Xmodmap > ~/.Xmodmap
echo "Done!"

# font
if [ -d ~/.fonts ]; then
    echo "~/.fonts exists"
else
    mkdir -p -v ~/.fonts
fi
echo "copy fonts ... "
cp -f -v $SCRIPT_DIR/fonts/* ~/.fonts/
echo ">>> Done!"

# icon
if [ -d ~/.icons ]; then
    echo "~/.icons exists"
else
    mkdir -p -v ~/.icons
fi
echo -n "copy icons ... "
cp -f -r $SCRIPT_DIR/icons/* ~/.icons/
echo "Done!"

# theme
if [ -d ~/.themes ]; then
    echo "~/.themes exists"
else
    mkdir -p -v ~/.themes
fi
echo -n "copy themes ... "
cp -f -r $SCRIPT_DIR/themes/* ~/.themes/
echo "Done!"

# wallpaper
if [ -d ~/Pictures ]; then
    echo "~/Pictures exists"
else
    mkdir -p -v ~/Pictures
fi
echo "copy wallpaper ... "
cp -f -v $SCRIPT_DIR/wallpaper.png ~/Pictures
echo ">>> Done!"

# tmux
sudo apt install tmux

# vim
sudo apt install vim

# neovim
sudo apt install neovim

# gnome-shell
sudo apt install chrome-gnome-shell

# gnome-tweaks
sudo apt install gnome-tweaks

# mozc utils
sudo apt install mozc-utils-gui

# curl
sudo apt install curl

# zsh
sudo apt install zsh
chsh -s /bin/zsh

echo "==="
echo "you can change your shell to zsh if you reboot"
echo "run setup2.sh after reboot"
echo "==="
