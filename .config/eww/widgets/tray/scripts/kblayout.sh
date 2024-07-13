#!/bin/sh

keyboard="at-translated-set-2-keyboard"
value=$(hyprctl devices | grep -i "$keyboard" -A 2 | tail -n1 | cut -d' ' -f3,4)

case "$value" in
  "English (US)")
    echo "EN"
    ;;
  "Russian")
    echo "RU"
    ;;
  *)
    echo "UA"
    ;;
esac
