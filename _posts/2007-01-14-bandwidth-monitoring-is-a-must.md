---
title: "مراقبة الــ Bandwidth أمر ظروري …"
date: 2007-01-14 21:29:33 -0500
categories: ["Linux Services"]
permalink: "/2007/01/14/bandwidth-monitoring-is-a-must/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته …

![](http://www.gropp.org/bwm-ng.png)

بعض المرات تلاقي لود السيرفر عندك مو عالي ولم يصل على السيرفرات ذات المعالجين Dual Processor الى 4 … وعلى السيرفر ذو معالج واحد Single Processor ﻻ يصل الى واحد … طيب ليش الموقع بطيء ؟؟؟ لهذا عادتا على الأدمن ليس فقط ان يراقب السيرفر واللود فقط !!! وإنما يراقب الباندويدث BW أيضا … خاصة من العابثين … ومرات ﻻ تعلم إنه جالس يحصل عندك سرقة في الـ BW من خلال نوع من أنواع الــ ping … لهذا فإنه برنامج  Bandwidth Monitor NG يعتبر من البرامج المميزة جدا في مراقبة الــ BW على سيرفر معيين … خاصة وإنه له إمكانيات مراقبة أكثر من منفذ Interface … يعني ممكن يراقب eth0 و eth1 والــ lo أيضا في نفس الوقت … أيضا يظهر لك المخرجات من خلال تصنيفات مختلفة: KB/s للحجم … Kb/s للسرعة … packets … وأيضا الأخطاءerrors … وأيضا الــ  average للإتصال والــ max والمجموع sum … كل هذا يعرضه لك هذا البرنامج الصغير … وأيضا بإمكانك التحكم فيه من خلال ملفconfigfile

قادر على العمل على كل من: Linux, BSD, Solaris, Mac OS X

الموقع الرسمي له: [هنا](http://www.gropp.org)

طريقة التركيب كالتالي:

cd /usr/local/src

wget http://www.gropp.org/bwm-ng/bwm-ng-0.5.tar.gz

tar xvfz bwm-ng-0.5.tar.gz

cd bwm-ng-0.5

./configure; make; make install

بعد ذلك للتنفيذ قم بالتالي:

bwm-ng

أخوكم B!n@ry …
