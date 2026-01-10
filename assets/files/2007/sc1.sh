#################################################################
#								#
#	L!nux rul3z 4LL						#
#	Script#1  by:	B!n@ry					#
#		www.binary-zone.com				#
#		12-2-2007 Mon.					#
#	Des.: Search for a file inside the /home directory.	#
#								#
#################################################################
#!/bin/bash
echo "Please Enter the filename you want to search for:"
read FILENAME
FILENAME=${FILENAME:-file}
find /home -name $FILENAME

