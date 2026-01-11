---
title: "إضافة Grub Splash Image"
date: 2007-09-08 20:14:55 -0500
categories: ["Kernel"]
permalink: "/2007/09/08/howto-add-grub-splash-image/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

![](/assets/img/posts/2007/1.jpg)

إذا كنت تريد أن تضيف صورة لبرنامج الـ Grub وتظهر لك عند بداية تشغيل الجهاز نفذ ما يلي:

أول شي نقوم بعملية تنزيل للصور من خلال الأمر التالي:

```
apt-get install grub-splashimages
```

سيقوم الأمر بالأعلى بتخزين الصور الى هذا المجلد:

```
/boot/grub/splashimages
```

بعد ذلك نفذ:

```
cd /boot/grub
```

ومن ثم:

```
ln -s splashimages/einsten.xpm.gz splash.xpm.gz
```

وبعد ذلك نفذ:

```
update-grub
```

وكل شي يكون أنتهى … إن كنت تريد صور أخرى قم بتحميل أي من هذه الصور:

[أضغط هنا](https://www.binary-zone.com/files/splashImages)

وبعد ذلك قم بتنفيذ الأمر الذي بالأعلى الذي يبدأ بــ ln ولكن مع تغيير أسم الصورة المختارة … وبالأخير ﻻ تنسى أن تقوم بتنفيذ الأمر:

```
update-grub
```

بالتوفيق يا شباب …

أخوكم B!n@ry …
