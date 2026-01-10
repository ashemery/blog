---
title: "طرق تشغيل سيرفر MySQL"
date: 2007-11-23 20:50:10 -0500
categories: ["Database"]
permalink: "/2007/11/23/howto-start-mysql-server/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

لتشغيل سيرفر MySQL هناك عدة طرق … الطريقة الأولى هي:

```
/etc/init.d/mysqld start
```

حيث هذه هي الطريقة الشائعة على أغلب توزيعات جنو/لينوكس ﻷنها طريقة الـ System V … طريقة خاصة بتوزيعة Red Hat و Fedora و CentOS هي كالتالي:

```
service mysqld status
```

طريقة التشغيل على توزيعة openSUSE أو SLES هي:

```
rcmysqld start
```

وهناك طريقة أخرى هي طريقة التشغيل التي يفضلونها مطوري السيرفر MySQL هي:

```
/usr/bin/mysqld_safe &
```

للتأكد من كلامي حول الأمر الأخير أقرأ الـ man mysqld …

أخوكم B!n@ry …
