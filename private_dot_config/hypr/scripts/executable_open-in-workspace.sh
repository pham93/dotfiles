hyprctl dispatch exec "$1"

isChrome=$(hyprctl activewindow -j | jq '.title | contains("'$2'")')

while [ "$isChrome" != "true" ]; do
	isChrome=$(hyprctl activewindow -j | jq '.title | contains("'$2'")')
done
hyprctl dispatch movetoworkspace $3
