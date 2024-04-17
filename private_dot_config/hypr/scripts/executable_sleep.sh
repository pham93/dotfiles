#!/bin/bash

swayidle -w \
	timeout 600 'hyprctl dispatch dpms off' \
	timeout 900 'swaylock' \
	timeout 1800 'loginctl suspend' \
	resume 'hyprctl dispatch dpms on' \
	before-sleep 'swaylock'
