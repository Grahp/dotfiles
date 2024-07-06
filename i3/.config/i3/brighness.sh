#!/bin/bash

adjustment=$1
percentage=$2

if [ "$adjustment" != "up" ] && [ "$adjustment" != "down" ] && [ "$adjustment" != "set" ]; then
  echo "Usage: $0 {up|down|set} {percentage}"
  exit 1
fi

if ! [[ "$percentage" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Percentage must be a number"
  exit 1
fi

# Convert percentage to decimal
percentage=$(awk "BEGIN {print $percentage / 100}")

# Get a list of connected outputs
outputs=$(xrandr | grep " connected " | awk '{print $1}')

# Loop through each connected output and adjust its brightness
for output in $outputs; do
  # Get the current brightness level
  current_brightness=$(xrandr --verbose | grep -A 5 "^$output" | grep 'Brightness' | awk '{print $2}')

  # Calculate the new brightness level
  if [ "$adjustment" == "up" ]; then
    new_brightness=$(awk "BEGIN {print $current_brightness + $percentage}")
  elif [ "$adjustment" == "down" ]; then
    new_brightness=$(awk "BEGIN {print $current_brightness - $percentage}")
  elif [ "$adjustment" == "set" ]; then
    new_brightness=$percentage
  fi

  # Ensure the brightness is within the range 0.0 to 1.0
  if (( $(awk "BEGIN {print ($new_brightness > 1.0)}") )); then
    new_brightness=1.0
  elif (( $(awk "BEGIN {print ($new_brightness < 0.1)}") )); then
    new_brightness=0.1
  fi

  # Set the new brightness level for the current output
  xrandr --output $output --brightness $new_brightness

  echo "Updated $output brightness to $new_brightness"
done
