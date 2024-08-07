#!/bin/bash
VOL_UP=$ICONS/volup.svg
VOL_DOWN=$ICONS/voldown.svg
VOL_MUTE=$ICONS/volmute.svg

case $1 in
up)
	pamixer -i 5 -u
	dunstify -a "volume" -u low -i $VOL_UP -r 9999 "Volume: $(pamixer --get-volume)%"
	;;
down)
	pamixer -d 5 -u
  dunstify -a "volume" -u low -i $VOL_DOWN -r 9999 "Volume: $(pamixer --get-volume)%"
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
