#!/bin/bash

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/skhd
mkdir -p ~/.config/yabai

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim

ln -s ~/.dotfiles/.config/skhd/skhdrc ~/.config/skhd/skhdrc
ln -s ~/.dotfiles/.config/yabai/yabairc ~/.config/yabai/yabairc
