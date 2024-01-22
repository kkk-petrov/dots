#!/bin/bash

case $1 in
up)
	brightnessctl s +10%
	brightness=$(brightnessctl g)
	percentage=$(echo "scale=0; $brightness * 100 / 255" | bc -l)
	rounded_percentage=$(echo "($percentage + 5) / 10 * 10" | bc)
	dunstify -a "changeBrightness" -u low -i $HOME/.config/dunst/icons/light.svg -r 9997 -h "int:value:$rounded_percentage" "Brightness: $rounded_percentage%"
	;;
down)
	brightnessctl s 10%-
	brightness=$(brightnessctl g)
	percentage=$(echo "scale=0; $brightness * 100 / 255" | bc -l)
	rounded_percentage=$(echo "($percentage + 5) / 10 * 10" | bc)
	dunstify -a "changeBrightness" -u low -i $HOME/.config/dunst/icons/light.svg -r 9997 -h "int:value:$rounded_percentage" "Brightness: $rounded_percentage%"
	;;
esac
