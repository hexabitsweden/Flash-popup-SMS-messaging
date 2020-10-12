red="\033[0;31m"        
cyan="\033[1;36m"      
green="\033[0;32m"     
blue="\033[9;34m"  
yellow="\e[1;33m" 
black="\033[9;34m"
brown="\033[0;33m"
magenta="\033[0;35m"
gray="\033[0;37m"
bred="\e[0;30;41m" 
bgreen="\e[0;37;42m" 
bgreenb="\e[0;30;42m"
byellow="\e[0;30;43m"
none="\033[0m" 
pink="\e[1;30;31m"
bblue="\e[0;30;46m"
bpurple="\e[0;30;45m"
menucol="\e[0;30;43m"
bwhite="\e[0;31;47m" 
white="\033[0;37m"

#Dependencies: minicom and python-serial
# sudo apt-get install minicom and python-serial.....

#TEXT="Vi har magsjukan..."
txt="sms.msg.txt"
FLASH="0" #ON 

FLASHER () {
		  if [[ $FLASH == "1" ]] 
		  then
			  FLASH="0"
			  echo -e " $bwhite Flash=ON $none"
			  echo "Status: $FLASH"
			  sleep 2
			  main
		  

		  elif [[ $FLASH == "0" ]]
		  then
			  FLASH="1"
			  echo -e " $bwhite Flash=OFF $none"
			  echo "Status: $FLASH"
			  sleep 2
			  main
		  else 
			  echo "Ohoj"
		  fi
}


main () {
clear
echo " "
echo " "
echo -e "$red      ############################################# $none"
echo -e "$red      #                                           # $none"
echo -e "$red      #        $menucol   BINARY SMS SUPER-SENDER   $red      # $none"
echo -e "$red      #                                           # $none"
echo -e "$red      #     $none  $yellow  It's working$none $magenta BETA 0.1.1   $red       # $none"
echo -e "$red      #                                           # $none"
echo -e "$red      #  $gray     Daniel \"hexabit\" Jendinger 2016$red     # $none"
echo -e "$red      #                                           # $none"
echo -e "$red      ############################################# $none"
echo " "
echo -e "$blue Edit text to send:$yellow(1)$blue Edit numberfile:$yellow(2)$none"
echo -e "$blue     Set flash on/off:$yellow(F)$blue Start sending:$yellow(3)$none"
printf "\nWhat you wanna do: "
read a

if [[ "$a" == "1" ]]
  then
   vi $txt 
   main

elif [[ "$a" == "2" ]]
	  then
	   vi telelistan.txt 
	   main

elif [[ "$a" == "3" ]]
	  then
	   spammer
	   echo -e "\n$bwhite ** DONE **$none\n"
	   sleep 2
	   main

elif [[ "$a" == "f" ]]
	  then
		  FLASHER

   else 
	   echo "Guru meditation...."
	   sleep 2
	   main
   fi
}

spammer () {
	msg=`cat sms.msg.txt`
	sed '/#/d' telelistan.txt > temptele.txt
	cat temptele.txt | cut -f3 -d ',' |while read LINE 
		do
			#echo "Sending sms to: $LINE"
			python pdu_converter.py $LINE "$msg" $FLASH
			echo python pdu_converter.py $LINE $msg $FLASH
			#echo "----------------------------------------"
			minicom -S sms.PDU0.txt -D /dev/ttyUSB0
			echo "----------------------------------------"
	
		done
	#	rm temptele.txt
}

main
