#!/bin/bash

/bin/hostname > /home/pi/hostname_ip.txt

for i in eth0 wlan0 ; do echo $i >> /home/pi/hostname_ip.txt ; /sbin/ifconfig | grep -A 1 $i | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}' >> /home/pi/hostname_ip.txt ; done
/bin/date >> /home/pi/hostname_ip.txt

cat /home/pi/hostname_ip.txt | mail -s "I rebooted" your@email.com
