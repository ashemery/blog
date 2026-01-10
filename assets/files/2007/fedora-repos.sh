#!/bin/bash			
###################################################################################
#										  #
#			Fedora 8 "Werewolf" Repo's Adder			  #
#				   v0.2						  #
#										  #
# 			PLEASE READ CAREFULLY !!!				  #
#										  #
# This script is:								  #
# 1) Add extra repo's to your Fedora 8 "Werewolf" ONLY, to INSTALL more SOFTWARE  #
# 2) NOT an improvment to the script: http://dnmouse.webs.com/scripts/fedora8.sh  #
# 3) Improved in the way it is DISPLAYED					  #
#										  #
# Regards to all LinuxAC.org							  #
# Regards to Broken-Proxy and sAFA7_eLNeT --- Don't Ask Y :)			  #
#										  #
# 			Script is under the GNU GPL				  #
###################################################################################

# Variable Section
WELCOME="1"
REPO_PATH=/etc/yum.repos.d/
CHOICES="1 2 3 4 5 6 7 8"

# Function Section
function menu {
  clear
  echo -en "\033[0;40;32m"
  clear
  echo Hello $(logname) 
  echo "################################ B ! n @ r y #################################"
  echo "###                     What would you like to do ?                       ###"
  echo "###    1) Livna repository's				                  ###"
  echo "###    2) Kirvo repository's				                  ###"
  echo "###    3) Freshrpms repository's			                  ###"
  echo "###    4) ATrpms repository's				                  ###"
  echo "###    5) Skype repository's				                  ###"
  echo "###    6) Google repository's				                  ###"
  echo "###    7) JPackage repository's				                  ###"
  echo "###    8) Exits This Script                                               ###"
  echo "################################ B ! n @ r y #################################"
}

function message {
if [ $WELCOME = 1 ]
	then
echo  Hello $(logname) 
echo "W E L C O M E   T O   M Y  E X T R A  R E P O 'S  S C R I P T"
echo "            T H I S  I S  F O R  F 8  O N L Y"
echo "                      By B!n@ry"
echo "                  www.binary-zone.com"
sleep 5
else
echo "no welcome msg for you :P" 
fi
}

function livna {
  clear
  rpm -ivh http://rpm.livna.org/livna-release-8.rpm
  rpm --import http://rpm.livna.org/RPM-LIVNA-GPG-KEY
}

function kirov {
  clear
  wget http://www.csc.calpoly.edu/~admiller/repo/pub/kirov.repo
  rpm --import http://www.csc.calpoly.edu/~admiller/repo/pub/RPM-GPG-KEY-Kirov
}

function freshrpms {
  clear
  rpm -ivh http://ftp.freshrpms.net/pub/freshrpms/fedora/linux/8/freshrpms-release/freshrpms-release-1.1-1.fc.noarch.rpm
  rpm --import http://freshrpms.net/RPM-GPG-KEY-freshrpms
}

function atrpms {
clear
echo "[atrpms]" >> atrpms.repo
echo "name=Fedora Core $releasever - $basearch - ATrpms" >> atrpms.repo
echo "baseurl=http://dl.atrpms.net/f$releasever-$basearch/atrpms/stable" >> atrpms.repo
echo "gpgkey=http://ATrpms.net/RPM-GPG-KEY.atrpms" >> atrpms.repo
echo "gpgcheck=1" >> atrpms.repo
echo "enabled=0" >> atrpms.repo
echo "" >> atrpms.repo
echo "Repo Added Successfully :-D"
sleep 2
rpm --import http://atrpms.net/RPM-GPG-KEY.atrpms
}

function skype {
clear
echo "[skype]" >> skype.repo
echo "name=Skype Repository" >> skype.repo
echo "baseurl=http://download.skype.com/linux/repos/fedora/updates/i586/" >> skype.repo
echo "enabled=0" >> skype.repo
echo "gpgkey=http://www.skype.com/products/skype/linux/rpm-public-key.asc" >> skype.repo
echo "gpgcheck=1" >> skype.repo
echo "" >> skype.repo
echo "Repo Added Successfully :-D"
sleep 2
yum --enablerepo=skype install skype
}


function google {
clear
echo "[google]" >> google.repo
echo "name=Google - i386" >> google.repo
echo "baseurl=http://dl.google.com/linux/rpm/stable/i386" >> google.repo
echo "enabled=1" >> google.repo
echo "gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" >> google.repo
echo "" >> google.repo
echo "Repo Added Successfully :-D"
sleep 2
}

function jpackage {
clear
echo "[jpackage-generic]" >> jpackage.repo
echo "name=JPackage (free), generic" >> jpackage.repo
echo "mirrorlist=http://www.jpackage.org/jpackage_generic.txt" >> jpackage.repo
echo "failovermethod=priority" >> jpackage.repo
echo "gpgcheck=1" >> jpackage.repo
echo "gpgkey=http://www.jpackage.org/jpackage.asc" >> jpackage.repo
echo "enabled=0" >> jpackage.repo
echo "" >> jpackage.repo
echo "[jpackage-fc]" >> jpackage.repo
echo "name=JPackage (free) for Fedora Core $releasever" >> jpackage.repo
echo "mirrorlist=http://www.jpackage.org/jpackage_fedora-$releasever.txt" >> jpackage.repo
echo "failovermethod=priority" >> jpackage.repo
echo "gpgcheck=1" >> jpackage.repo
echo "gpgkey=http://www.jpackage.org/jpackage.asc" >> jpackage.repo
echo "enabled=0" >> jpackage.repo
echo "" >> jpackage.repo
echo "[jpackage-generic-nonfree]" >> jpackage.repo
echo "name=JPackage (non-free), generic" >> jpackage.repo
echo "mirrorlist=http://www.jpackage.org/jpackage_generic_nonfree.txt" >> jpackage.repo
echo "failovermethod=priority" >> jpackage.repo
echo "gpgcheck=1" >> jpackage.repo
echo "gpgkey=http://www.jpackage.org/jpackage.asc" >> jpackage.repo
echo "enabled=0" >> jpackage.repo
echo "" >> jpackage.repo
echo "Repo Added Successfully :-D"
sleep 2
}

# Main Script Section
clear
        message
	cd $REPO_PATH
	menu	
select choix in $CHOICES; do					
	if [ "$choix" = "1" ]; then
	livna
	menu			
	elif [ "$choix" = "2" ]; then
	kirov
	menu					
	elif [ "$choix" = "3" ]; then
	freshrpms
        menu
        elif [ "$choix" = "4" ]; then
	atrpms
        menu
	elif [ "$choix" = "5" ]; then
	skype
        menu
	elif [ "$choix" = "6" ]; then
	google
        menu
	elif [ "$choix" = "7" ]; then
	jpackage
        menu
        elif [ "$choix" = "8" ]; then
	echo -e "\033[0m"
        clear
	echo Script Terminated Good Bye $(logname) 
        exit 		
	else
	clear
	menu
	echo " "
	echo " "        
	echo " "        
	echo " "        
	echo "################################################################"
        echo "###         Please Try again wrong number   !!!              ###"
        echo "################################################################"
        sleep 2
	clear
	menu
	fi
done
# END of Script - But NOT the END of GNU/Linux :-D#
