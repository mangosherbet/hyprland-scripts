#!/usr/bin/bash
current_time=$(date "+%I:%M %p")
hyprctl notify 2 5000 "rgb(255,255,255)" "Current time: $current_time"
