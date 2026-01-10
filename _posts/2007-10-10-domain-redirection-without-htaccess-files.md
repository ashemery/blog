---
title: "تحويل الدومين من دون الـ htaccess."
date: 2007-10-10 04:00:23 -0500
categories: ["Snippets"]
permalink: "/2007/10/10/domain-redirection-without-htaccess-files/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

قد تواجهك بعض المرات مشكلة تحويل من يدخل الدومين الخاص بك الى دومين آخر مثلا ولنقول دومين فرعي … وخاصة عندما يكون من الغير مسموح لك أن تستعمل الملفات التي تسمى htaccess.

ولهذا ومن خلال البحث على النت وجدت هذه الطريقة لعلها تفيد أحدكم …

```
header ('HTTP/1.1 301 Moved Permanently');
header (’Location: http://www.linuxac.com/forum/’);
```

هذا الكود ضعه في ملف الـ index.php … لكن يجب ان يكون المستضيف يسمح بالـ php scripting … جربوه وأعطونا نتائج  ::18

أخوكم B!n@ry …
