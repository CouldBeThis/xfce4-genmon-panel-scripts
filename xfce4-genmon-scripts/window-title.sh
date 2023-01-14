#!/usr/bin/env bash

## genmon script for displaying the active window title on the panel

MaxLength="65"

## truncating active window title
WindowTitle=$(xdotool getactivewindow getwindowname | cut -c -$MaxLength)
NumberOfOpenedWindows=$(wmctrl -l | wc -l)
LengthOfTitle=$(echo ${WindowTitle})

Info="<txt>"
Info+="<span weight='Regular' fgcolor='grey'>"
Info+="${WindowTitle}"
if [ "${LengthOfTitle}" -eq $MaxLength ]; then
    Info+="..."
fi
Info+="</span>"
Info+="</txt>"

echo -e "${Info}"

MoreInfo="<tool>"
## to hide the tooltip
MoreInfo+="${NULL_VALUE}"
MoreInfo+="</tool>"

echo -e "${MoreInfo}"
