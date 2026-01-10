---
title: "حل مشكلة إرتفاع درجات الحرارة وإستهلاك البطارية"
date: 2012-11-02 19:29:13 -0500
categories: ["GNU/Linux", "Kernel", "Snippets"]
tags: ["power", "powertop", "pulseaudio"]
permalink: "/2012/11/02/solution-for-power-consumption-and-the-increasing-heat-of-my-laptop/"
reading_time: 1
---

من باب توثيق ما قمت به لكي أحل مشكلة إرتفاع درجة الحرارة وإستهلاك الطاقة بشكل كبير من بطارية جهازي المحمول … فإن الخطوات التي عملتها كانت التي وجدتها في هذا [الرابط](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/877560/comments/37) … وكل ما قمت به هو:

قمت بتحرير ملف:

```
vim /etc/rc.local
```

ووضعت قبل السطر الأخير exit التالي:

```
echo 1 > /sys/module/snd_hda_intel/parameters/power_save
echo Y > /sys/module/snd_hda_intel/parameters/power_save_controller
pkill /usr/bin/pulseaudio
```

هكذا بعد كل عملية تشغيل للجهاز ستكون هذه الإعدادات جاهزة … طبعاً لمعرفة مالذي يستهلك الطاقة لديك هناك أداة رائعة إسمها powertop قم بإستعمالها لإكتشاف ذلك … هذا طبعاً بالإضافة لباقي أدوات مراقبة النظام في جنو/لينُكس …
