#!/bin/bash

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/picom
mkdir -p ~/.config/rofi
mkdir -p ~/.config/phpactor
mkdir -p ~/.i3
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/dunst

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

ln -s ~/.dotfiles/.i3/config ~/.i3/config
ln -s ~/.dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
ln -s ~/.dotfiles/.config/polybar ~/.config/polybar
ln -s ~/.dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s ~/.dotfiles/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc

ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.dotfiles/.config/mpv ~/.config/mpv

ln -s ~/.dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/.dotfiles/.config/nvim/lua ~/.config/nvim/lua
ln -s ~/.dotfiles/.config/phpactor ~/.config/phpactor
