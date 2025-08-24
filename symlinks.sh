#!/bin/bash
set -euo pipefail

SOURCE="$HOME/.dotfiles/configs"
TARGET="$HOME/.config"

mkdir -p "$TARGET"

for item in "$SOURCE"/*; do
	name=$(basename "$item")
	dest="$TARGET/$name"

	# Remove existing symlink or dir if it exists
	if [ -L "$dest" ]; then
		echo "Removing old symlink: $dest"
		rm "$dest"
	elif [ -d "$dest" ]; then
		echo "Backing up existing directory: $dest -> ${dest}.backup"
		mv "$dest" "${dest}.backup"
	elif [ -f "$dest" ]; then
		echo "Backing up existing file: $dest -> ${dest}.backup"
		mv "$dest" "${dest}.backup"
	fi

	echo "Linking $item -> $dest"
	ln -s "$item" "$dest"
done
