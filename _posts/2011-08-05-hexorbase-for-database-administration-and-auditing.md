---
title: "برنامج HexorBase لإدارة وتدقيق قواعد البيانات"
date: 2011-08-05 01:11:19 -0500
categories: ["Database", "Networks", "PenTest", "Security"]
tags: ["Brute Force", "cracker", "ghost-phisher", "HexorBase", "MS SQL", "MSSQL", "mysql", "Oracle", "Penetration Testing", "PostgreSQL", "SQL", "SQLite", "wifi", "الشبكات اللاسلكية", "خوادم وهمية"]
permalink: "/2011/08/05/hexorbase-for-database-administration-and-auditing/"
reading_time: 2
---

قبل يومين قمت بترجبة برنامج HexorBase والذي هو عبارة عن برنامج لإدارة قواعد البيانات المختلفة: MySQL, PostgreSQL, MS SQL, Oracle, SQLite … وكذلك لعمل تدقيق (Audit) عليها …

صراحة البرنامج رائع وبسيط في طريقة إستعماله وكذلك تنصيبه لا يحتاج الى الكثير … ممكن قراءة طريقة تنصيبه موجودة [هنا](http://code.google.com/p/hexorbase/) …

لإستعماله في عملية Audit أو إدارة لخادم معيين … كل الذي عليك فعله هو إدخال أسم المستخدم وكلمة المرور له الخاصة بقاعدة بيانات معينة، في هذا المثال سأستعمل MySQL ومن ثم الضغط على مفتاح Lock as Default Login كما في الصورة:

![](/assets/img/posts/2011/HexorBase-01.png)

ستظهر لك شاشة تطلب منك تحديد أين يوجد خادم الـ MySQL، فكل ما عليك فعله في مثالنا هذا هو العنوان المحلي 127.0.0.1 ومن ثم الضغط على OK كما في الصورة:

![](/assets/img/posts/2011/HexorBase-02.png)

هكذا ستكون أتصلت بخادم الـ MySQL ممكن تضغط الآن على Show Tables بعد أن تقوم بإختيار قاعدة البيانات التي تريد عرض محتوياتها من الأعلى … في المثال أخترت mysql ومن ثم ضغطت على Show Tables كما في الصورة:

[![](/assets/img/posts/2011/HexorBase-03.png)](/assets/img/posts/2011/HexorBase-03.png)

كذلك يمكنك تنفيذ عملياتك الخاصة، مثلاً عرض محتوى جدول المستخدمين … كل ما عليك فعله هو كتابة تعليمة الـ SQL ومن ثم الضغط على F5 لتنفيذها، كما في الصورة:

[![](/assets/img/posts/2011/HexorBase-04.png)](/assets/img/posts/2011/HexorBase-04.png)

هذا بالإضافة الى إنك تستطيع عمل Brute Force على هذه القواعد من الشاشة الرئيسية من خلال إختيار Brute Force Database Servers ومن ثم إختيار قائمة فيها أسماء مستخدمين وقائمة أخرى في كلمات السر التي تود أن تستخدمها …

صاحب أو مطور برنامج [HexorBase](http://code.google.com/p/hexorbase/)، قام بأعمال أخرى جميلة مثل:

**أولاً:** [ghost-phisher](http://code.google.com/p/ghost-phisher/) لعمل خوادم وهمية (DNS, DHCP, HTTP) …

**ثانياً:** وبرنامج [fern-wifi-cracker](http://code.google.com/p/fern-wifi-cracker/) والذي ممكن أن تستعمله في عمليات Penetration Testing على الشبكات اللاسلكية …

إذا قمت بترجبتهم لاحقاً سأكتب عنهم … الى ذلك الحين اترك تجربتهم لكم …
