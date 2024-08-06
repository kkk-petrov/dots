#!/bin/bash

case $1 in
up)
	brightnessctl s +10%
	brightness=$(brightnessctl g)
	percentage=$(echo "scale=0; $brightness * 100 / 1515" | bc -l)
  echo percentage
	rounded_percentage=$(echo "($percentage + 5) / 10 * 10" | bc)
  echo rounded_percentage
	dunstify -a "brightness" -u low -i $HOME/.config/dunst/icons/light.svg -r 9997 -h "int:value:$rounded_percentage" "Brightness: $rounded_percentage%"
	;;
down)
	brightnessctl s 10%-
	brightness=$(brightnessctl g)
	percentage=$(echo "scale=0; $brightness * 100 / 1515" | bc -l)
  echo percentage
	rounded_percentage=$(echo "($percentage + 5) / 10 * 10" | bc)
  echo rounded_percentage
	dunstify -a "brightness" -u low -i $HOME/.config/dunst/icons/light.svg -r 9997 -h "int:value:$rounded_percentage" "Brightness: $rounded_percentage%"
	;;
esac
