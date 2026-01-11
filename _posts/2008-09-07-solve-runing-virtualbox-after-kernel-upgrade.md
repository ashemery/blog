---
title: "حل مشكلة تشغيل VirtualBox بعد ترقية النواة في أوبنتو"
date: 2008-09-07 12:07:53 -0500
categories: ["Kernel", "Virtualization"]
permalink: "/2008/09/07/solve-runing-virtualbox-after-kernel-upgrade/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

صراحة بعد بحث وعناء طويل وجدت أخيراً الحل لتشغيل برنامج الـ VirtualBox بعد أن تقوم بعملية Upgrade للنواة الموجودة عندك … في السابق حين تقوم بترقية النواة، وتعيد تشغيل الجهاز بالنواة الجديدة وتذهب لتشغيل الـ VirtualBox تظهر لك المشكلة التالية:

```
VirtualBox kernel driver not installed. 
The vboxdrv kernel module was either not loaded or
/dev/vboxdrv was not created for some reason. 
Please install the virtualbox-ose-modules package
for your kernel, e.g. virtualbox-ose-modules-generic..
```

مع رسالة خطأ أخرى بالطبع … الآن لحل هذه المشكلة وخاصة لمن قام بتركيب الـ VirtualBox من المخازن التي تاتي مع أوبنتو نفسها، عليك أن تفعل التالي:

أفتح الطرفية ونفذ الأوامر هذه كلها بالترتيب:

```
sudo apt-get install virtualbox-ose-source
```

ثم هذا:

```
sudo module-assistant update
```

ثم هذا:

```
sudo module-assistant prepare
```

ثم هذا:

```
sudo module-assistant a-i virtualbox-ose
```

وأخيراً هذا:

```
sudo /etc/init.d/vboxdrv restart
```

والآن أذهب وقم بتشغيل الـ VirtualBox وستكون مشكلة المودويلات الخاصة بالنواة الجديدة قم تم حلها والحمد لله … المشكلة الحقيقية هي إنه جماعة أوبنتو آخر تحديث لحزمة virtualbox-ose-modules هي الرقم virtualbox-ose-modules-2.6.24-16-generic على ما اذكر ولهذا أي نواة جديدة لن تعمل بسبب عدم وجود الموديولات الجديدة لها …

على كل حال الحل هذا هو بين أيدكم وأحب أن أقدم جزيل الشكر من خلال هذا المنبر للعم الكبير Google

روابط مفيدة للقراءة والحل الأصلي:

[الأول](https://bugs.launchpad.net/ubuntu/+source/virtualbox-ose-modules/+bug/214393)

[الثاني](https://bugs.launchpad.net/ubuntu/+source/update-manager/+bug/237278/comments/12)

[الثالث](https://www.linuxac.org/forum/showthread.php?t=14998)

الموضوع نقلته من مجتمع لينوكس العربي، للنقاش حوله يرجى زيارة الموضوع التالي:[تشغيل VirtualBox بعد ترقية النواة في أوبنتو](https://www.linuxac.org/forum/showthread.php?t=14998)

دمتم بود
