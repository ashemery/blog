---
title: "كيفية تنصيب أي واجهة رسومية في Ubuntu"
date: 2007-10-06 16:31:12 -0500
categories: ["GNU/Linux"]
permalink: "/2007/10/06/howto-install-any-graphical-environment-under-ubuntu/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

ربما قمت بتنزيل توزيعة Ubuntu والتي تستعمل الــ GNOME كواجهة رسومية Desktop Environment لها … وكنت تريد أن تجرب الواجهة الرسومية KDE أو XFCE … كيف ستقوم بذلك ؟ الحل بسيط جداً … فقط قم بإختيار الواجهة المطلوبة وذلك من خلال التالي:

Ubuntu يعني واجهتها هي GNOME

Kubuntu يعني واجهتها هي KDE

Edubuntu يعني واجهتها هي GNOME

Xubuntu يعني واجهتها هي XFCE

الآن بعد إختيارك الواجهة المطلوبة نفذ أحد الآتي:

لتنصيب GNOME نفذ التالي:

```
aptitude install ubuntu-desktop
```

لتنصيب KDE نفذ التالي:

```
aptitude install kubuntu-desktop
```

لتنصيب GNOME نفذ التالي:

```
aptitude install edubuntu-desktop
```

لتنصيب XFCE نفذ التالي:

```
aptitude install xubuntu-desktop
```

ﻻ تنسوا تستعملون الــ sudo في حال لم تكن المستخدم root … وقم بالإجابة بـ y على جميع الأسئلة التي يسألكم إياها البرنامج aptitude …

أخوكم B!n@ry …
