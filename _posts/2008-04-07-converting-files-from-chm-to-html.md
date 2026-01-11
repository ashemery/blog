---
title: "حول ملفاتك من chm الى html"
date: 2008-04-07 20:54:41 -0500
categories: ["Software/Tools"]
permalink: "/2008/04/07/converting-files-from-chm-to-html/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

ملفات الـ CHM هي حسب معرفتي المتواضعة هو عبارة عن إمتداد propreitery وهو تابع لشركة مايكروسوفت …

المرجع [Microsoft Compiled HTML Help](http://en.wikipedia.org/wiki/Microsoft_Compressed_HTML_Help)

الآن لتحويل أو extract كتاب مثلاً بصيغة chm كل ما عليك فعله هو تنصيب البرنامج arCHMage … ويمكنك عمل ذلك من خلال:

**توزيعة فيدورا**

```
su -C 'yum -y install archmage'
```

**توزيعة أوبنتو**

```
apt-get install archmage
```

لتحويل أو عمل extract الحين لملف لنفرض إسمه fedora-book.chm الى ملفات html قم بتنفيذ الأمر التالي:

```
archmage fedora-book.chm fedora-book
```

الحين أصبح لديك مجلد إسمه fedora-book قم بفتحه وشغل الملف index.html من خلال المتصفح وستجد الكتاب قد تم عمل تحويل له أو extract له من صيغة chm الى صيغة html …

[.: موقع البرنامج الرسمي :.](http://archmage.sourceforge.net/)

على فكرة، له مزايا ثانية قم بإكتشافها بنفسك وبإمكانك متابعة الحوار والنقاش حوله من خلال مجتمع لينوكس العربي على الرابط هذا: [أضغط هنا](https://www.linuxac.org/forum/showthread.php?p=79029)

مبروك عليك الكتاب الجديد … عاشت المصادر الحرة وتباً للإحتكارية  ::18

دمتم …
