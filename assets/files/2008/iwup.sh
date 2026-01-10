#!/bin/bash
##################################################################
#					   			 #
# 		B!n@ry WiFu Scripts v1.2 :-D  			 #
#	Binary@linuxac.org					 #
#					   			 #
#	Error Handling by: alsadi@linuxac.org			 #
#					   			 #
# 	1- Disconnect from the WiFi Network of Ur's   		 #
#	2- Disable Wireless Interface				 #
#					  			 #					
# Back2Track, as I always say: Linux rul3z ...			 #
#					   			 #
##################################################################
# Howto use:							 #
# ----------						 	 #
# 1- Run the script as user root (su -)
# 2- Add iwup.sh and iwdown.sh to ~/HOME/bin			 #
# 3- Run chmod +x iwup.sh iwdown.sh				 #
# 4- Open ~/HOME/.bashrc and ADD PATH=~/HOME/bin:$PATH	 	 #
# 5- If you do not want to logout run source ~/HOME/.bashrc	 #
# 6- If you logout no need for previous step			 #
# 7- From Terminal write iwup.sh/iwdown.sh			 #
##################################################################
# Error Handling function by Moayed Al-Sadi
function error()
{
echo $1 1>&2;
exit 33;
};

#Get info of the USER running the script
USER=`whoami`;
#Check if USER is root or not
if test $USER = "root";
then
	clear;
	# If USER is root do:
	echo "Please enter your Wireless Interface";
	echo "Example: eth0, eth1, etc";
	read WIFU;
	echo "Please enter your network's ESSID";
	read ESSID;
	echo "Please enter your network's WEP KEY";
	read KEY;
	# Check location of command iwconfig, because it's different from distro. to another
	CMD=`which iwconfig`;
	# Activate the WiFu connection :-D
	$CMD $WIFU essid on && $CMD $WIFU essid $ESSID && $CMD $WIFU key s:$KEY && echo "The Wireless Connection is ON !!!" || error "Failed to start wireless connection !!!";
else
	# If USER is not root do:
	clear && error "Administrative priviliges required, run the script with user ((root)) !!!";
fi
exit 0;
##################################################################
