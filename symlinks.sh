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

WALLPAPER_SOURCE="$HOME/.dotfiles/wallpapers"
WALLPAPER_TARGET="$HOME/Pictures/Wallpapers"
mkdir -p "$WALLPAPER_TARGET"

if [ -d "$WALLPAPER_SOURCE" ]; then
	for wallpaper in "$WALLPAPER_SOURCE"/*; do
		[ -e "$wallpaper" ] || continue
		name=$(basename "$wallpaper")
		dest="$WALLPAPER_TARGET/$name"

		# Remove existing symlink or file if it exists
		if [ -L "$dest" ]; then
			echo "Removing old wallpaper symlink: $dest"
			rm "$dest"
		elif [ -f "$dest" ]; then
			echo "Backing up existing wallpaper: $dest -> ${dest}.backup"
			mv "$dest" "${dest}.backup"
		fi

		echo "Linking wallpaper $wallpaper -> $dest"
		ln -s "$wallpaper" "$dest"
	done
else
	echo "No wallpapers directory found at $WALLPAPER_SOURCE"
fi
