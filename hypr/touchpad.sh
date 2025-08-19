#!/bin/sh

STATE_FILE="/tmp/touchpad.state"

# Initialize state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "1" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" = "1" ]; then
    # Currently enabled, so disable it
    hyprctl keyword 'device[syna32b8:00-06cb:ce7d-touchpad]:enabled' false
    echo "0" > "$STATE_FILE"
    notify-send "Trackpad" "Disabled" -t 1500 --icon=input-touchpad
else
    # Currently disabled, so enable it
    hyprctl keyword 'device[syna32b8:00-06cb:ce7d-touchpad]:enabled' true
    echo "1" > "$STATE_FILE"
    notify-send "Trackpad" "Enabled" -t 1500 --icon=input-touchpad
fi

