---
title: "حذف وإضافة الصلاحيات للمستخدمين على قواعد MySQL"
date: 2008-11-18 14:17:22 -0500
categories: ["Database"]
tags: ["grant", "mysql", "revoke"]
permalink: "/2008/11/18/granting-and-revoking-permissions-to-users-on-mysql-databases/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

لإضافة مستخدم ولنفرض إسمه binary والسماح له بالدخول من خلال localhost على قاعدة لنفرض إسمها mydb والعمل على جميع الصلاحيات ALL نعمل التالي:

```
GRANT ALL ON mydb.* TO binary@localhost;
```

لإضافته مع صلاحيات محدودة ولنفرض فقط DELETE و INSERT و SELECT نعمل التالي:

```
GRANT DELETE, INSERT, SELECT ON mydb.* 
TO binary@localhost;
```

لرؤية الصلاحيات المضافة، قم بإختيار القاعدة mydb ومن ثم نفذ الأمر التالي:

```
SHOW GRANTS FOR binary@localhost;
```

الآن لحذف الصلاحيات من المستخدمين على قواعد MySQL نستعمل الأمر REVOKE ولنفرض نريد حذف جميع الصلاحيات التي أعطيناها للمستخدم binary في الأمثلة السابقة، سنقوم بعملها كالتالي:

```
REVOKE ALL PRIVILGES ON mydb.* FROM binary@localhost;
```

لو أردت حذف صلاحية معينة قم بإستبدالها بكلمة ALL مثلاً لو تريد حذف صلاحيات INSERT فقط ضعها بدل من ALL ونفذ الأمر …

هذا ما لدي ودمتم بود …
