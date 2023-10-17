#!/bin/sh

# vim
echo "=============================="
echo " vim-tiny will be uninstalled"
echo "=============================="
sudo apt purge vim-tiny -y
echo "============================="
echo " vim-gnome will be installed"
echo "============================="
sudo apt install vim-gnome -y --no-install-recommends
echo "======================="
echo " vim will be updated"
echo "======================="
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt upgrade -y
echo ">>> Done"
echo ""
