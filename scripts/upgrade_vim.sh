#!/bin/sh

# vim
echo "======================="
echo " vim will be installed"
echo "======================="
sudo apt install vim -y
echo "======================="
echo " vim will be updated"
echo "======================="
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt upgrade -y
echo ">>> Done"
echo ""
