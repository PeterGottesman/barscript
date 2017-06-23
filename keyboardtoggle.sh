#!/bin/bash
id=$(xinput | grep -i "at translated" | awk -F' ' '{print substr($7,4,5)}')
echo $id
fconfig="$HOME/.keyboard"

if [ ! -f $fconfig ];
    then
        echo "Creating config file"
        echo "enabled" > $fconfig
        var="enabled"
    else
        read -r var< $fconfig
fi

if [ $var = "disabled" ];
    then
        echo "enabled"
        xinput enable $id
        echo "enabled" > $fconfig
    elif [ $var = "enabled" ]; then
        echo "disabled"
        xinput disable $id
        echo 'disabled' > $fconfig
fi
