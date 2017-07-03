#!/bin/bash
sleeptime=0.3
while true; do
    ~/.bin/wmscripts/dzen2/statusbar.sh
sleep $sleeptime; done | dzen2 -e - -h '16' -w '1920' -ta l
