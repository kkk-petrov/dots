#!/bin/bash

files=("./style.css" "./config")

reload() {
	echo "Restarting waybar..."
	killall waybar
	waybar &
}

while true; do
	inotifywait -e modify "${files[@]}"
	reload
done
