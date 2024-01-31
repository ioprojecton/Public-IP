#!/bin/bash

declare public_ip="$(curl -s ipinfo.io/ip)"

if [ -z "$public_ip" ]; then

    echo "Error_1"

    exit 1

fi

#folder accessibility and writability checks here if needed 

if [ ! -e "ip.txt" ]; then

    echo "$public_ip" > ip.txt #change to full path for cron or anacron

    swaks -S --to wheretosend@gmail.com -s smtp.gmail.com:587 -tls -au email@gmail.com -ap "pass from google" -b "$public_ip"
    
elif [ "$(cat $HOME/myIp/ip.txt)" != "$public_ip" ]; then

    echo "$public_ip" > ip.txt #change to full path for cron or anacron

    swaks -S --to wheretosend@gmail.net -s smtp.gmail.com:587 -tls -au email@gmail.com -ap "pass from google" -b "$public_ip"

fi

exit 0
