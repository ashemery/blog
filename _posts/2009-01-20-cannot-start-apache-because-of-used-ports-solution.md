---
title: حل مشكلة عدم قدرة تشغيل Apache بسبب كون المنافذ الخاصة به محجوزة
date: 2009-01-20 11:57:30 -0500
categories:
- Linux Services
- WHM/Cpanel
tags:
- apache
- crond
- httpd
- make-sock
- netstat
- service
- sockets
permalink: /2009/01/20/cannot-start-apache-because-of-used-ports-solution/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

كما وعدتكم بموضوع سابق بإني سأقوم بوضع أي مشكلة تمر علي هنا مع حلها طبعاً … هذه أيضاً مشكلة أخرى مرت علينا قبل فترة بخادم المجتمع وبخادم آخر وهي كلما حاولنا تشغيل الأباتشي تظهر لنا هذه الرسالة:

```
Starting httpd: (98)Address already in use: make_sock: could not bind to address 0.0.0.0:80
no listening sockets available, shutting down
Unable to open logs!
```

وكما هو واضح من المشكلة فإنه المنفذ 80 محجوز ولهذا الأباتشي غير قادر على العمل وتشغيل خدماته للعمل على المنفذ هذا … ولهذا لحل هذه المشكلة عليك بالبحث عن الخدمة أو البرنامج الذي قام بحجز هذ المنفذ وذلك من خلال الأمر التالي:

```
netstat -lnp | grep ':80'
```

وجدت إنه الناتج كان شبيه من هذا:

```
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN 29331/crond
```

فقمت بعمل التالي:

```
service crond stop
```

وبعدها شغلت الأباتشي:

```
service httpd start
```

والحمد لله رجع الأباتشي يشتغل وعلى المنفذ 80 وكله تمام التمام ::18

وبعدها رجعت شغلت الكرون:

```
service crond start
```

وهكذا أنحلت المشكلة وكل شي رجع لوز

بالمناسبة لو ظهرت لك هذه الرسالة:

```
Starting httpd: (98)Address already in use: make_sock: could not bind to address 0.0.0.0:443
no listening sockets available, shutting down
Unable to open logs!
```

فلا يوجد إختلاف فيها … سوى إنه المنفذ هنا الذي يحتاجه الأباتشي هو 443 والذي يحتاجه للتعامل مع SSL أو TLS ولهذا أتبع نفس الخطوات ولكن أبحث عن 443 بدل من 80 …

في الختام إن شاء الله ما تظهر لكم مشاكل ولكن لو ظهرت هذا الحل بين أيديكم الآن …
