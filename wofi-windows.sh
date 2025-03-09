#!/usr/bin/bash
hyprctl clients -j | jq -r '.[] | "\(.title) - \(.class) [\(.workspace.name)]"' | wofi --show dmenu | sed 's/.*\[//' | sed 's/\]//' | xargs -I{} hyprctl dispatch workspace {}

