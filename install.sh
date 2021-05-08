#!/bin/bash

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua/maxheyer

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/.config/nvim/lua/maxheyer/init.lua ~/.config/nvim/lua/maxheyer/init.lua
