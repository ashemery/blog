---
title: "معرفة الأجهزة الموجودة على الشبكة بواسطة nmap"
date: 2008-10-11 10:05:36 -0500
categories: ["Snippets"]
permalink: "/2008/10/11/using-nmap-to-get-hosts-on-network/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

بعض الأحيان تود أن تعرف ما هي الأجهزة التي تعمل حالياً على الشبكة ولا تملك لنفرض المعرفة الكاملة بوجودهم أو لا … عادي قم بتنفيذ الأمر:

```
nmap -sP 192.168.0.2-254
```

الناتج شبيه بهذا:

```
Starting Nmap V# ( http://insecure.org ) at 2008-10-11 11:02 EEST
Host 192.168.0.180 appears to be up.
MAC Address: 00:00:00:F1:A6:A6 (Gateway)
Host 192.168.0.189 appears to be up.
MAC Address: 00:F1:A6:F1:F1:BE (##### Computer)
Host 192.168.0.190 appears to be up.
Nmap done: 254 IP addresses (3 hosts up) scanned in 5.084 seconds
```

هذا سيعطيك جميع الأجهزة الموجودة على الشبكة بالوقت الحالي   ::18

nmap رهيب صح ؟ لسه فيه بلاوي بالـ nmap …
