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
        zsh
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
    change_shell_to_zsh

    echo ""
    echo -e "Please \e[33mreboot\e[0m your system to apply the changes"
}

main
