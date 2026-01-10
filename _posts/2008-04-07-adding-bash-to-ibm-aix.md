---
title: "إضافة الـ BASH الى نظام AIX"
date: 2008-04-07 19:00:32 -0500
categories: ["Unix"]
permalink: "/2008/04/07/adding-bash-to-ibm-aix/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته …

بالأمس قمت بإضافة الـ BASH الى نظام IBM AIX v5.3 وذلك من خلال بعض الخطوات البسيطة سأقوم بذكرها في هذه التدوينة … الهدف من الإضافة هو تسهيل العمل على بيئة الـ AIX خاصة بالنسبة للجدد عليه والذي ﻻ يعرفون الأوامر الخاصة به نظراً لأنهم جدد على هذا النظام … وأيضاً شركة IBM هي من أكبر داعمي البرمجيات الحرة وحتى تنصح بإستعمالها …

نأتي لطريقة التثبيت … أذهب الى الرابط التالي: [أضغط هنا](http://www-03.ibm.com/systems/p/os/aix/linux/toolbox/download.html)

ثم قم بتحميل ملف الـ bash أو قم بتركيبه بشكل مباشر من الأنترنت من خلال الأمر التالي:

```
rpm -ivh link2BASH
```

الآن قم بتحرير الملف:

```
vi /etc/security/login.cfg
```

وأذهب الى المتغيير:

```
shells =
```

وأضف أليه التالي:

```
/usr/bin/bash
```

قن بحفظ الملف وغلقه. بعد ذلك أذهب مباشرة وقم بتنفيذ الأمر:

```
smitty user
```

ومن ثم قم بإختيار الخيار:

```
Change / Show Characteristics of a User
```

وقم بإختيار المستخدم الذي تريد أن تعدل في خصائصه … بالنسبة لي سأختار المستخدم root والضغط على Enter.

```
User NAME                                          [root]
```

الآن أذهب الى الخيار INITIAL PROGRAM والذي هو بالأساس:

```
Initial PROGRAM                                    [/usr/bin/ksh]
```

Korn Shell وقم بتغييره الى الـ BASH كما يلي:

```
Initial PROGRAM                                    [/usr/bin/bash]
```

الآن قم بالضغط على Enter ستخرج لك الرسالة التالية:

```
Command: OK            stdout: no            stderr: no
Before command completion, additional instructions may appear below.
```

كما نلاحظ جواب الأمر Command هو OK وهذا يعني ﻻ يوجد مشاكل … لو كنت لم تقم بتحرير الملف:

```
/etc/security/login.cfg
```

ووضع الـمتغيير الخاص بالـ BASH هناك لكان الناتج هو:

```
Command: failed        stdout: yes           stderr: no
Before command completion, additional instructions may appear below.
3004-703 Check "/etc/security/login.cfg" file.
3004-692 Error changing "shell" to "/usr/bin/bash" : Value is invalid.
```

وكما نلاحظ من الناتج يمكنك أن تعرف بإنه المشكلة هي إنك لم تقم بإضافة المتغيير حق الـ BASH ولكن نحن بسبب إضافته للملف هذا لم تخرج لنا هذه الرسالة … بعد ذلك أعمل Logout من المستخدم وأدخل مرة أخرى وقم بتشغيل الـ Terminal ستجده الحين يستعمل الـ BASH بدل من الـ Korn Shell التي تجيبلك جلطة  ::18

ودمتم …
