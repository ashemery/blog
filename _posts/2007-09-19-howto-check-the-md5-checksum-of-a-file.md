---
title: "كيفية فحص ملف الــ MD5 checksum"
date: 2007-09-19 23:02:52 -0500
categories: ["Snippets"]
permalink: "/2007/09/19/howto-check-the-md5-checksum-of-a-file/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

لنفرض قمت بتنزيل توزيعة لينوكس من الأنترنت وتريد تتأكد من سلامت تنزيلها … كل ما عليك فعله هو:

```
md5sum -c LinuxDistro.iso.md5
```

طبعاً الملف LinuxDistro.iso.md5  هو الملف الــ MD5 Checksum التابع للملف LinuxDistro.iso وكلا الملفين في نفس المجلد …

لو كنت تريد أن تصنع ملف الـ MD5 كل ما عليك عمله هو التالي:

```
md5sum LinuxDistro.iso > LinuxDistro.iso.md5
```

أخوكم B!n@ry …
