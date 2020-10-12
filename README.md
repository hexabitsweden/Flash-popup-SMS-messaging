# Flash-popup-SMS-messaging
Send binary popup sms on Unix/Linux


![Image of Lisa](https://github.com/hexabitsweden/Flash-popup-SMS-messaging/blob/main/screenshots/0.png?raw=true)
![Image of Lisa](https://github.com/hexabitsweden/Flash-popup-SMS-messaging/blob/main/screenshots/1.png?raw=true)
![Image of Lisa](https://github.com/hexabitsweden/Flash-popup-SMS-messaging/blob/main/screenshots/2.png?raw=true)

Thanks to Terence Eden for the python script to convert text -> binary.

## Dependencies: 

minicom and python-serial

```
sudo apt-get install minicom and python-serial
```
BSD
```
pkg install minicom-2.7.1_2 py37-pyserial-3.4_1
```

## Getting Started
Donwload and extract. Or clone from this site.
```
chmod +x binary_sms_sender.sh
```
And then
```
./binary_sms_sender.sh
```
Help 
```
not implemented yet
```

### Prerequisites

Only tested on Linux (Developed on Ubuntu) and a couple of other Linux distros.
It should work on Mac and FreeBSD if one changes /dev/ttyUSB0 to the systems name of the modem.

## Running

## License

This project is licensed under the BSD License

## Acknowledgments
* Pythoncript is made by Terence Eden 

For more info: http://blog.codeland.se
