# Automatic setup script for Ubuntu

I run this script on a fresh install of Ubuntu, so that it sets everything up for me and I am ready to work..

When executed, it installs:

- tmux
- vim
- neovim
- zsh
- prerequisites of Gnome shell extensionos
- curl
- Mozc setting

copys:

- fonts
- icons
- themes
- wallpaper

## Environment
- Ubuntu

## Installation
```
sudo apt update
sudo apt upgrade
sudo apt install git
git clone https://github.com/ToshikiNakamura0412/my_ubuntu_setup.git
cd my_ubuntu_setup
./setup1.sh
sudo reboot
./setup2.sh
sudo apt update
sudo apt upgrade
```

## Setting
- Mouse & Touchpad
- Keyboard Shortcuts
- Region & Language

## Keyboard
Changed keyboard layout from English to Japanese
```
sudo dpkg-reconfigure keyboard-configuration
```
- Generic 105-key (Intel) PC
- Japanese
- Japanese
- The default for the keyboard layout
- No compose key
- No
```
sudo vim /usr/share/ibus/component/mozc.xml
```
`<layout>default</layout>` ---> `<layout>default</layout>`
```
sudo reboot
```

## Gnome shell extensions
visit https://extensions.gnome.org and install browser extensions

enable the following features
- User Themes
- Dash to Panel
- ArcMenu (by andrew.zaech)

launch Tweaks and set:
- Fonts (Monospace Regular 15)
- Appearance (application, icon and wallpaper)

set Dash-to-Panel and ArcMenu

## oh my zsh
set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`
```
source ~/.zshrc
```
comment out L50 (`command_execution_time`) in `~/.p10k.zsh
