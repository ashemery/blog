---
title: "حل مشكلة pkg-config gconf-2.0 عند عمل كومبايل"
date: 2010-07-20 20:49:07 -0500
categories: ["GNU/Linux", "Software/Tools"]
permalink: "/2010/07/20/solving-pkg-config-and-gconf-2-problem-when-compiling-a-software/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

ياهو زمن عن الكتابة … صراحة لي فعلا مدة طويلة لم اكتب شيء ولهذا قلت أكتب شيء بسيط …

بعض الأحيان عندما تريد أن تقوم بعمل كومبايل Compile لبرنامج ما تظهر لك الرسالة التالية:

```
Package gconf-2.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `gconf-2.0.pc'
to the PKG_CONFIG_PATH environment variable
No package 'gconf-2.0' found
```

الحل ببساطة كان بالنسبة لي هو تركيب الحزم التالية: GConf2-devel و ghc-gconf-devel

طبعاً كنت قبلهم قد قمت بتركيب التالي:

```
yum groupinstall "Development Tools" "Development Libraries" "Legacy Software Development"
```

ولكن لم تحل المشكلة وأنحلت بعد أن ركبت الحزم المذكورة كما يلي:

```
yum install GConf2-devel ghc-gconf-devel
```

كلامي بطبيعة الحال عن توزيعة Fedora … ولهذا لمستخدمي أوبنتو ودبيان ما عليكم سوى إيجاد اسماء هذه الحزم وتركيبها وإن شاء الله المشكلة تنحل …

للنقاش: [هنا](http://www.linuxac.org/forum/showthread.php?41928)

موفقين …
