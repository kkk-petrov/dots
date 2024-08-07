#!/bin/bash
VOL_UP="../icons/volup.svg"
VOL_DOWN="../icons/voldown.svg"
VOL_MUTE="../icons/volmute.svg"

case $1 in
up)
	pamixer -i 5 -u
	dunstify -a "volume" -u low -i $VOL_UP -r 9999 -h "int:value:$(pamixer --get-volume)" "Volume: $(pamixer --get-volume)%"
	;;
down)
	pamixer -d 5 -u
  dunstify -a "volume" -u low -i $VOL_DOWN -r 9999 -h "int:value:$(pamixer --get-volume)" "Volume: $(pamixer --get-volume)%"
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -a "volume" -u low -i $VOL_MUTE -r 9999 "Volume muted"
	else
		dunstify -a "volume" -u low -i $VOL_UP -r 9999 "Volume unmuted"
	fi
	;;
esac
