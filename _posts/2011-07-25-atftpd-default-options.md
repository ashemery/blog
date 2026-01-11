---
title: تشغيل خدمة atftpd بشكل صحيح
date: 2011-07-25 03:09:36 -0500
categories:
- Linux Services
- Networks
tags:
- atftpd
- backtrack5
- daemon
- default
- inetd
- tftpd
permalink: /2011/07/25/atftpd-default-options/
reading_time: 1
---
بعض الأحيان نحتاج الى خادم tftp لنقل بعض الملفات بين جهاز وآخر بغض النظر عن السبب في النقل … في توزيعة BackTrack5 حين تريد تشغيل الخدمة (طبعاً بعد تركيبها، لانها لا تأتي بشكل أساسي مع التوزيعة، والمقصود هنا خدمة atftpd) على سبيل المثال بالشكل التالي:

```
atftpd -vvv --daemon --port 69 --bind-address 192.168.1.1 /tmp
```

ستجد إنها فعلياً لا تعمل ! وحين تحاول الإتصال بالخدمة لا تجد جواب … السبب في ذلك هو ملف الإعدادات الإفتراضية الموجود هنا:

```
/etc/default/atftpd
```

حيث تبدأ الخدمة بالعمل بالإعدادات الموجودة في هذا الملف وليس التي وضعتها أنت على سطر الأوامر … على كل حال لو فتحته ستجد التالي:

```
USE_INETD=true
OPTIONS="--tftpd-timeout 300 --retry-timeout 5 --mcast-port 1758 --mcast-addr 239.239.239.0-255 --mcast-ttl 1 --maxthread 100 --verbose=5 /srv/tftp"
```

وبالتالي أمامك خيارين لحل المشكلة … إما تعمل حذف أو comment out لهذه السطور، وإما تقوم بتعديلها الى ما يناسب إحتياجاتك … أختر ما يناسبك من هذه الحلول …

للتعليق، يرجى زيارة الموضوع التالي: [أضغط هنا](https://www.linuxac.org/forum/showthread.php?52960)
