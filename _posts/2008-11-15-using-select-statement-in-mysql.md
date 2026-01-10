---
title: "عرض البيانات التي بداخل قواعد MySQL"
date: 2008-11-15 11:16:29 -0500
categories: ["Database"]
tags: ["mysql"]
permalink: "/2008/11/15/using-select-statement-in-mysql/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

لعرض البيانات التي بداخل الجداول علينا كما سبق وذكرنا أن نقوم بإختيار القاعدة ومن ثم مثلاُ لعرض جميع محتويات الجدول names الذي عملنا في الدرس السابق ننفذ الأمر:

```
SELECT * FROM table;
```

ولعرض سطر معيين في الجدول مثلاً السطر الذي فيه الأسم Ali سنعمل:

```
SELECT * FROM names WHERE lastname="Ali";
```

لعرض عامود واحد من أعمدة جدول، مثل جدول names لعرض عامود واحد فقط:

```
SELECT firstname FROM names;
```

لعرض جدولين محددين:

```
SELECT firstname, city FROM names;
```

لعرض السطر الذي فيه الأسم الأول Samer **أو** الأسم الأخير Haddad نعمل:

```
SELECT * FROM names WHERE firstname="Samer" 
OR lastname="Haddad";
```

أو لعرض السطر الذي فيه الأسم الأول Mohamed **و**الأسم الأخير Ali نعمل:

```
SELECT * FROM names WHERE firstname="Mohamed" 
AND lastname="Ali";
```

لإختيار عامودين مع تحديد أسم معيين، مثلا نريد عرض العامود الأول والمدينة للأسم Mohamed نعمل:

```
SELECT firstname, city FROM names 
WHERE firstname="Mohamed";
```

ودمتم …
