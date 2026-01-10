---
title: "فحص وصيانة قواعد البيانات MySQL"
date: 2008-11-21 22:53:47 -0500
categories: ["Database"]
tags: ["check", "maintain", "myisam", "mysql", "repair"]
permalink: "/2008/11/21/check-and-maintain-mysql-database/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

إستكمالاً للسلسلة التي تخص قواعد MySQL أود التطرق الى كيفية عمل فحص وصيانة لقواعد البيانات MySQL والتي جداولها من نوع MyISAM بشكل أساسي أو من نوع ISAM … يتم تخزين هذه القواعد في الغالب في المسار:

```
/var/lib/mysql
```

**ملاحظة:** قبل أن تقوم بتطبيق أي من الكلام الموجود في هذه الصفحة، قم بأخذ [نسخة إحتياطية من قاعدة البيانات](/assets/files/2008/howto-make-a-backup-of-a-mysql-database) التي لديك …

وتكون القاعدة ولنفرض إسمها dbname موجودة في هذا المجلد نفسه … ولكن القاعدة هذه تكون مقسمة الى ثلاث ملفات أساسية وهي تبدأ بالأسم للقاعدة (مثلاً dbname) وتنتهي بالتالي:

```
.frm
.MYI
.MYD
```

الأولى تحتوي على التعاريف الخاصة بالجداول …

الثانية تحتوي على الديليل للجداول …

الثالثة تحتوي على البيانات، أي الـ DATA نفسها …

الآن لعمل فحص على جداول القواعد من نوع MyISAM أو ISAM نقوم [بإيقاف خدمة MySQL](/assets/files/2008/howto-start-mysql-server) من خلال الأمر:

```
mysqld stop
```

أو

```
service mysqld stop
```

أو

```
/etc/inet.d/mysqld stop
```

حسب توزيعتك … وبعدها ولنفرض القاعدة التي نريد عمل صيانة وفحص لها هي dbname والجدول المراد عمل صيانة له إسمه username ننفذ الأمر:

```
myisamchk /var/lib/mysql/dbname/username.MYI
```

إذا كنت تريد فحص جميع الجداول بأمر واحد نفذ الأمر:

```
myisamchk /var/lib/mysql/dbname/*.MYI
```

لحل مشكلة في في قاعدة (مشاكل بسيطة) قم بالتالي:

```
myisamchk -r /var/lib/mysql/dbname/username.MYI
```

إذا لم تحل المشكلة جرب هذه:

```
myisamchk -o /var/lib/mysql/dbname/username.MYI
```

إذا كانت القاعدة لديك كبيرة قم بزيادة حجم الـ buffer ونفذ الأمر السابق وذلك من خلال الأمر:

```
myisamchk -r -o --key-buffer-size=64M 
/var/lib/mysql/dbname/username.MYI
```

طبعا هناك طرق عمل صيانة وصيانة للقاعدة بشكل مباشر، أي وهي تعمل runtime سنأتي عليها لاحقاً إن شاء الله …

هذا ما لدي ودمتم بود …
