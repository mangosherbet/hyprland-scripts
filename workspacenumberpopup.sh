#!/bin/bash

# Monitor Hyprland events for workspace changes
hyprctl monitor all -j | socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  # Check if the event is a workspace change
  if echo "$line" | grep -q 'workspace>>'; then
    # Extract the workspace name
    WORKSPACE_NAME=$(echo "$line" | awk -F'>>' '{print $2}')
    
    # Show a popup notification
    notify-send "Workspace Changed" "You are now on workspace: $WORKSPACE_NAME"
  fi
done


