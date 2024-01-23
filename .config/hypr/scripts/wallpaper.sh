#!/bin/bash
WALLPAPER_DARK="$HOME/Wallpapers/wallpaper3.jpg"
WALLPAPER_LIGHT="$HOME/Wallpapers/wallpaper2.jpg"

if gsettings get org.gnome.desktop.interface gtk-theme | grep -q "dark"; then
	swww img $WALLPAPER_DARK
else
	swww img $WALLPAPER_LIGHT
fi
