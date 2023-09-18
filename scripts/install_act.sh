#!/bin/sh

echo "======================="
echo " act will be installed"
echo "======================="
cd ~/
sudo curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
sudo mv -f ~/bin/act /usr/bin/
sudo rm -rf ~/bin
echo ">>> Done"
echo ""

