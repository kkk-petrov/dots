#!/bin/bash
colorscheme="$1" # dark/light

gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
gsettings set org.gnome.desktop.interface font-name 'JetBrains Mono 12'
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-$colorscheme"
gsettings set org.gnome.desktop.interface color-scheme "prefer-$colorscheme"
