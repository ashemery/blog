---
title: "هل الخدمة مبنية بدعم TCP Wrappers أم ﻻ؟"
date: 2008-04-12 09:51:16 -0500
categories: ["Linux Security"]
permalink: "/2008/04/12/does-the-service-support-tcp-wrappers/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

بعض الأحيان يكون لديك خدمة أو daemon تريد معرفة هل تم بناءها بدعم الـ TCP Wrappers أم ﻻ، ولكن ﻻ تعرف كيف تتأكد من ذلك …

إختصار شديد جداً حول الـ TCP Wrappers وهو إنك تستطيع تتحكم بهذه الخدمات daemons من خلال تحديد الأجهزة أو الدومينات التي تستطيع إستعمالها من خلال كل من:

```
/etc/hosts.allow
```

و

```
/etc/hosts.deny
```

وأظن سبق وشرحنا كيف يتم ذلك في مواضيع سابقة ... الحين للتأكد من خدمة الـ SSH هل تدعمه أم ﻻ، نفذ التالي:

```
ldd /usr/sbin/sshd | grep libwrap
```

سيكون الناتج مثل هذا تقريباً:

```
libwrap.so.0 => /lib/libwrap.so.0 (0xb7fa9000)
```

وهذا يدل على إنه خدمة الـ SSH تدعم الـ TCP Wrappers من خلال libwrap كما نلاحظ ...

طيب لنجرب مثلاً خدمة الأباتشي:

```
ldd /usr/sbin/apache2 | grep libwrap
```

سنلاحظ لن يكون هناك أي مخرجات وهذا يعني إنه ﻻ يقوم بدعمها ...

ياله كفاية بقا ... [للنقاش حول الموضوع أضغط هنا](http://www.linuxac.org/forum/showthread.php?t=9952) ...

ودمتم ...
