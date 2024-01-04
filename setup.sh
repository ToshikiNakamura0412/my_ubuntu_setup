#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# hide home folder
echo -n "hiding home folder in desktop... "
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
echo "Done"
echo ""

# font
echo "=============================="
echo " nerd-fonts will be installed"
echo "=============================="
if [ ! -d ~/.local/share/fonts ]; then
    mkdir -p -v ~/.local/share/fonts
fi
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
echo ">>> Done"
echo ""

# package update & upgrade
echo "=========================="
echo " Packages will be updated"
echo "=========================="
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt upgrade -y
echo ">>> Done"
echo ""

# tmux
echo "========================"
echo " tmux will be installed"
echo "========================"
sudo apt install tmux -y --no-install-recommends
echo ">>> Done"
echo ""

# neovim
$SCRIPT_DIR/scripts/upgrade_nvim.sh

# gnome-shell
echo "==============================="
echo " gnome-shell will be installed"
echo "==============================="
sudo apt install chrome-gnome-shell -y --no-install-recommends
echo ">>> Done"
echo ""

# gnome-tweaks
echo "================================"
echo " gnome-tweaks will be installed"
echo "================================"
sudo apt install gnome-tweaks -y --no-install-recommends
echo ">>> Done"
echo ""

# mozc utils
echo "=============================="
echo " mozc-utils will be installed"
echo "=============================="
sudo apt install mozc-utils-gui -y --no-install-recommends
echo ">>> Done"
echo ""

# curl
echo "========================"
echo " curl will be installed"
echo "========================"
sudo apt install curl -y --no-install-recommends
echo ">>> Done"
echo ""

# zsh
echo "======================="
echo " zsh will be installed"
echo "======================="
sudo apt install zsh -y --no-install-recommends
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
cp -f -v $SCRIPT_DIR/scripts/zshrc_template ~/.zshrc
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
