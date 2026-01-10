---
title: "حل مشكلة الـ Automount للـ USB في فيدورا 8"
date: 2007-11-20 16:22:53 -0500
categories: ["GNU/Linux"]
permalink: "/2007/11/20/solution-for-automount-usb-problem-under-fedora-8/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

منذ أن قمت بتنصيب التوزيعة فيدورا 8 الجديدة وأواجه مشكلة في عملية Automount للـ USB بجميع أنواعها … ﻻ قادر اشغل الـ MyBook وﻻ أي USB آخر … كلهم يجب أن أعملهم بشكل يدوي لهذا قمت بشوية بحوثات وتجارب وبالأخير أكتشفت إن الحل سهل وسهل جداً ولكن ربما هي مسألة نساها مطوري التوزيعة … المهم الحل هو كالتالي:

```
/etc/init.d/haldaemon start
```

بعد ذلك أذهب الى

```
System -> Preferences -> Hardware -> Removable Drives and Media
```

وتأكد من وضع علامة صح على المربعات كما في الصورة التالية:

![](/assets/img/posts/2007/USB_solution.jpg)

وخلاص مبروك عليك نظامك الحين يعمل Automount لجميع أنواع الـ USB …

الحل تم إيجاده من خلال الذهاب الى:

```
System -> Preferences -> Hardware -> Removable Drives and Media
```

ولكن ضهرت هذه الصورة:

![](/assets/img/posts/2007/halddeamon.jpg)

عرفت إن الخدمة haldeamon مو شغالة down وقمت بتشغيلها والتجربة وظهرت بإنها الحل

**ملاحظة مهمة جداً:** الحل أنا من وضعه في fedoraforums.org عشان ما يقول شخص إن B!n@ry بيسرق من المنتديات  ::18

ياله عيشوا حياتكم مع Fedora 8 الـ Werewolf

أخوكم B!n@ry …
