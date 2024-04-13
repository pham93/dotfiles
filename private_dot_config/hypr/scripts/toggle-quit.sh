!# /usr/bin/bash
command=$1

active=$(hyprctl activewindow -j | jq '.class | contains("'$2'")')
hyprctl dispatch exec "$1"
