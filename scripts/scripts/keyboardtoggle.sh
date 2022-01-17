#!/bin/bash
fconfig=".keyboard" 
id=$(xinput list --id-only 'AT Translated Set 2 keyboard')

if [ ! -f $fconfig ];
    then
        echo "Creating config file"
        echo "enabled" > $fconfig
        var="enabled"
    else
        read -r var< $fconfig
        echo "keyboard is : $var"
fi

if [ $var = "disabled" ];
    then
        echo "enable keyboard..."
        xinput enable $id
        echo "enabled" > $fconfig
    elif [ $var = "enabled" ]; then
        echo "disable keyboard"
        xinput disable $id
        echo 'disabled' > $fconfig
fi
