---
title: "إضافة جداول وبيانات اليهم في MySQL"
date: 2008-11-15 10:59:57 -0500
categories: ["Database"]
tags: ["mysql"]
permalink: "/2008/11/15/creating-table-and-inserting-data-into-the-mysql-table/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

بعد أن رأينا كيف[نعمل القاعدة](/assets/files/2008/adding-database-and-giving-privileges-to-user-in-mysql.bin.bin) و[كيف نقوم بالعمل عليها](/assets/files/2008/working-with-mysql-databases-and-tables.bin.bin) … سنقوم بأول خطوة عمل بعد **[إختيارنا للقاعدة المراد العمل عليها](/assets/files/2008/working-with-mysql-databases-and-tables.bin.bin)** وهي إضافة الجداول التي نريدها لهذه القاعدة … يمكن عمل ذلك من خلال الأمر:

```
create table names ( firstname varchar(20) not null, 
lastname varchar(20) not null, city varchar(20) not null);
```

هكذا بعد أن قمنا بإضافة الجداول firstname و lastname و city ونوعهم هو varchar  نستطيع الآن إضافة البيانات أليه … الصيغة العامة لعمل ذلك هي:

```
INSERT INTO tablename VALUES ( Val1, Val2, Val3, etc);
```

الآن لنضيف الى الجدول الذي عملنا بالخطوات السابقة:

```
INSERT INTO names VALUES ('Mohammed', 'Ali', 'Baghdad St');
```

لنقم بإضافة سطر آخر الى القاعدة لتجارب قادمة:

```
INSERT INTO names VALUES ('Samer', 'Haddad', 'Riyadh St');
```

هكذا أضفنا الى الجدول names الأسم Mohammed الى عامود firstname و Ali الى عامود lastname و Baghdad St الى عامود city … الآن لو نفرض تريد عرض المعلومات هذه، ما عليك إلا تنفيذ التالي:

```
SELECT * FROM names;
```

وهكذا أضفنا جداول وبيانات أليه … لمن يريد يعرف أنوع الحقول في الجداول ونوعية البيانات عليه مراجعة هذه:

[Chapter 10. Data Types](http://dev.mysql.com/doc/refman/5.0/en/data-types.html)

ودمتم …
