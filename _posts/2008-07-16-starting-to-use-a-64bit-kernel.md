---
title: "التحول لإستخدام كيرنل 64bit"
date: 2008-07-16 14:22:12 -0500
categories: ["Unix"]
permalink: "/2008/07/16/starting-to-use-a-64bit-kernel/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

لتحويل النظام AIX لديك من العمل على نواة 32bit  الى نواة 64bit يجب أن نتأكد من نوع النواة التي تعمل بالوقت الحالي من خلال الأمر:

```
getconf KERNEL_BITMODE
```

ومن ثم نقوم بعمل الـ links التالية:

```
ln -fs /usr/lib/boot/unix_64 /unix
ln -fs /usr/lib/boot/unix_64 /usr/lib/boot/unix
```

لعمل الـ Boot Image ننفذ الأمر:

```
bosboot -ad/dev/ipldevice
```

بعد ذلك قم بعمل إعادة تشغيل للنظام … أو نفذ الأمر التالي:

```
shutdown -Fr
```

وخلاص صار عندك 64bit هو الي شغال …

دمتم بود …
