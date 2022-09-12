# Automatic setup script for Ubuntu

I run this script on a fresh install of Ubuntu, so that it sets everything up for me and I am ready to work..

When executed, it installs:

- tmux
- vim
- neovim
- zsh (with oh-my-zsh and powerlevel10k theme)
- prerequisites of Gnome shell extensionos
- curl
- Mozc setting

copys:

- fonts
- icons
- themes
- wallpaper
## Environment
Ubuntu
## Installation
```
git clone --depth=1 https://github.com/ToshikiNakamura0412/my_ubuntu_setup.git ~/
cd ~/my_ubuntu_setup
./setup.sh
sudo reboot
```
Continue with the following settings
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
Visit https://extensions.gnome.org and install browser extensions

Enable the following extensions
- User Themes
- Dash to Panel
- ArcMenu (by andrew.zaech)

Launch Tweaks and set:
- Fonts (Monospace Regular 15)
- Appearance (application, icon and wallpaper)

Set Dash-to-Panel and ArcMenu
## oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`
```
source ~/.zshrc
```
Comment out L50 (`command_execution_time`) in `~/.p10k.zsh`
```
source ~/.zshrc
```
## dotfiles
Visit https://github.com/ToshikiNakamura0412/dotfiles.git and set dotfiles
