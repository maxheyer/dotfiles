#!/bin/env bash

mkdir -p ~/.i3
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/rofi
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua/maxheyer
mkdir -p ~/.config/nvim/polybar

ln -s ~/.dotfiles/.i3/config ~/.i3/config
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/.config/rofi/config ~/.config/rofi/config
ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/.config/nvim/lua/maxheyer/init.lua ~/.config/nvim/lua/maxheyer/init.lua
ln -s ~/.dotfiles/.config/polybar/config ~/.config/polybar/config
ln -s ~/.dotfiles/.config/polybar/launch.sh ~/.config/polybar/launch.sh
ln -s ~/.dotfiles/.config/picom.conf ~/.config/picom.conf
