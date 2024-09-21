#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script is in bash (not posix shell), because the RANDOM variable
# we use is not defined in posix
declare -A paths

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=90

# Populate the associative array
while IFS= read -r file; do
    filename=$(basename "$file" | awk -F. '{print $1}')
    paths["$filename"]="$file"
done < <(find "$1" -type f)

# Show file names to the user with tofi
selected=$(printf "%s\n" "${!paths[@]}" | tofi --prompt-text "Wallpaper:")

# Get the full path from the selected filename
img=${paths["$selected"]}
# img=$(find $1 -type f | awk -F/ '{split($NF, a, "."); print a[1]}' | tofi --prompt-text "Wallpaper:")

swww img --transition-type outer --transition-pos 0.99,0.99 "$img"
