#!/usr/bin/env bash

## genmon script to list desktops

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
## find the optimum number of opened up windows at startup. I've set 3 since its XFCE4-Panel, Plank and Desktop.
if [ "${NumberOfOpenedWindows}" -gt 3 ]; then
Info+="<txtclick>
	rofi -combi-modi window
	-theme sidetab
	-show window
	-icon-theme "Papirus"
	-show-icons
</txtclick>"
fi
echo -e "${Info}"

MoreInfo="<tool>"
## to hide the tooltip
MoreInfo+="${NULL_VALUE}"
MoreInfo+="</tool>"

echo -e "${MoreInfo}"
