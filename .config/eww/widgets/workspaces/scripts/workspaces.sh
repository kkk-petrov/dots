#!/bin/sh

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  hyprctl -j workspaces | jq --raw-output -cM 'map(select(.name | startswith("special") | not)) | sort_by(.id)'
done
