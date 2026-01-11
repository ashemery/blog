---
title: تحديث Gnome Panel
date: 2007-11-24 10:24:43 -0500
categories: ["Tools", "Snippets"]
permalink: /2007/11/24/solving-gnome-panel-problem/
reading_time: 1
---
السلام عليكم ورحمة الله وبركاته …

بعض الأحيان تحصل عندك مشاكل في الـ GNOME Panel وأقصد التي في الصورة:

![](/assets/img/posts/2007/gnome-panel.png)

تبدأ بعمل Kill للـ GNOME كله وتبدأ تحذف هذي وتلك وبعض الأحيان لو أرتبكت وإنه خلاص نظامي ضاع تبدأ تعمل إعادة تشغيل وربما تعمل حتى re-Install مع العلم المشكلة سهلة جداً  ::18

أفتح الشل ونفذ التالي:

```
killall gnome-panel
```

وخلاص … شفت كيف سهلة ؟ طيب الحين عشان تحفظها خاصة لو إنك مو مفعل خاصية Save Session … أذهب الى Sessions وأعمل Save Session أو أو أو أصبر شوي ﻻ تستعجل … من الشل نفسه نفذ التالي:

```
gnome-session-save
```

أها تم حفظ الــ Session فعلاً هذا جنو/لينوكس عالم وبحر وخلك مبحر فيه وﻻ تطلع على النوافذ  ::14

أخوكم B!n@ry …
