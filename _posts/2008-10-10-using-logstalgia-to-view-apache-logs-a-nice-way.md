---
title: "Logstalgia لعرض سجلات الأباتشي بطريقة جميلة"
date: 2008-10-10 08:35:34 -0500
categories: ["Software/Tools"]
permalink: "/2008/10/10/using-logstalgia-to-view-apache-logs-a-nice-way/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

![](http://binary-zone.com/images/logstalgia.png)

لقيت هذا البرنامج Logstalgia والذي هو عبارة عن Web server access log visualizer ترجموها أنتوا صراحة البرنامج رائع للغاية ولمن يريد يعرف ماذا يفعل فاليقوم برؤية الفيديو التالي: [أضغط هنا](http://www.youtube.com/watch?v=BYYX-h4-dpM)

المتطلبات:

يحتاج الى OpenGL و 3D accelerator شغال لكي تعمل …

لتحميل البرنامج:

[جماعة دبيان/أوبنتو](http://logstalgia.googlecode.com/files/logstalgia_0.9.1-2_i386.deb)

[جماعة أي توزيعة أخرى](http://logstalgia.googlecode.com/files/logstalgia-0.9.1.tar.gz)

لتشغيله بعد التركيب:

كود:

```
logstalgia /var/log/apache/access.log
```

أو:

كود:

```
tail -f /var/log/apache2/access.log | logstalgia -
```

لمعرفة المزيد حول البرنامج، قم بزيارة الموقع الرسمي: [أضغط هنا](http://code.google.com/p/logstalgia/)

إن شاء الله يعجبكم
