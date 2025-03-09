#!/usr/bin/bash

# Check if wofi is already running
if pgrep -x "wofi" > /dev/null; then
    pkill -x "wofi"
else
    # List windows and switch to the selected workspace
    hyprctl clients -j | jq -r '.[] | "\(.title) - \(.class) [\(.workspace.name)]"' | \
    wofi --show dmenu | \
    sed 's/.*\[//' | sed 's/\]//' | \
    xargs -I{} hyprctl dispatch workspace {}
fi

