#!/bin/bash
#
# # Завершить текущие экземпляры polybar
# killall -q polybar
#
# # Ожидание полного завершения работы процессов
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#
# # Запуск Polybar со стандартным расположением конфигурационного файла в ~/.config/polybar/config
# # polybar example &
# polybar pb &


#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c $(dirname $0)/config.ini &

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	polybar external -c $(dirname $0)/config.ini &
fi
