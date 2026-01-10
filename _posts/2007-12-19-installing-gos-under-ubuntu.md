---
title: "تنصيب gOS على Ubuntu"
date: 2007-12-19 11:02:29 -0500
categories: ["GNU/Linux"]
permalink: "/2007/12/19/installing-gos-under-ubuntu/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

![](/assets/img/posts/2007/gos_desktop.jpg)

أليكم أخواني طريقة تنصيب كل من الـ gOS حق Google على نفس نسخة الـ Ubuntu التي لديك ومن دون أن تقوم بتحميل كامل النظام …

تابع معي وقم بعمل التالي:

```
vi /etc/apt/sources.list
```

بعد ذلك أضف للملف الذي حررته السطور التالية:

```
deb http://packages.thinkgos.com/gos/ painful main
deb-src http://packages.thinkgos.com/gos/ painful main
```

قم بحفض وغلق الملف وأرجع الى سطر الأوامر ونفذ التالي:

```
wget http://www.thinkgos.com/files/gos_repo_key.asc
```

وبعدها التالي:

```
apt-key add gos_repo_key.asc
```

وبعدها قم بعمل تحديث للمكتبات التي لديك من خلال الأمر التالي:

```
apt-get update
```

وأخيراً قم بتنصيب الـ gOS من خلال التالي:

```
apt-get install greenos-desktop
```

![](/assets/img/posts/2007/gos_modules.png)

![](/assets/img/posts/2007/gos_about.png)

لمزيد من المعلومات حول النظام راجع الموقع الرسمي من هنا —-> [أضغط هنا](http://www.thinkgos.com/)

تحياتي الحارة للجميع …

أخوكم B!n@ry …
