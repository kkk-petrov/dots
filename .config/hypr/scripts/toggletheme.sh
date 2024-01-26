#!/bin/bash
ALACRITTY_MAIN_CONFIG="$HOME/.config/alacritty/alacritty.toml"
ALACRITTY_THEME_CURRENT="$HOME/.config/alacritty/theme.toml"
ALACRITTY_THEME_LIGHT="$HOME/.config/alacritty/themes/light.toml"
ALACRITTY_THEME_DARK="$HOME/.config/alacritty/themes/dark.toml"
WAYBAR="$HOME/.config/waybar/style.css"
WAYBAR_BACKGROUND_DARK="@background-dark"
WAYBAR_BACKGROUND_DARK_ALT="@background-dark-alt"
WAYBAR_PRIMARY_DARK="@primary-dark"
WAYBAR_BACKGROUND_LIGHT="@background-light"
WAYBAR_BACKGROUND_LIGHT_ALT="@background-light-alt"
WAYBAR_PRIMARY_LIGHT="@primary-light"
NVIM_THEME="$HOME/.config/nvim/lua/plugins/core.lua"
NVIM_THEME_DARK="tokyonight-night"
NVIM_THEME_LIGHT="tokyonight-day"
ROFI="$HOME/.config/rofi/config.rasi"
WALLPAPER_DARK="$HOME/Wallpapers/wallpaper3.jpg"
WALLPAPER_LIGHT="$HOME/Wallpapers/wallpaper2.jpg"
DUNSTRC="$HOME/.config/dunst/dunstrc"
DUNST_BACKGROUND_DARK='background = "#151C22"'
DUNST_BACKGROUND_LIGHT='background = "#C8C8C8"'
DUNST_FOREGROUND_DARK='foreground = "#99AEB3"'
DUNST_FOREGROUND_LIGHT='foreground = "#151C22"'
ICONS="$HOME/.config/dunst/icons"
ICON_DARK="DCDCDC"
ICON_LIGHT="151C22"
current_theme=""

main() {
	toggle_gtk_theme
	toggle_icons
	toggle_wallpaper
	toggle_waybar_theme
	toggle_alacritty_theme
	toggle_rofi_theme
	toggle_nvim_theme
	toggle_dunst_theme
}

toggle_gtk_theme() {
	if gsettings get org.gnome.desktop.interface gtk-theme | grep -q "dark"; then
		current_theme="light"
		gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-light'
		gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
	else
		current_theme="dark"
		gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
		gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	fi
}

toggle_alacritty_theme() {
	local theme
	if [[ $current_theme == "dark" ]]; then
		theme=$ALACRITTY_THEME_DARK
	else
		theme=$ALACRITTY_THEME_LIGHT
	fi

	echo "import = [\"${theme}\"]" >"$ALACRITTY_THEME_CURRENT"
	touch "$ALACRITTY_MAIN_CONFIG"
}

toggle_wallpaper() {
	local wallpaper

	if [[ $current_theme == "dark" ]]; then
		wallpaper=$WALLPAPER_DARK
	else
		wallpaper=$WALLPAPER_LIGHT
	fi
	swww img $wallpaper --transition-type center
}

toggle_nvim_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s/${NVIM_THEME_LIGHT}/${NVIM_THEME_DARK}/gI" $NVIM_THEME
	else
		sed -i "s/${NVIM_THEME_DARK}/${NVIM_THEME_LIGHT}/gI" $NVIM_THEME
	fi

	touch $NVIM_THEME
}

toggle_waybar_theme() {
	local primary="@primary-$current_theme"
	local background="@background-$current_theme"
	local background_alt="@background-${current_theme}-alt"

	sed -i "s/@primary-[a-z]*/$primary/gI" "$WAYBAR"
	sed -i "s/@background-[a-z]*-alt/$background_alt/gI" "$WAYBAR"
	sed -i "s/@background-[a-z]*/$background/gI" "$WAYBAR"

	reload_waybar
}

toggle_dunst_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s|${DUNST_BACKGROUND_LIGHT}|${DUNST_BACKGROUND_DARK}|g" "$DUNSTRC"
		sed -i "s|${DUNST_FOREGROUND_LIGHT}|${DUNST_FOREGROUND_DARK}|g" "$DUNSTRC"
	else
		sed -i "s|${DUNST_BACKGROUND_DARK}|${DUNST_BACKGROUND_LIGHT}|g" "$DUNSTRC"
		sed -i "s|${DUNST_FOREGROUND_DARK}|${DUNST_FOREGROUND_LIGHT}|g" "$DUNSTRC"
	fi

	touch $DUNSTRC
	reload_dunst &
	notify
}

toggle_rofi_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s/light/dark/g" "$ROFI"
	else
		sed -i "s/dark/light/g" "$ROFI"
	fi

	touch $ROFI
}

toggle_icons() {
	for file in $ICONS/*; do
		if [[ $current_theme == "dark" ]]; then
			sed -i "s/${ICON_LIGHT}/${ICON_DARK}/g" "$file"
		else
			sed -i "s/${ICON_DARK}/${ICON_LIGHT}/g" "$file"
		fi
		touch "$file"
	done
}

reload_waybar() {
	killall waybar
	waybar &
}

reload_dunst() {
	killall dunst
	dunst
}

notify() {
	dunstify -a "toggleTheme" -u low -i "${ICONS}/${current_theme}.svg" -r 9998 "Switched to ${current_theme}"
}

main
