---
title: "حل مشكلة FQDN بعد تنصيب الأباتشي على Ubuntu"
date: 2008-09-22 15:36:54 -0500
categories: ["Linux Services"]
permalink: "/2008/09/22/solve-fqdn-problem-after-apache-installation-on-ubuntu/"
reading_time: 1
---

**السلام عليكم ورحمة الله وبركاته**

أكيد الي قام بتنصيب الأباتشي على دبيان أو أوبنتو بعد تشغيل الخدمة ستظهر له رسالة تخبره بالتالي:

```
/etc/init.d/apache2 restart
* Restarting web server apache2
apache2: Could not reliably determine the server's fully qualified domain name,
using 127.0.1.1 for ServerName
apache2: Could not reliably determine the server's fully qualified domain name,
using 127.0.1.1 for ServerName
```

حل هذه المشكلة بسيط يا شباب … فقط قم بتحرير ملف الأعدادات الخاص بالأباتشي:

```
vim /etc/apache2/apache2.conf
```

وضع بالأخير (ممكن في البداية) السطر التالي:

```
ServerName "localhost"
```

وبعد ذلك أحفظ الملف وأعمل أعادة تشغيل للخدمة:

```
/etc/init.d/apache2 restart
* Restarting web server apache2
```

كما تلاحظون الخطأ لم يعد موجود

عندي بلاوي أفكار حول الأباتشي خليني أشوف شلون ارتبها وانزلهم …

ياله بالتوفيق لكم مع سيرفراتكم المحلية

للنقاش في الموضوع: [أضغط هنا](http://www.linuxac.org/forum/showthread.php?t=15443)

ودمتم بود …
