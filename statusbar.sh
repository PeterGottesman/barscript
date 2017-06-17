#!/bin/bash

separator()
{
    echo -n " ^fg()| "
}

fg()
{
    echo -n "^fg($1)"
}

bg()
{
    echo -n "^bg($1)"
}

align()
{
    echo -n "^p($1)"
}

workspaces()
{
    for i  in {2..11}; do
        SPACE=$(bspc wm --get-status | cut -d ":" -f $i)
        if [ "${SPACE:0:1}" == 'O' ] || [ "${SPACE:0:1}" == "F" ]; then
            fg "#E2D134"
        #elif [ "${SPACE:0:1}" == 'o' ]; then
        #    fg
        elif [ "${SPACE:0:1}" == 'f' ]; then
            fg "#515151"
        elif [ "${SPACE:0:1}" == 'U' ]; then
            fg "#F2D134"
        elif [ "${SPACE:0:1}" == 'u' ]; then
            fg "#932727"
        fi
        echo -n "${SPACE:1} ^fg()| "
    done
}

curtime()
{
    echo -n " "$(date)
}

battery()
{
    echo -n "Charge: "
    charge=$(acpi | cut -d ',' -f2)
    #set color based on charge
    #time left? on hover maybe?
    echo -n $charge
}

diskspace()
{
    echo -n "Disk Usage: "
    usage=$(df -h /dev/dm-2 | tail -n 1 | cut -d ' ' -f 10)
    echo -n $usage
}

keyboard()
{
    read -r enabled < $HOME/.keyboard
    if [ $enabled = "enabled" ]; then
        fg "#11AA11"
    elif [ $enabled = "disabled" ]; then
        fg "#AABFFF"
    fi
    echo -n "^ca(1, keyboardtoggle.sh)$enabled^ca()"
}

#ADD: mpc, vol
align "_LEFT" 
workspaces
align "_CENTER"
align "-90"
curtime
align "_RIGHT"
align "-300"
battery
separator
diskspace
separator
keyboard
echo
