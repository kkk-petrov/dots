#!/bin/bash

ALACRITTY_MAIN_CONFIG="$HOME/.config/alacritty/alacritty.toml"
ALACRITTY_THEME_CURRENT="$HOME/.config/alacritty/theme.toml"
ALACRITTY_THEME_LIGHT="$HOME/.config/alacritty/themes/light.toml"
ALACRITTY_THEME_DARK="$HOME/.config/alacritty/themes/dark.toml"
WAYBAR="$HOME/.config/waybar/style.css"
WAYBAR_BACKGROUND_DARK="@background"
WAYBAR_BACKGROUND_DARK_ALT="@background-alt"
WAYBAR_PRIMARY_DARK="@primary"
WAYBAR_BACKGROUND_LIGHT="@background-light"
WAYBAR_BACKGROUND_LIGHT_ALT="@background-light-alt"
WAYBAR_PRIMARY_LIGHT="@primary-light"
VIMRC="$HOME/.vimrc"
NVIM_THEME_DARK="tokyonight-night"
NVIM_THEME_LIGHT="tokyonight-day"
WALLPAPER_DARK="$HOME/Wallpapers/wallpaper3.jpg"
WALLPAPER_LIGHT="$HOME/Wallpapers/wallpaper2.jpg"
WALLPAPER_TRANSITION_TYPE="--transition-type random"
WALLPAPER_TRANSITION_FPS="--transition-fps 30"
WALLPAPER_TRANSITION_POS="--transition-pos 0.154,0.176"
WALLPAPER_TRANSITION_STEP="--transition-step 200"

set_current_theme() {
	if cat $ALACRITTY_THEME_CURRENT | grep "dark"; then
		current_theme="dark"
	else
		current_theme="light"
	fi
}

main() {
	set_current_theme
	toggle_wallpaper
	toggle_alacritty_theme
	toggle_waybar_theme
	toggle_nvim_theme
}

toggle_waybar_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s/${WAYBAR_PRIMARY_LIGHT}/${WAYBAR_PRIMARY_DARK}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_LIGHT}/${WAYBAR_BACKGROUND_DARK}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_LIGHT_ALT}/${WAYBAR_BACKGROUND_DARK_ALT}/gI" $WAYBAR
		reload_waybar
	else
		sed -i "s/${WAYBAR_PRIMARY_DARK}/${WAYBAR_PRIMARY_LIGHT}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_DARK}/${WAYBAR_BACKGROUND_LIGHT}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_DARK_ALT}/${WAYBAR_BACKGROUND_LIGHT_ALT}/gI" $WAYBAR
		reload_waybar
	fi
}

toggle_nvim_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s/${NVIM_THEME_LIGHT}/${NVIM_THEME_DARK}/gI" $VIMRC
	else
		sed -i "s/${NVIM_THEME_DARK}/${NVIM_THEME_LIGHT}/gI" $VIMRC
	fi

	touch $VIMRC
}

toggle_wallpaper() {
	if [[ $current_theme == "dark" ]]; then
		swww img $WALLPAPER_LIGHT
	else
		swww img $WALLPAPER_DARK
	fi
}

reload_waybar() {
	killall waybar
	waybar &
}

toggle_alacritty_theme() {
	if [[ $current_theme == "dark" ]]; then
		echo "import = [\"${ALACRITTY_THEME_LIGHT}\"]" >"$ALACRITTY_THEME_CURRENT"
		current_theme="light"
	else
		echo "import = [\"${ALACRITTY_THEME_DARK}\"]" >"$ALACRITTY_THEME_CURRENT"
		current_theme="dark"
	fi

	touch "$ALACRITTY_MAIN_CONFIG"
}

main
