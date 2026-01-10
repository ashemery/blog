---
title: "حل مشكلة تشغيل smit من خلال ASCII Terminal"
date: 2008-07-03 09:53:26 -0500
categories: ["Unix"]
permalink: "/2008/07/03/solving-smit-problem-in-ascii-terminal/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

داخل نظام AIX في بعض الأحيان قد تحصل عندك مشكلة في تشغيل [SMIT](http://www-03.ibm.com/systems/p/os/aix/whitepapers/smit.html) والذي هو إختصار لـ [System Management Interface Tool](http://www-03.ibm.com/systems/p/os/aix/whitepapers/smit.html) من داخل الـ Terminal بطريقة الـ ASCII … أي بدون إستعمال النسخة التي تعمل بواجهة رسومية مثل AIXWindows …

هذه المشكلة في الغالب حلها بسيط وهو أن تقوم بإضافة نوع الـ ASCII Terminal للمتغيير TERM في النظام … وهذا يتم من خلال تنفيذ التالي:

```
export TERM=vt320
```

وخلاص روح نفذ SMIT كما تشاء الآن  ::20

دمتم بود …
