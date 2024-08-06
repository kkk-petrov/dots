#!/bin/sh

keyboard="at-translated-set-2-keyboard"

# hyprctl switchxkblayout $keyboard next
kb switch

value=$(hyprctl devices | grep -i $keyboard -A 2 | tail -n1 | cut -f3,4 -d' ')

dunstify -a "kb" -u low -i $HOME/.config/dunst/icons/kb.svg -t 2000 -r 9995 "$value"


