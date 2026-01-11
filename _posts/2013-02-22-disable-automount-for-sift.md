---
title: Disable Automount for SIFT
date: 2013-02-22 13:06:39 -0500
categories:
- DFIR
- Forensics
tags:
- automount
- computer-forensics
- digital-forensics
- disable
- gconftool-2
- mount
- sans
- sans-investigation-forensic-toolkit
- sift
- usb
- virtualbox
- vmware
- gnulinux
permalink: /2013/02/22/disable-automount-for-sift/
reading_time: 1
---
مشكلة بسيطة في إستعمال SANS Investigation Forensic Toolkit أو ما يسمى SIFT تكمن في عمل ربط mount للأجهزة الخارجية مثل USB بشكل تلقائي وهذا أمر سيء في مجال الـ Digital Forensics ولهذا لحل هذه المشكلة، كل ما عليك فعله هو:

```
gconftool-2 --type bool --set /apps/nautilus/preferences/media_automount false
gconftool-2 --type bool --set /apps/nautilus/preferences/media_automount_open false
gconftool-2 --type bool --set /apps/nautilus/preferences/media_automount_never false
```

هذه المشكلة لمن يستعملون SIFT بداخل Virtualbox ولربما مع منتجات VMWare كذلك … تم تجربة هذه الحلول على المستخدم sansforensics …

بعد ذلك لقيامك بربط الجهاز mount بشكل يدوي، يمكنك الرجوع الى مقالة [Rob Lee](http://computer-forensics.sans.org/blog/author/robtlee) على موقع مدونة SANS الخاصة بالـ Computer Forensics [هنا](http://computer-forensics.sans.org/blog/2009/02/19/digital-forensic-sifting-how-to-perform-a-read-only-mount-of-evidence/) …
