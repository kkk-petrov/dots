#!/bin/bash

ALACRITTY_THEME_CURRENT="$HOME/.config/alacritty/theme.toml"
WALLPAPER_DARK="$HOME/Wallpapers/wallpaper3.jpg"
WALLPAPER_LIGHT="$HOME/Wallpapers/wallpaper2.jpg"

if cat $ALACRITTY_THEME_CURRENT | grep "dark"; then
	swww img $WALLPAPER_DARK
else
	swww img $WALLPAPER_LIGHT
fi
