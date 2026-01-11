---
title: حل مشكلة مستخدم modsec مع قاعدة البيانات mysql
date: 2009-01-20 00:22:31 -0500
categories:
- Database
- Linux Services
- WHM/Cpanel
tags:
- modsec
- modsecurity2
- mysql
- phpmyadmin
- privileges
- whmcpanel
permalink: /2009/01/20/solution-for-modsec-access-denied-on-mysql-database/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

اليوم أحد الخوادم التي عملت عليها كان فيه مشكلة ويصل لمدير الخادم الرسالة التالية:

```
DBI connect(’modsec:localhost’,'modsec’,…) failed: Access denied for user ‘modsec’@'localhost’ 
(using password: YES) at /etc/cron.hourly/modsecparse.pl line 19
Unable to connect to mysql database at /etc/cron.hourly/modsecparse.pl line 19.
```

كما هو واضح من المشكلة بإن المستخدم modsec غير قادر على الإتصال بالقاعدة MySQL بسبب الكلمة السرية يبدو صار فيها مشكلة أو تغييرت أو أي سبب آخر … المهم الخلل بالكلمة السرية … فكان الحل هو أن نقوم بعمل التالي:

أولاً: خذ الكلمة السرية المثبتة بالملف إن لم تكن تريد إختيار كلمة جديدة …

ثانياً: أذهب الى WHM ومن ثم الى phpMyAdmin …

ثالثاً: أختر Privileges ومن ثم أختر الحرف M وذلك لأن المستخدم modsec يبدأ به …

رابعاً: أضغط على edit وذلك لتحرير خيارات المستخدم هذا …

خامساً: أنزل الى الأسفل ستجد صندوقين لوضع كلمة سرية … ضع الكلمة فيهم وأضغط على Go …

خلاص أنحلت المشكلة … للتجربة نفذ الأمر بواسطة المستخدم رووت من خلال ssh طبعاً:

```
# /etc/cron.hourly/modsecparse.pl
```

إذا لم يعطيك خلل معناه كل الأمور سليمة وتمام التمام …

ملاحظة: هذا الحل ينفعك طبعاً لو كنت تستخدم ModSecurity2 وليس 1 طبعاً مع أباتشي2 … في حالة كانت مشكلتك مع ModSecurity وأباتشي1 ؟ قم بحذف الموديول وإضافته مرة أخرى …

إن شاء الله أي مشاكل تمر أمامي في خوادم WHM/Cpanel والخوادم التي بدون لوحة حتى سأقوم بذكرها هنا مع الحل إن شاء الله ليستفيد منها الجميع …

ودمتم بود…
