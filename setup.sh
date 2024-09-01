#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function hide_home_folder() {
    echo -n "hiding home folder in desktop... "
    gsettings set org.gnome.shell.extensions.desktop-icons show-home false
    echo "Done"
    echo ""
}

function copy_icons() {
    echo "copy icons... "
    if [[ ! -d ~/.icons ]]; then
        mkdir -pv ~/.icons
    fi
    cp -r ${SCRIPT_DIR}/icons/* ~/.icons/
    echo ">>> Done"
    echo ""
}

function copy_wallpaper() {
    if [[ ! -d ~/Pictures ]]; then
        mkdir -pv ~/Pictures
    fi
    if [[ ! -e ~/Pictures/wallpaper.png ]]; then
        echo "copy wallpaper... "
        cp -v ${SCRIPT_DIR}/images/wallpaper.png ~/Pictures/
        echo ">>> Done"
        echo ""
    fi
}

function install_docker() {
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    # Install:
    sudo apt install -y --no-install-recommends \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

    # Add user to docker group
    sudo gpasswd -a $USER docker
    sudo chmod 666 /var/run/docker.sock
}

function install_pkgs() {
    echo "========="
    echo " Install"
    echo "========="
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y --no-install-recommends \
        chrome-gnome-shell \
        gnome-tweaks \
        mozc-utils-gui \
        curl \
        zsh \
        htop \
        simplescreenrecorder \
        openssh-server \
        make \
        tree
    install_docker
    echo ">>> Done"
    echo ""
}

function clone_reposiotries() {
    echo "===================="
    echo " Clone repositories"
    echo "===================="
    if [[ ! -d ~/dotfiles ]]; then
        git clone --recursive https://github.com/ToshikiNakamura0412/dotfiles.git ~/dotfiles
    fi
    if [[ ! -d ~/dockerfiles ]]; then
        git clone https://github.com/ToshikiNakamura0412/dockerfiles.git ~/dockerfiles
    fi
    echo ">>> Done"
    echo ""
}

function change_shell_to_zsh() {
    echo "====================="
    echo " Change shell to zsh"
    echo "====================="
    chsh -s /bin/zsh
    echo ">>> Done"
    echo ""
}

function main() {
    if [[ -e /etc/os-release ]]; then
        source /etc/os-release
    else
        echo "This OS is not supported."
        exit 1
    fi

    if [[ $VERSION_ID == "20.04" ]]; then
        hide_home_folder
    fi
    copy_icons
    copy_wallpaper
    install_pkgs
    clone_reposiotries
    change_shell_to_zsh

    echo ""
    echo -e "Please \e[33mreboot\e[0m your system to apply the changes"
}

main
