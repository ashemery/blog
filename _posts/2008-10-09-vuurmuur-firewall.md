---
title: Vuurmuur Firewall
date: 2008-10-09 10:00:12 -0500
categories:
- Firewalls
tags:
- firewalls
permalink: /2008/10/09/vuurmuur-firewall/
reading_time: 3
---
السلام عليكم ورحمة الله وبركاته

وجدت قبل يومين هذا البرنامج وتركته على الـ firefox tabs الي عندي لكي أكتب عنه القليل … البرنامج Vuurmuur عبارة عن أداة تم بناءها بالإعتماد أو فوق الـ iptables … هذه الأداة تسهل عليك عملية إعداد للجدار الناري iptables وايضاً فيها اعدادات جاهزة تستطيع أن تستند عليها سواءاً في عمل إعدادات مقدمة أو أعدادات بسيطة … أيضاً Vuurmuur تدعم الـ Traffic Shaping ولها إمكانيات لعمل مراقبة جيدة أيضاً تمكن الأدمن من النظر الى السجلات والـ bandwidth بشكل حي ومباشر Real Time … طبعاً والأداة تقع تحت رخصة GNU GPL … وأنصحكم تجربوها على الأقل …

بعض الصور:

صورة تعرض السجلات

![](/assets/img/posts/2008/vuurmuur-logview.png)

صورة تعرض الإتصالات

![](/assets/img/posts/2008/vuurmuur-connview.png)

صورة توضح القوانين

![](/assets/img/posts/2008/vuurmuur-rules.png)

صورة توضح الـ Traffic

![](/assets/img/posts/2008/iptrafvol.png)

**مزايا البرنامج على مستوى الأداري:**

– لا تحتاج الى أي معرفة في الـ iptables

– القوانين المكتوبة قابلة للقراءة بسهولة من قبل البشر

– إمكانيات traffic shaping

– واجهة رسومية Ncurses ولهذا لا تحتاج الى X

– تسهيل عمل port forwarding

– سهلة التركيب مع الـ NAT

– عمل policy أمنة

– تستطيع إدارتها من خلال SSH أو PuTTY

– إمكانية الدمج مع برامج أخرى من خلال السكربتات

– يمكنها أن تبني لك سكربت bash يخص الجدار الناري

– دعم للـ anti-spoofing

– قتل جميع الإتصالات الغير مرغوبة

– تدعم العمل مع snort_inline من خلال إستعمال QUEUE أو NFQUEUE

**مزايا البرنامج على مستوى المراقبة:**

– تستطيع مراقبة السجلات بشكل حي ومباشر

– تستطيع مراقبة الإتصالات بشكل حي ومباشر

– تسطيع فلترة السجلات والاتصالات حين تريد مشاهدتها

– حسابات بسيطة لحجم الـ traffic

– البحث بداخل السجلات القديمة

**مزايا البرنامج على مستوى الحسابات:**

– أي شيء يتم تسجيله أو تغييره يسجل

– يتم تسجيل جميع الإتصالات الجديدة والـ packets السيئة

– حسابات حجم الـ traffic

لتحميل البرنامج كل حسب توزيعته:[أضغط هنا](http://www.vuurmuur.org/trac/wiki/Download)

مستخدمي دبيان/أوبنتو هذه الصفحة مفيدة لهم: [أضغط هنا](http://www.vuurmuur.org/trac/wiki/InstallationDebian)

بعد إنتهاءك من التنصيب يجب أن تقوم بعمل الإعدادات الصحيحة لكي يعمل الأنترنت عندك: [أضغط هنا](http://www.vuurmuur.org/trac/wiki/Configuration)

هناك Demos تم عملهم لمن يريد التفرج: [أضغط هنا](http://trac.vuurmuur.org/demos/demos.html)

لمن يريد المزيد حول Traffic Shaping: [أضغط هنا](http://www.vuurmuur.org/trac/wiki/TrafficShaping)

الموقع الرسمي للبرنامج Vuurmuur: [أضغط هنا](http://www.vuurmuur.org/trac/)

للنقاش بخصوص البرنامج —–> [أضغط هنا](https://www.linuxac.org/forum/showthread.php?t=16146)

إن شاء الله يفيدكم، فهو فعلاً رائع ورائع جداً …

هذا ما لدي ودمتم بود
