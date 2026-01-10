---
title: "برنامج Compiz-Switch الرائع"
date: 2008-01-10 13:11:19 -0500
categories: ["Software/Tools"]
permalink: "/2008/01/10/compiz-switch/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته …

![](/assets/img/posts/2008/compiz-switch-gnome.png)

Compiz-Switch هو عبارة عن برنامج بسيط وظيفته الأساسية إيقاف وتشغيل الـ Compiz

إذا كان Compiz يعمل وتقوم بتشغيل البرنامج هذا سيقوم بإيقاف الـ Compiz وتحويلك الى الـ Window Manager الآخر الموجود عنك … مثلاُ في GNOME سيعيدك الى Metacity وهكذا … وإن كان الـ Compiz ﻻ يعمل سيقوم هو بتشغيله بدل من الـ Window Manager الشغال حالياً … مثلاً شغال الـ Kwin حق KDE سيقوم بغلقه وتشغيل Compiz بدلاً منه …

مطور هذا البرنامج الجميل هو [Forlong](http://forlong.blogage.de/) وقام بعمل هذه الإضافة الى التوزيعات التالية:

1- كل من Ubuntu Gusty و Ubuntu Fesity و Kubuntu و Xubuntu …

2- وأيضاً لـ SUSE لكنه يذكر بإنه لم يقم بالتجربة بعد …

3- والكود حقها source ولهذا تستيطيع أن تركبها أنت على توزيعتك المفضلة …

الصفحة الرئيسية للبرنامج هي —-> [أضغط هنا](http://forlong.blogage.de/article/2008/1/6/Compiz-Switch---an-easy-way-to-switch-Compiz-off-and-on)

لتنزيل البرنامج أذهب الى الصفحة —> [هذه](http://forlong.blogage.de/article/pages/Compiz-Switch)

أو لتنزيلها بشكل مباشر للأوبنتو وربعها —-> [أضغط هنا](http://blogage.de/files/1393/download?compiz-switch_0.2.0~ubuntu_i386.deb)

لتنزيلها للسوزه مباشرة —-> [أضغط هنا](http://blogage.de/files/1383/download?compiz-switch-0.2.0~suse.tar.gz)

لتنزيل المصدر مباشرة —-> [أضغط هنا](http://blogage.de/files/1382/download?compiz-switch-0.2.0~source.tar.gz)

إن كنت تريد طلب عمل نسخة من البرنامج لتوزيعتك قم بطلبها من —-> [بالضغط هنا](http://forum.compiz-fusion.org/showthread.php?t=6463)

لتركيبها على أبونتوا وربعها نفذ التالي:

```
dpkg -i compiz-switch_0.2.0~ubuntu_i386.deb
```

لتركيبها على سوزه قم بعمل:

```
make install
```

فقط وذلك ﻷنه عامل كونفيغ لها وجاهز وجاهز الـ make file حقها …

لتركيبها على أي توزيعة أخرى بدون شك هكذا:

```
./config; make; make install
```

لتشغيل هذا البرنامج في GNOME أعمل:

```
Applications → Accessories → Compiz-Switch
```

لتشغيل هذا البرنامج في KDE أعمل:

```
K-menu → Utilities → Compiz-Switch
```

![](/assets/img/posts/2008/compiz-switch-kde.png)

ستجد إنها ستعمل وتنفذ الوظيفة التي قلت لكم عنها وهي غلق/تشغيل الكومبيز …

لو كنت تريد وضع زر لغلق الكومبيز وتشغيله قم بسحب الأيقونة من المسارات التي ذكرتها لكم في الأعلى وقم بوضعها على الـ panel سواءاً حق الـ GNOME أو KDE وكلما أردت غلق الكومبيز أضغط عليها ولتشغيلها أضغط عليها أيضاً :)

إن شاء الله يعجبكم …

دمتم بود …
