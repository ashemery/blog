---
title: Device sdb is apparently in use by the system will not make a filesystem here
date: 2012-06-20 21:00:44 -0500
categories:
- GNU/Linux
tags:
- dmsetup
- ext3
- ext4
- fstab
- logical-volume
- lvdisplay
- maintenace
- mkfsext4
- partition
- raid
- single-user-mode
- troubleshooting
- tune2fs
- uuid
- uuidgen
permalink: /2012/06/20/device-sdb-is-apparently-in-use-by-the-system-will-not-make-a-filesystem-here/
reading_time: 2
---
لدي على جهازي Partition قديم لازال يستعمل نظام ملفات ext3 وأحببت أن أحوله الى ext4 بعد أن أخذت نسخة إحتياطية من الملفات التي عليه … قمت بعمل umount للهارديسك هذا وبعد ذلك حاولت أقوم بتحويله الى ext4 ولكن لم تنفع وكان دائماً الناتج هو:

> /dev/sdb is apparently in use by the system will not make a filesystem here

قرأت على الأنترنت الكثير وكل ما قرأته كان مرتبط بالأجهزة التي عليها RAID … يعني يكون الهارديسك جزء من RAID Array ولكن أنا لا أملك مثل هذه الإعدادات وغير موجود الـ RAID لدي بالكامل … ولكي نتأكد إنه لا يوجد RAID يمكنك تطبيق التالي:

```
dmsetup ls
```

الناتج عندي:

> No devices found

وكذلك البعض قال ربما مرتبط الهارديسك بـ Logical Volume … كذلك تأكدت:

```
lvdisplay
```

الناتج عندي:

> No volume groups found

أخيراً الهارديسك كما ذكرت غير مربوط بالنظام Not Mounted وتأكيد على ذلك إضافة الى إني لغيت نقطة الإرتباط … أيضاً حين أستعمل fuser لا يعطيني شيء … بالتالي أضطررت الى إعادة تشغيل الجهاز والدخول الى  Single User Mode او Troubleshooting أو Maintenace وعمل عملية التحويل كما يلي:

**أولاً**: قمت بتوليد UUID جديد للهارديسك

```
uuidgen
```

لنفرض إنه كان:

**000000-0000000-333333-333333**

**ثانياً**: قمت بعمل فرمته للهارديسك ليصبح يستعمل ext4 بدلاً من ext3

```
mkfs.ext4 /dev/sdb1
```

**ثالثاً**: قمت بتعديل الـ UUID للهارديسك

```
tune2fs /dev/sdb1 -U 000000-0000000-333333-333333
```

أنت قم بإستبدال الـ UUID بالذي حصلت عليه من الخطوة رقم 1 …

**رابعاً**: لا تنسى تقوم بتعديل الـ UUID في ملف الـ fstab

وهكذا تم حل المشكلة عندي، وأتمنى أن لا تواجهكم أية مشاكل … زماااااااااااااااان عن مثل هذه التدوينات :)

**روابط مفيدة:** [الأول](https://www.google.jo/search?q=%2Fdev%2Fsdb+is+apparently+in+use+by+the+system+will+not+make+a+filesystem+here&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a) | [الثاني](http://www.sturge.ca/?p=108) | [الثالث](http://www.cyberciti.biz/faq/linux-finding-using-uuids-to-update-fstab/)

أراكم على خير …

(( [للنقاش](https://www.linuxac.org/forum/showthread.php/59063) ))
