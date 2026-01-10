---
title: "برنامج aria لتحميل الملفات (لعشاق SUSE)"
date: 2008-01-16 15:25:48 -0500
categories: ["Software/Tools"]
permalink: "/2008/01/16/aria-download-manager-for-suse-lovers/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته …

قبل حوالي إسبوع قمنا أنا والأخ مسلم بعمل تجهيز لنسخة برنامج aria لتعمل على توزيعات SUSE … ﻷنه تم إختفاء هذا البرنامج الرائع جداً من منصات توزيعات SUSE … ولهذا قمنا بتنزيل حزمة التنصيب الخاصة بالـ src وقمنا بعمل فرط extract لها ومن ثم عملنا لها Patch وبعد ذلك كومبايل وتجهيزها على شكل برنامج RPM من بإستعمال برنامج KRPMBuilder …

![](/assets/img/posts/2008/aria-downloader.jpg)

لتحميل البرنامج —- > [أضغط هنا](/assets/files/2008/aria-1.0.0-1.i386.rpm)

لتنصيب البرنامج:

```
rpm -ivh aria-1.0.0-1.i386.rpm
```

للتاكد  ::18

```
rpm -qi aria
```

```
Name : aria Relocations: /usr/local
Version : 1.0.0 Vendor: (none)
Release : 1 Build Date: Mon Jan 7 15:20:09 2008
Install Date: Mon Jan 7 15:23:31 2008 Build Host: rul3z.newtekjo.com
Group : Internet Source RPM: aria-1.0.0-1.src.rpm
Size : 1520670 License: GPL
Signature : (none)
Packager : Ali Al-Shemery
URL : /assets/files/2008/asset.bin.bin
Summary : Aria Download Manager
Description :
Aria is a download tool for UNIX similar to Reget or GetRight. It downloads files from Internet via HTTP/HTTPS or FTP. The transfer can be paused, resumed, queued and saved. It has very friendly GTK based GUI, and useful log consoles.
Some of its main features are:
- Automatic CRC/MD5 checking
- File retrieving over HTTP, HTTPS and FTP protocol
- Split downloads
- Recursive dowloading via HTTP and FTP protocol
- HTTP/FTP proxy server
- Cut-and-paste, drag-and-drop(Mozilla, Galeon, Opera, Konqueror, Netscape)
- Multi-list(tabbed mode) feature
- Multi-threaded download
- ****ie support
- Download resume
- Download speed limits for each item
- Server templates to avoid some URL formats
- Localization for 12 languages
Distribution: SuSE Linux
```

الموقع الرسمي للبرنامج هنا ----> [أضغط](http://sourceforge.net/projects/aria-rpm/)

سيتم إضافته الى الـ SorceForge قريباً إن شاء الله ...

إن شاء الله محبي توزيات SUSE ينبسطوا عليه  ::18

بالتوفيق للجميع ...

أخوكم B!n@ry ...
