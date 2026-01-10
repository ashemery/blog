---
title: "كيفية إيقاف عمل الـ X أو إعادة تشغيله"
date: 2007-11-22 01:23:40 -0500
categories: ["Snippets"]
permalink: "/2007/11/22/howto-stop-x-from-runing-and-restart-x/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

بعض الأحيان تريد وقف عمل الـ X أو الـ X Window أو الـ X Server كلها تشير الى النظام الخاصة بالواجهة الرسومية في لينوكس … لوقف عملها ممكن تقوم بتغيير الــ [Run Level](/assets/files/2007/asset) الى مستوى ﻻ يعمل فيه الــ X كما في الــ Run Level 3 … يتم ذلك بهذه الطريقة:

```
init 3
```

أو إذا كنت تريد وقفه ممكن تجرب هذه:

```
/etc/init.d/gdm stop
```

أو تضغط على Alt+Ctrl+Backspace حيث سيقوم بعمل Kill للواجهة الرسومية وإعادة تشغيلها … يعني ينفذ الأمر:

```
/etc/init.d/gdm restart
```

طيب لو نفرض حصل فيه مشكلة وتريد إعادة تشغيله ؟ كل ما عليك فعله هو:

```
/etc/init.d/gdm restart
```

طيب ماذا لو كنت على Run Level 3 وأريد تشغيله ؟ هناك عدة طرق منها:

```
startx
```

أو

```
init 5
```

أو

```
/etc/init.d/gdm start
```

أخوكم B!n@ry …
