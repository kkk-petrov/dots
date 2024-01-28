#!/bin/bash
WALLPAPER_DARK="$HOME/Wallpapers/wallpaper3.jpg"
WALLPAPER_LIGHT="$HOME/Wallpapers/wallpaper2.jpg"
wallpaper=""

if gsettings get org.gnome.desktop.interface gtk-theme | grep -q "dark"; then
	wallpaper="${WALLPAPER_DARK}"
else
	wallpaper="${WALLPAPER_LIGHT}"
fi

# swww query
# if [ $? -eq 1 ]; then
# fi
#

# swww init
swww img $wallpaper
