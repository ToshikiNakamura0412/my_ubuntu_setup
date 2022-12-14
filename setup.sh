#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# hide home folder
echo -n "hiding home folder in desktop... "
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
echo "Done"

# Xmodmap
echo -n "copy keymap config... "
cat $SCRIPT_DIR/Xmodmap > ~/.Xmodmap
echo "Done"

# font
if [ -d ~/.fonts ]; then
    echo "~/.fonts exists"
else
    mkdir -p -v ~/.fonts
fi
echo "copy fonts... "
cp -f -v $SCRIPT_DIR/fonts/* ~/.fonts/
echo ">>> Done!"

# icon
if [ -d ~/.icons ]; then
    echo "~/.icons exists"
else
    mkdir -p -v ~/.icons
fi
echo -n "copy icons... "
cp -f -r $SCRIPT_DIR/icons/* ~/.icons/
echo "Done"

# theme
if [ -d ~/.themes ]; then
    echo "~/.themes exists"
else
    mkdir -p -v ~/.themes
fi
echo -n "copy themes... "
cp -f -r $SCRIPT_DIR/themes/* ~/.themes/
echo "Done"

# wallpaper
if [ -d ~/Pictures ]; then
    echo "~/Pictures exists"
else
    mkdir -p -v ~/Pictures
fi
echo "copy wallpaper... "
cp -f -v $SCRIPT_DIR/wallpaper.png ~/Pictures
echo ">>> Done!"

# package update & upgrade
echo "=========================="
echo " Packages will be updated"
echo "=========================="
sudo apt update
sudo apt upgrade -y

# tmux
echo "========================"
echo " tmux will be installed"
echo "========================"
sudo apt install tmux -y

# vim
echo "======================="
echo " vim will be installed"
echo "======================="
sudo apt install vim -y

# neovim
echo "=========================="
echo " neovim will be installed"
echo "=========================="
sudo apt install neovim -y

# gnome-shell
echo "==============================="
echo " gnome-shell will be installed"
echo "==============================="
sudo apt install chrome-gnome-shell -y

# gnome-tweaks
echo "================================"
echo " gnome-tweaks will be installed"
echo "================================"
sudo apt install gnome-tweaks -y

# mozc utils
echo "=============================="
echo " mozc-utils will be installed"
echo "=============================="
sudo apt install mozc-utils-gui -y

# curl
echo "========================"
echo " curl will be installed"
echo "========================"
sudo apt install curl -y

# zsh
echo "======================="
echo " zsh will be installed"
echo "======================="
sudo apt install zsh -y
echo "============================="
echo " The shell is changed to zsh"
echo "============================="
chsh -s /bin/zsh

# oh-my-zsh
echo "============================="
echo " oh-my-zsh will be installed"
echo "============================="
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cat $SCRIPT_DIR/zshrc_template > ~/.zshrc

# powerlevel10k
echo "================================="
echo " powerlevel10k will be installed"
echo "================================="
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


echo "==="
echo "you can change your shell to zsh if you reboot"
echo "==="
