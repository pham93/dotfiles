#! /bin/sh

function reload_gtk_theme {
  echo "reloading"
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}
wall=$1

#wall=$(find $HOME/.config/swww -type f -name "*.jpg" -o -name "*.png" -o -name "*.gif" | shuf -n 1)
#
#wall=$(swww query | awk '{split($0,item,","); print item[3]}' | awk '{split($0,item,":"); print item[3]}' | awk 'NR==1')

# wpg -A current -n --brt current 100 -s $wall
# swww img $wall --transition-type random

# wal -c
# wal -e -i $1
#
wpg -n -s $wall

