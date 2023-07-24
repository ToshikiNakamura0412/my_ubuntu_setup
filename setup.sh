#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# hide home folder
echo -n "hiding home folder in desktop... "
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
echo "Done"
echo ""

# font
if [ ! -d ~/.fonts ]; then
    mkdir -v ~/.fonts
fi
echo "copy fonts... "
cp -f -v $SCRIPT_DIR/fonts/* ~/.fonts/
echo ">>> Done"
echo ""

# icon
if [ ! -d ~/.icons ]; then
    mkdir -v ~/.icons
fi
echo -n "copy icons... "
cp -f -r $SCRIPT_DIR/icons/* ~/.icons/
echo ">>> Done"
echo ""

# theme
if [ ! -d ~/.themes ]; then
    mkdir -v ~/.themes
fi
echo -n "copy themes... "
cp -f -r $SCRIPT_DIR/themes/* ~/.themes/
echo ">>> Done"
echo ""

# package update & upgrade
echo "=========================="
echo " Packages will be updated"
echo "=========================="
sudo apt update
sudo apt upgrade -y
echo ">>> Done"
echo ""

# tmux
echo "========================"
echo " tmux will be installed"
echo "========================"
sudo apt install tmux -y
echo ">>> Done"
echo ""

# vim
cd $SCRIPT_DIR/scripts && ./upgrade_vim.sh

# neovim
cd $SCRIPT_DIR/scripts && ./upgrade_nvim.sh

# gnome-shell
echo "==============================="
echo " gnome-shell will be installed"
echo "==============================="
sudo apt install chrome-gnome-shell -y
echo ">>> Done"
echo ""

# gnome-tweaks
echo "================================"
echo " gnome-tweaks will be installed"
echo "================================"
sudo apt install gnome-tweaks -y
echo ">>> Done"
echo ""

# mozc utils
echo "=============================="
echo " mozc-utils will be installed"
echo "=============================="
sudo apt install mozc-utils-gui -y
echo ">>> Done"
echo ""

# curl
echo "========================"
echo " curl will be installed"
echo "========================"
sudo apt install curl -y
echo ">>> Done"
echo ""

# zsh
echo "======================="
echo " zsh will be installed"
echo "======================="
sudo apt install zsh -y
echo "============================="
echo " The shell is changed to zsh"
echo "============================="
chsh -s /bin/zsh
echo ">>> Done"
echo ""

# oh-my-zsh
echo "============================="
echo " oh-my-zsh will be installed"
echo "============================="
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
if [ ! -d ~/backup ]; then
    mkdir -v ~/backup
fi
cp ~/.zshrc ~/backup/zshrc_default
cat $SCRIPT_DIR/zshrc_template > ~/.zshrc
echo ">>> Done"
echo ""

# powerlevel10k
echo "================================="
echo " powerlevel10k will be installed"
echo "================================="
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo ">>> Done"
echo ""

# fzf
echo "======================="
echo " fzf will be installed"
echo "======================="
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo ">>> Done"
echo ""

# zsh-syntax-highlighting
echo "==========================================="
echo " zsh-syntax-highlighting will be installed"
echo "==========================================="
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo ">>> Done"
echo ""

# zsh-autosuggestions
echo "======================================="
echo " zsh-autosuggestions will be installed"
echo "======================================="
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo ">>> Done"
echo ""


echo "==="
echo "you can change your shell to zsh if you reboot"
echo "==="
