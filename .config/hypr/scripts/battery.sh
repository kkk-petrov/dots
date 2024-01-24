#!/bin/bash
while true; do
	battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	if $battery_level -le 30; then
		dunstify -a "batteryLow" -u critical -i $HOME/.config/dunst/icons/batlow.svg -r 9996 "Battery low!"
	fi

	sleep 120
done
