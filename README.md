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
- CHC-E (Custom Hot Corners - Extended)
- Sound Input & Output Device Chooser

Set Dash-to-Panel and ArcMenu

### Tweaks
- Appearance (Cursor)
- Set 'Caps Lock' to 'Ctrl' (Caps Lock behavior)

### Terminal
- Set color theme ([image](images/terminal_color_theme.png))

### Mozc
- Set up like macOS ([link](https://magidropack.hatenablog.com/entry/2018/11/30/120602))
  - Press the 'Input Key' button at the top to sort

### Others
- [dotfiles](https://github.com/ToshikiNakamura0412/dotfiles.git)
- [dockerfiles](https://github.com/ToshikiNakamura0412/dockerfiles.git)
- deb packages (e.g. [Google Chrome](https://www.google.com/chrome/?platform=linux), [Slack](https://slack.com/intl/ja-jp/downloads/linux), [Zoom](https://zoom.us/download?os=linux), [VSCode](https://code.visualstudio.com/download), [TeamViewer (full client)](https://www.teamviewer.com/ja/download/linux/))
- GitHub
  - user name, email
  - SSH key
- Nvidia driver ([link](https://qiita.com/tf63/items/0c6da72fe749319423b4))
