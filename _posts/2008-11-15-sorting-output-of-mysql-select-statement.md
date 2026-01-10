---
title: "عمل فرز للمعلومات المستخرجة في MySQL"
date: 2008-11-15 14:47:19 -0500
categories: ["Database"]
permalink: "/2008/11/15/sorting-output-of-mysql-select-statement/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

لنفرض تريد عمل فرز أو بالأنجليزي SORT لجدول معيين … فسنقوم بذلك من خلال الأمر التالي:

```
SELECT * FROM names ORDER BY lastname;
```

سيقوم الأمر السابق بترتيب المخرجات بناءاً على الحقل الخاص بـ lastname … وهكذا قمنا بعمل فرز للمخرجات في MySQL … مثال آخر:

```
SELECT * FROM names ORDER BY city;
```

سيقوم الأمر السابق بترتيب المخرجات بناءاً على الحقل الخاص بـ city …

ودمتم …
