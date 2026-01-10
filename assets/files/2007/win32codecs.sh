#!/bin/bash
###############################################################
# Script to install Codecs needed to Run Video's and Sound's  #
#							      #
# Greetz 2 all friends @LinuxAC.Org			      #
#							      #
# www.binary-zone.com ----> B!n@ry <---- Fedora 8 "Werewolf"  #
###############################################################
cd /tmp
wget http://www1.mplayerhq.hu/MPlayer/releases/codecs/all-20071007.tar.bz2
tar -jxvf all-20071007.tar.bz2
su -c 'mkdir -p /usr/local/lib/codecs'
su -c 'cp all-20071007/* /usr/local/lib/codecs'
rm -rf /tmp/all-20071007
su -c 'ln -sf /usr/local/lib/codecs /usr/lib/codecs && ln -sf \
/usr/local/lib/codecs /usr/local/lib/win32 && ln -sf /usr/local/lib/codecs '

#End of Script#
