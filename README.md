# Automatic setup script for Ubuntu

I run this script on a fresh install of Ubuntu, so that it sets everything up for me and I am ready to work..

When executed, it installs:

- tmux
- vim
- neovim
- zsh (with oh-my-zsh and powerlevel10k theme)
- prerequisites of Gnome shell extensionos
- curl
- mozc utils

copys:

- fonts
- icons
- themes
- wallpaper

hides:

- home folder in desktop

## Environment
Ubuntu
## Installation
```
git clone --depth=1 https://github.com/ToshikiNakamura0412/my_ubuntu_setup.git ~/my_ubuntu_setup
cd ~/my_ubuntu_setup
./setup.sh
sudo reboot
```
Continue with the following settings
## oh-my-zsh (powerlevel10k theme)
Comment out L50 (`command_execution_time`) in `~/.p10k.zsh` after set theme
```
source ~/.zshrc
```
## Setting
- Background
- Mouse & Touchpad
- Keyboard Shortcuts
- Region & Language
- Date & Time
## Keyboard
Change keyboard layout from English to Japanese

Set the above (especially Language) before setting up the keyboard
```
sudo dpkg-reconfigure keyboard-configuration
```
- Generic 105-key PC (intl.)
- Japanese
- Japanese
- The default for the keyboard layout
- No compose key
- No
```
sudo vim /usr/share/ibus/component/mozc.xml
```
Set `<layout>jp</layout>`
```
sudo reboot
```
## Gnome shell extensions
Visit https://extensions.gnome.org and install Gnome extensions

Enable the following extensions
- User Themes
- Dash to Panel
- ArcMenu (by andrew.zaech)
- WinTile: Windows 10 window tiling for GNOME

Launch Tweaks and set:
- Startup Applications (Terminal)
- Fonts (MesloLGS NF Regular 13)
- Appearance (application and icon)

Set Dash-to-Panel and ArcMenu
## dotfiles
Visit https://github.com/ToshikiNakamura0412/dotfiles.git and set dotfiles
