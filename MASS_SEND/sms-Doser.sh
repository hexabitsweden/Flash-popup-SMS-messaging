#!/bin/bash
DEV=/dev/ttyUSB0
DESTNUM="+460*****"
SMS="Hello there!"
echo -e "ATZ\r" >$DEV
sleep 1
echo -e "AT+CMGF=1\r" >$DEV
sleep 1
echo -e "AT+CMGS=\"$DESTNUM\"\r" >$DEV
sleep 1
echo -e "$SMS\x1A" >$DEV
