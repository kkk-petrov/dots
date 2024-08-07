#!/bin/bash
PROFILE_DIR=~/.mozilla/firefox

if [ -d "$PROFILE_DIR" ]; then
  PROFILE_INI="$PROFILE_DIR/profiles.ini"
  
  if [ -f "$PROFILE_INI" ]; then
    DEFAULT_PROFILE=$(grep -m1 'Default=' "$PROFILE_INI" | cut -d'=' -f2)
    
    if [ -n "$DEFAULT_PROFILE" ]; then
      FIREFOX_PROFILE_PATH="$PROFILE_DIR/$DEFAULT_PROFILE"
    fi
  fi
fi

ln -sf $(realpath .zshrc) ~/.zshrc
ln -sf $(realpath .zshenv) ~/.zshenv
ln -sf $(realpath ./.config/btop) ~/.config/btop
ln -sf $(realpath ./.config/eww) ~/.config/eww
ln -sf $(realpath ./.config/helix) ~/.config/helix
ln -sf $(realpath ./.config/hypr) ~/.config/hypr
ln -sf $(realpath ./.config/noti) ~/.config/noti
ln -sf $(realpath ./.config/nvim) ~/.config/nvim
ln -sf $(realpath ./.config/rofi) ~/.config/rofi
ln -sf $(realpath ./.config/waybar) ~/.config/waybar
ln -sf $(realpath ./.config/WebCord) ~/.config/WebCord
ln -sf $(realpath ./.config/wezterm) ~/.config/wezterm
ln -sf $(realpath ./firefox) $FIREFOX_PROFILE_PATH/chrome
