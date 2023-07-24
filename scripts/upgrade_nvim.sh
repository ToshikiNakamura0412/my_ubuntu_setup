#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# neovim
echo "========================================"
echo " neovim will be installed and upgraded"
echo "========================================"
sudo apt purge neovim
if [ -d /nvim-linux64 ]; then
    echo "/nvim-linux64 exists"
    rm -rf /nvim-linux64
    echo "remove /nvim-linux64"
fi
if [ -e ~/nvim-linux64.tar.gz ]; then
    echo "~/nvim-linux64.tar.gz exists"
    rm ~/nvim-linux64.tar.gz
    echo "remove ~/nvim-linux64.tar.gz"
fi
cd ~/
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
rm ~/nvim-linux64.tar.gz
sudo mv nvim-linux64 /
sudo ln -sf /nvim-linux64/bin/nvim  /usr/bin/nvim
echo ">>> Done"
echo ""

