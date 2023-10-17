#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# neovim
echo "========================================"
echo " neovim will be installed and upgraded"
echo "========================================"
wget -O /tmp/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo chmod +x /tmp/nvim.appimage
sudo ln -sf /tmp/nvim.appimage /usr/bin/nvim
sudo apt install xsel -y --no-install-recommends
echo ">>> Done"
echo ""

