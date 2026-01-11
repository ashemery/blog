---
title: "نظف نظامك بواسطة FSlint"
date: 2008-04-12 10:12:54 -0500
categories: ["Software/Tools"]
permalink: "/2008/04/12/clean-your-system-using-fslint/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

الخدمات التي يقدمها لك نظام جنو/لينوكس ﻻ تعد وﻻ تحصى … واليوم وجدت مكنسة كهربائية خاصة بالنظام تقوم هذه المكنسة بتنظيف النظام من الملفات lint … أمثلة على ذلك:

– الملفات المتشابهة

– المجلدات الفارغة

– الأسماء الخاطئة

– الملفات المؤقتة Temp Files

– الـ ID’s الخاطئة أو فيها مشاكل

– الـ Symlinks الخاطئة أو فيها مشاكل

– شوف بنفسك

صورة:

![](/assets/img/posts/2008/fslint.png)

لتنصيب البرنامج على توزيعة فيدورا:

```
svn checkout http://fslint.googlecode.com/svn/trunk/ fslint-2.25;
tar czf fslint-2.25.tar.gz --exclude=.svn fslint-2.25;
rpmbuild -ta fslint-2.25.tar.gz;
rpm -Uvh /usr/src/redhat/RPMS/noarch/fslint-2.25-1.noarch.rpm;
```

بالنسبة لباقي التوزيعات قم بزيارة الموقع الرسمي جميع الخطوات هناك …

[.: الموقع الرسمي :.](http://www.pixelbeat.org/fslint/)

لتشغيل البرنامج:

**Applications -> System Tools -> FSlint**

أو من سطر الأوامر نفذ:

```
fslint-gui
```

إن شاء الله يعجبكم البرنامج ... صراحة جميل للغاية ... ومفيد للغاية ... وبسيط للغاية ...

وللغاية هذي دمتم بود ...

[للنقاش حول الموضوع راجع مجتمع لينوكس العربي من هنا](https://www.linuxac.org/forum/showthread.php?t=10054)
