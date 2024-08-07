#!/bin/sh

# NOTE: kb is https://github.com/JarKz/hyprland_kb_switcher/
# but you can just use `hyprctl switchxkblayout your-keyboard-name next`
kb switch 

value=$(hyprctl devices | grep -i $keyboard -A 2 | tail -n1 | cut -f3,4 -d' ')

dunstify -a "kb" -u low -i ../icons/kb.svg -t 2000 -r 9995 "$value"
