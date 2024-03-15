#!/bin/bash
THEME_DIR=/usr/share/themes

function set_theme {
	local selected_theme="$1"
	local gtk4_config_dir=${HOME}/.config/gtk-4.0
	local theme_loc=${THEME_DIR}/${selected_theme}
	set -x
	mkdir -p "${HOME}/.config/gtk-4.0"
	if [ -d "$theme_loc/gtk-4.0/assets" ]; then
		ln -sfn $theme_loc/gtk-4.0/assets ${HOME}/.config/gtk-4.0/assets
	elif [ -d "$theme_loc/assets" ]; then
		ln -sfn ${theme_loc}/assets ${HOME}/.config/assets
	else
		echo "not in a known structure"
	fi
	ln -sf ${theme_loc}/gtk-4.0/gtk.css ${HOME}/.config/gtk-4.0/gtk.css
	ln -sf ${theme_loc}/gtk-4.0/gtk-dark.css ${HOME}/.config/gtk-4.0/gtk-dark.css
	set +x

	ls -la --color ${HOME}/.config/gtk-4.0

	local theme_name=$(get_theme_name $selected_theme)
	set -x
	gsettings set org.gnome.desktop.interface gtk-theme "$selected_theme"
	dconf write /org/gnome/shell/extensions/user-theme/name "'$selected_theme'"
	set +x
}

function get_theme_name {
	local selected_theme="$1"
	local theme_loc=${THEME_DIR}/$selected_theme
	local theme_content=$(<${theme_loc}/index.theme)
	local theme_name_line=$(echo "$theme_content" | grep "Name=")
	local theme_name=$(echo "$theme_name_line" | cut -d "=" -f 2 | awk '{$1=$1};1')
	echo "$theme_name"
}

echo "Theme Directory: ${THEME_DIR}"

folders=$(find ${THEME_DIR} -maxdepth 1 -type d -not -name ".")

themes=()

for folder in $folders; do
	if [ -d "$folder/gtk-4.0" ]; then
		folder_name=$(basename "$folder")
		themes+=("$folder_name")
	fi
done

PS3=$'\n'"Select gtk-4 theme:"$'\n'
select theme in "${themes[@]}" "quit"; do
	case $theme in
	"quit")
		echo "No option selected"
		break
		;;
	*)
		if [[ "${themes[@]}" =~ "$theme" ]]; then
			set_theme $theme
			break
		fi
		echo "Bro, this option is not valid"
		;;
	esac
done
