#!/bin/bash

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.zshrc ~/.zshrc

ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/.dotfiles/.config/nvim/lua ~/.config/nvim/lua
ln -s ~/.dotfiles/.config/phpactor ~/.config/phpactor
