---
title: "تنصيب خطوط الـ MS True Type"
date: 2007-09-08 22:20:01 -0500
categories: ["GNU/Linux"]
permalink: "/2007/09/08/install-ms-true-type-fonts/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

لتنصيب خطوط MicroSoft TrueType Fonts  على نظامك قم بالتالي:

في سوزي:

```
smart install msttcorefonts
```

في أوبنتو:

```
apt-get install msttcorefonts
```

أو قم بتحميل ملف الــ Specs من [هنا](http://corefonts.sourceforge.net/msttcorefonts-2.0-1.spec) بعد ذلك قم بتنفيذ التالي:

```
rpmbuild -bb msttcorefonts-2.0-1.spec
```

حيث سيقوم الأمر الذي بالأعلى بتحميل الملف msttcorefonts من موقع الــ SourceForge …  بعد ذلك قم بتنصيب الملف الذي نتج ويكون كالتالي:

```
rpm -ivh msttcorefonts-2.0-1.noarch.rpm
```

بعد ذلك تحتاج إما الى عمل Logout ومن ثم Login أو تعمل:

```
/sbin/service xfs reload
```

أو قم بعمل إعادة للكاش حق الخطوط بالأمر التالي:

```
fc-cache -fv
```

لمزيد من المعلومات من هنا:

[المرجع](http://corefonts.sourceforge.net/)

أخوكم B!n@ry …
