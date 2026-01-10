---
title: "حل لعدم عمل rndc-confgen"
date: 2012-06-20 23:21:42 -0500
categories: ["GNU/Linux", "Linux Security", "Linux Services"]
tags: ["BIND", "named", "named.conf", "rand_irqs", "reload", "rndc", "rndc-confgen", "rndc.key", "service"]
permalink: "/2012/06/20/rndc-confgen-hangs-solution/"
reading_time: 1
---

قمت بعمل إعداد لخادم DNS على CentOS 6.2 وأحتجت الى عمل توليد لملف الـ rndc.key من خلال الأمر rndc-confgen وذلك لأني حين أقوم بعمل:

```
rndc reload
```

كان يعطيني التالي:

> neither /etc/namedb/rndc.conf nor /etc/namedb/rndc.key was found

فهمت إن الملف rndc.key غير موجود ولهذا أحتجت الى توليده … الآن المشكلة حين حاولت توليده من خلال:

```
rndc-confgen -a -c /etc/rndc.key
```

الأمر يبقى متوقف ولا يعمل شيء!

حين قرأت المستندات الخاصة بالأمر، تبيين إنه يعتمد على /dev/random لتوليد هذا الملف والمفتاح الذي بداخله … وبعد بحث بسيط في جوجل، تبيين إن الحل بسيط وهو كالتالي:

```
vim /etc/rc.conf
```

وضع فيه:

> rand_irqs=”3 14 15″

وذلك حسب الـ [BIND FAQ](http://www.bind9.net/BIND-FAQ) وهذا مستند آخر مفيد ([أضغط هنا](http://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-bind-rndc.html))

بعد ذلك أفتح ملف named.conf وضع فيه السطر التالي:

> include “/etc/rndc.key”;

وقم بإعادة تشغيل

```
service named restart
```

والحمد لله الأمور عادت تمام :)

(( [للنقاش](http://www.linuxac.org/forum/showthread.php/59062) ))
