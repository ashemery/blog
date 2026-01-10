---
title: "Linux KeyLoggers"
date: 2008-12-17 00:49:20 -0500
categories: ["Linux Security", "Security"]
tags: ["keylogger"]
permalink: "/2008/12/17/linux-keyloggers/"
reading_time: 3
---

****

**السلام عليكم ورحمة الله وبركاته**

****

![](http://binary-zone.com/images/keylogger2.jpg)

![](http://binary-zone.com/images/keylogger.jpg)

لي فترة أجرب بعض الأمور ومن ظمنها الـ **Keyloggers** أو [Keystroke Logging](http://en.wikipedia.org/wiki/Keystroke_logging) فأحببت ان اضع هذا الموضوع البسيط حول هذه البرامج وأهميتها …

بالبداية الـ **Keylogger** هو عبارة عن **برنامج**/**جهاز** يقوم بحفظ جميع الحروف/رموز/أرقام التي تقوم بإدخالها من خلال لوحة المفاتيح. هذه الميزة بالتالي تتيح لنا فرصة عمل عدة أمور، منها:

أولاً مراقبة ما هي المدخلات التي يدخلها الشخص الذي عمل على الجهاز/الخادم.

ثانياً حفظ جميع الحروف/رموز/أرقام المدخلة لغرض الدراسة أو الأرشفة.

ثالثاً دراسة كيفية تعامل المستخدم مع النظام من خلال مراقبة ما يقوم بإدخاله.

رابعاً غير ذلك أكتشفه بنفسك ::18

بعض أنواع الـ **Keyloggers** البرمجية الموجودة والتي تعمل على جنو/لينوكس هي:

الأول: Linux Keylogger أو LKL

يعمل في بيئة المستخدم userspace من خلال sniffing وتسجيل جميع المدخلات التي يتم إدخالها من خلال المنفذ الخاص بلوحة المفاتيح (0x60)، ويقوم بعد ذلك بتحويلها الى حروف/رموز/أرقام حسب مخطط الـ ASCII الذي يستعمله.

[الموقع الرسمي/ولتحميله](http://sourceforge.net/projects/lkl/)

الثاني: THC-vlogger

هو keylogger متطور أكثر يعمل في بيئة النواة kernel space. وهو قادر على تسجيل جميع المدخلات التي تخص المستخدمين ومدراء النظام، وتسجيل المدخلات التي تتم من خلال console أو serial أو من خلال الجلسات التي عن بعد مثل telnet و ssh. تستطيع أن تطلب منه أن يرسل جميع المعلومات المسجلة الى خادم عن بعد او جهاز. أيضاً من ميزاته إنك تستطيع ان تخبره بإنك تود مراقبة فقط المدخلات الحساسة التي هي عبارة عن أسماء مستخدمين وكلمات سرية لهم.

[الموقع الرسمي/ولتحميله](http://freeworld.thc.org/releases.php?q=vlogger&x=0&y=0)

الثالث: PyKeylogger

هو keylogger تم كتابته بلغة البايثون، وكان الهدف منه أن يقوم بعمليات الأرشفة والنسخ الإحتياطي للمدخلات. ولهذا هو لا يقوم بإخفاء نفسه عن المستخدم الذي يستعمل النظام. أعتقد بالنسبة لخبراء البرمجة بلغة البايثون من السهل عليهم التلاعب به لكي يلائم إحتياجاتهم.

[الموقع الرسمي/ولتحميله](http://pykeylogger.wiki.sourceforge.net/)

رابعاً: يوجد غيرهم لكن عليك بالبحث ::18

إذا كنت تريد أن تتعلم كيف تقوم بكتابة واحد بنفسك؟ أليك هذا الشرح: [HOWTO Write Linux KeyLogger](http://packetstormsecurity.org/papers/unix/writing-linux-kernel-keylogger.txt)

بعض أشكال الـ **Keyloggers** التي على شكل جهاز/عتاد:

![](http://binary-zone.com/images/KeyShark-Hardware.jpg)

![](http://binary-zone.com/images/KeyGhost-USB.jpg)

![](http://binary-zone.com/images/keyghost-usb.jpg)

**للمزيد من المعلومات:**

[معلومات على موقع ويكيبيديا](http://en.wikipedia.org/wiki/Keystroke_logging)

[KeyGhost USB Keylogger](http://keyghostkeylogger.com/USB-Keylogger.htm)

هذا ما لدي ودمتم بود
