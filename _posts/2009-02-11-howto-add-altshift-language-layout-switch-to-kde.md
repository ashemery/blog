---
title: "HOWTO add Alt+Shift Language Layout Switch to KDE"
date: 2009-02-11 04:14:20 -0500
categories: ["GNU/Linux"]
tags: ["BackTrack", "KDE", "Keyboard Layout", "Language", "Switch"]
permalink: "/2009/02/11/howto-add-altshift-language-layout-switch-to-kde/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

في الفترة الأخيرة وجدت الكثير من الأخوة يستفسرون عن كيفية إضافة التحكم في التغيير باللغات من الأنجليزية الى اللغة العربية والعكس في توزيعة BackTrack بالتحديد أو أي توزيعة أخرى تستعمل KDE … ولهذا قلت أرجع أكتب مرة أخرى هذا الموضوع في تدوينة منفصلة لعل وعسى ينتهي معها هذا السؤال …

بالبداية لنقم بتحرير الملف الذي يهمنا kdeglobals من خلال تنفيذ الأمر التالي:

```
vi /root/.kde/share/config/kdeglobals
```

الآن أبحث عن السطر التالي بداخله:

```
Switch to Next Keyboard Layout
```

فقم بتغييره الى التالي:

```
Switch to Next Keyboard Layout=Alt+Shift_L;Alt+Shift_R
```

الآن قم بحفظ الملف والخروج منه … بعض الأحيان تحتاج بعد ما فعلناه الى القيام بعمل Logout ومن ثم Login وذلك لكي يقوم X بإعادة قراءة الإعدادات الجديدة وبعض الأحيان لا … بالنسبة لي لم أحتاج الى ذلك ::18

إن شاء الله تفيدكم هذه التدوينة البسيطة … ودمتم بود …
