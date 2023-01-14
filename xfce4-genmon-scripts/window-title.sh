#!/usr/bin/env bash

## genmon script for displaying the active window title on the panel

## truncating active window title after 60chars
WindowTite=$(xdotool getactivewindow getwindowname | cut -c -65)
NumberOfOpenedWindows=$(wmctrl -l | wc -l)
LengthOfTitle=$(echo ${WindowTite})

Info="<txt>"
Info+="<span weight='Regular' fgcolor='grey'>"
Info+="${WindowTite}"
if [ "${LengthOfTitle}" -eq 65 ]; then
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
