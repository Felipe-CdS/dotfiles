#!/bin/bash

# Terminate any running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polibar/config
polybar mainbar &
echo "Polybar done..."
