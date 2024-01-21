#!/bin/bash

case $1 in
up)
	pamixer -i 5 -u
	dunstify -a "changevolume" -u low -i audio-volume-high -r 9876 -h "int:value:$(pamixer --get-volume)" "Volume: $(pamixer --get-volume)%"
	;;
down)
	pamixer -d 5 -u
	dunstify -a "changeVolume" -u low -i audio-volume-low -r 9876 -h "int:value:$(pamixer --get-volume)" "Volume: $(pamixer --get-volume)%"
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -a "changevolume" -u low -i audio-volume-muted -r 9876 "Volume muted"
	else
		dunstify -a "changevolume" -u low -i audio-volume-high -r 9876 "Volume unmuted"
	fi
	;;
esac
