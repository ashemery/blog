---
title: "تنصيب برامج Google في Ubuntu"
date: 2007-10-05 16:12:10 -0500
categories: ["Software/Tools"]
permalink: "/2007/10/05/install-google-software-on-ubuntu/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

![](/assets/img/posts/2007/google-ubuntu.jpg)

قبل أن نستطيع أن نقوم بعملية تنصيب لأي من برامج Google يجب علينا أن نقوم بإضافة المكتبات الخاصة بهم اولاً … ولهذا كل ما عليك فعله هو أن تتبع الخطوات معي …

أول شيء نقوم بتنزيل المفتاح حق المكتبة لهم من خلال الأمر التالي:

```
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub \
| apt-key add -
```

بعد ذلك أفتح ملف الــ /etc/apt/sources.list وضع في آخره المكتبة التالية:

```
# Google software repository
deb http://dl.google.com/linux/deb/ stable non-free
```

بعد ذلك نفذ التالي لتحديث المكتبات التي لديك:

```
apt-get update
```

لمزيد من المعلومات تابع [أضغط هنا](http://www.google.com/linuxrepositories/ubuntu704.html)

الآن لتنصيب برنامج Google Picasa حق الصور قم بتنفيذ التالي:

![](/assets/img/posts/2007/picasa.jpg)

```
apt-get install picasa
```

الآن لتنصيب Google Earth نفذ التالي:

![](/assets/img/posts/2007/google_earth.jpg)

```
apt-get install googleearth
```

الآن لتنصيب Google Desktop نفذ التالي:

![](/assets/img/posts/2007/beagle.png)

```
apt-get install google-desktop-linux
```

أخوكم B!n@ry …
