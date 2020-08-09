#!/bin/bash

set -x

echo `date` >> /home/pi/bash/test.log
export DISPLAY=":0.0"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

now=`date +%H`

case "$now" in
    00-02)
        filename="mojave_dynamic_16.jpeg"
        ;;
    03-04)
        filename="mojave_dynamic_1.jpeg"
        ;;
    05)
        filename="mojave_dynamic_2.jpeg"
        ;;
    06)
        filename="mojave_dynamic_3.jpeg"
        ;;
    07)
        filename="mojave_dynamic_4.jpeg"
        ;;
    08)
        filename="mojave_dynamic_5.jpeg"
        ;;
    09)
        filename="mojave_dynamic_6.jpeg"
        ;;
    10)
        filename="mojave_dynamic_7.jpeg"
        ;;
    11,12)
        filename="mojave_dynamic_8.jpeg"
        ;;
    13)
        filename="mojave_dynamic_9.jpeg"
        ;;
    14)
        filename="mojave_dynamic_10.jpeg"
        ;;
    15)
        filename="mojave_dynamic_11.jpeg"
        ;;
    16)
        filename="mojave_dynamic_12.jpeg"
        ;;
    17)
        filename="mojave_dynamic_13.jpeg"
        ;;
    18-19)
        filename="mojave_dynamic_14.jpeg"
        ;;
    20-23)
        filename="mojave_dynamic_15.jpeg"
        ;;
esac

xfconf-query -v -c xfce4-desktop \
    -p "/backdrop/screen0/monitor0/workspace0/last-image" \
    -s "/home/pi/Pictures/wallpaper/$filename" >> /home/pi/bash/test.log

if [ $? -eq 0 ]; then
    echo "wallpaper successfully changed"
    exit 0
else
    echo "An error occoured please check the log in /home/pi/bash/test.log"
    exit 1
fi
