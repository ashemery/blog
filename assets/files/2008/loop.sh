#/bin/bash
# Simple script to add more loop devices
# Now mount as many ISO's as you like :)
# binary[at]linuxac[dot]org
for i in $(seq 0 255); do
	mknod -m0660 /dev/loop$i b 7 $i
	chown root.disk /dev/loop$i
done

