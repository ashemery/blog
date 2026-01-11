---
title: 'Linux Iptables ip_conntrack: table full, dropping packet error'
date: 2009-09-26 08:35:13 -0500
categories:
- Firewalls
- Kernel
- Linux Security
- PCI Compliance
- PenTest
tags:
- ip-conntrack
- kernel
- nessus
- netfilter
- pci-compliance
- proc
- sysctlconf
permalink: /2009/09/26/linux-iptables-ip_conntrack-table-full-dropping-packet-error/
reading_time: 1
---
السلام عليكم ورحمة الله وبركاته

كنت أقوم بعمل فحص بواسطة Nessus ولكن لم تكن النتائج تظهر بشكل صحيح، خاصة وإن بعض الفحوصات تمت أكثر من مرة، ولهذا أستغربت من الموضوع … وأيضاً أجهزة أخرى لم تكن تحقق الـ PCI Compliance وكان تقرير Nessus يقول لي بإنه لم يستطيع القيام بعملية فحص شاملة وكاملة !!!

أستغربت يومها، ما هو السبب ولهذا ذهبت وتابعت السجلات Log Files … فعندها وجدت بإن النواة للجهاز تقول شيء كهذا:

Sep  8 22:18:06 hostname kernel: NET: 347 messages suppressed.

Sep  8 22:18:06 hostname kernel: ip_conntrack: table full, dropping packet.

Sep  8 22:18:11 hostname kernel: NET: 392 messages suppressed.

Sep  8 22:18:11 hostname kernel: ip_conntrack: table full, dropping packet.

هذا يخبرنا بإنه الخادم جالس يحاول يرسل طلبات أكثر من التي يستطيع تحملها … ولهذا حلها بسيط وهو زيادة القيمة حق الـ ip_conntrack من خلال:

echo "A_BIG_NUMBER" > /proc/sys/net/ipv4/ip_conntrack_max

لتثبيت ذلك لكي يستمر حتى بعد عملية إعادة التشغيل:

vim /etc/sysctl.conf

وضع مثلاً 34576

net.ipv4.netfilter.ip_conntrack_max=34576

والآن تستطيع الإستمرار في عملك دون مشاكل الموديول هذا :)
