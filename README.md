# Automatic setup script for Ubuntu

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


## Environment
Ubuntu

## Advance preparation
**Change the language of the home directory to English**
```bash
LANG=C xdg-user-dirs-gtk-update
```
Install git
```bash
sudo apt update && sudo apt install -y --no-install-recommends git
```

## Installation
```bash
git clone --depth=1 https://github.com/ToshikiNakamura0412/my_ubuntu_setup.git ~/my_ubuntu_setup
~/my_ubuntu_setup/setup.sh
sudo reboot
```

#### Install
Refer to functions `install_pkgs` in [setup.sh](setup.sh)

#### Copy
- theme (Cursor)
- wallpaper

#### Hide
- home folder in desktop (Ubuntu 20.04)

#### Clone
- [dotfiles](https://github.com/ToshikiNakamura0412/dotfiles.git)
- [dockerfiles](https://github.com/ToshikiNakamura0412/dockerfiles.git)

## Setup
### Settings
- Background
- Mouse & Touchpad
- Keyboard Shortcuts

### Gnome shell extensions
Visit https://extensions.gnome.org and install Gnome extensions

Enable the following extensions
- Dash to Panel
- ArcMenu (by andrew.zaech)
- WinTile: Windows 10 window tiling for GNOME

Launch Tweaks and set
- Appearance (Cursor)

Set Dash-to-Panel and ArcMenu

### Others
- [dotfiles](https://github.com/ToshikiNakamura0412/dotfiles.git)
- [dockerfiles](https://github.com/ToshikiNakamura0412/dockerfiles.git)
