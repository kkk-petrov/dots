#!/bin/bash

# Dotfiles directory
DOTFILES_DIR="$HOME/repos/dots-local"

backup_dotfiles() {
	echo "Backing up existing dotfiles..."
	today=$(date +"%Y%m%d%H%M%S")
	mkdir -p $HOME/dotfiles_backup/$today

	# Copy dotfiles from DOTFILES_DIR to backup directory
	find $DOTFILES_DIR -maxdepth 1 -type f -exec sh -c '
        file="$0"
        filename=$(basename "$file")
        if [ -f "$HOME/$filename" ]; then
            cp "$HOME/$filename" "$HOME/dotfiles_backup/$today/"
        fi
    ' {} \;

	# Copy dotfiles from DOTFILES_DIR subdirectories to backup directory
	find $DOTFILES_DIR -mindepth 1 -maxdepth 1 -type d -exec sh -c '
        subdir="$0"
        find "$subdir" -maxdepth 1 -type f -exec sh -c '
	file="$0"
	filename=$(basename "$file")
	if [ -f "$HOME/.config/$filename" ]; then
		mkdir -p "$HOME/dotfiles_backup/$today/.config"
		cp "$HOME/.config/$filename" "$HOME/dotfiles_backup/$today/.config/"
	fi
	' {} \;
    ' {} \;

	echo "Backup complete."
}

install_dotfiles() {
	echo "Installing dotfiles..."
	rsync -av --exclude='.git' --exclude='install.sh' $DOTFILES_DIR/ $HOME/
	echo "Dotfiles installed successfully."
}

main() {
	echo "Dotfiles Install Script"

	if [ ! -d "$DOTFILES_DIR" ]; then
		echo "Error: Dotfiles directory not found. Exiting."
		exit 1
	fi

	backup_dotfiles
	install_dotfiles

	echo "Dotfiles installation complete."
}

main
