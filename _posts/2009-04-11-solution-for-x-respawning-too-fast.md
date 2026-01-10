---
title: "حل مشكلة x respawning too fast"
date: 2009-04-11 07:52:35 -0500
categories: ["GNU/Linux"]
permalink: "/2009/04/11/solution-for-x-respawning-too-fast/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

ظهرت اليوم عندي مشكلة عندما قمت بتركيب CentOS 5.3 وبعد إكمالي للتنصيب قمت بحذف الواجهة الرسومية بالكامل حيث بدأت تظهر رسالة على الشاشة تقول:

"init: Id "x" respawning too fast: disabled for 5 minutes."

السبب حسب ما فهمت وهو إنني لم اقم بتغيير الـ Run level الاساسي في ملف

/etc/inittab

وبقي كما هو:

id:5:initdefault:

وبسبب كون المحدد هنا 5 وهو runlevel الخاص بالواجهة الرسومية، فإن X يقوم بإستدعاء السطر:

x:5:respawn:/etc/X11/prefdm -nodaemon

بين الفترة والأخرى ولهذا تظهر عندي المشكلة … الحل فقط قم بتغيير السطر الخاص بالـ runlevel الأساسي ليصبح:

id:3:initdefault:

وبعد ذلك نفذ الأمر:

telinit q

أو

kill -SIGHUP 1

مراجع: أضغط [هنا](http://www.google.com.eg/search?q=Id+%22x%22+respawning+too+fast&ie=utf-8&oe=utf-8&aq=t&rls=com.ubuntu:en-US:unofficial&client=firefox-a)

بالتوفيق للجميع …
