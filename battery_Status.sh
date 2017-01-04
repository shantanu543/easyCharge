#!/bin/bash

batt_percent=$(acpi | grep -o '[0-9]%\|[0-9][0-9]%\|[0-9][0-9][0-9]%'| sed 's/[^0-9]//g')
discharging=$(acpi | grep -c Discharging)  #returns "0" if in charge else "1" 
flag=0
if [ $discharging == 0 ]  #laptop is plugged in
then
    #echo 'charging'
    case $batt_percent in
    [8-9][0-9]|100)
       # echo -ne 'Stop charging \a'
        #####echo -ne "b\r\nb\r\nb\r\nb\r\nb\r\nb\r\nb\r\nb\r\nb\r\nb\r\nb\r\nb\r\nb\r\n" > /dev/rfcomm0
	echo "b" > battery.txt
        flag=1
        ;;
    esac
else     
    #echo 'discharging'
    case $batt_percent in
    [1-3][0-9]|[0-9])
        #echo -ne 'Start charging \a'
      #####  echo -ne "a\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\n" > /dev/rfcomm0
	echo "a" > battery.txt
        flag=1
            ;;
    esac
fi

if [ $flag == 0 ]
then 
	echo "c" > battery.txt
fi
