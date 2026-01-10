---
title: "تنصيب Virtual Box على Ubuntu"
date: 2007-10-05 15:07:42 -0500
categories: ["Software/Tools", "Virtualization"]
permalink: "/2007/10/05/howto-install-virtualbox-on-ubuntu/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته …

برنامج الــ Virtual Box هو عبارة عن برنامج Emulation لعمل بيئة تخيلية لنظام داخل نظام آخر … يعني تنصيب الــ FreeBSD في بيئة خاصة في لينوكس وهكذا … البرنامج سهل الإستعمال وهو يشبه برنامج VMWare وبرنامج Qemu … الموقع الرسمي له: [أضغط هنا](http://www.virtualbox.org/)

![](/assets/img/posts/2007/virtualbox.jpg)

لتنزيل البرنامج برابط مباشر [أضغط هنا](http://www.virtualbox.org/download/1.5.0/virtualbox_1.5.0-24069-1_Ubuntu_feisty_i386.deb) طبعاّ هذه بالنسبة لمستخدمي توزيعة Ubuntu 7.04 … أو قم بإضافة المكتبة الخاصة بالبرنامج Virtual Box الى قائمة المصادر لديك من خلال التالي:

قم بفتح ملف المصادر لديك من خلال الأمر التالي:

```
vi /etc/apt/source.list
```

وقم بإضافة السطر هذا:

```
deb http://www.virtualbox.org/debian feisty non-free
```

بعد ذلك قم بتنزيل المفتاح الخاص بهم من خلال[الضغط هنا](http://www.virtualbox.org/debian/innotek.asc)

وبعد ذلك نفذ الأمر التالي:

```
apt-key add innotek.asc
```

وبعد ذلك قم بتحديث المكتبة لديك من خلال التالي:

```
apt-get update
```

وبعد ذلك لتنصيبه نفذ التالي:

```
apt-get install virtualbox
```

بالنسبة لأصحاب التوزيعات الأخرى بإمكانكم تنزيل البرنامج من خلال[الضغط هنا](http://www.virtualbox.org/wiki/Downloads)

للحصول على دليل المستخدم ولقراءة المزيد عنه والتعرف عليه [أضغط هنا](http://www.virtualbox.org/download/UserManual.pdf)

أخوكم B!n@ry …
