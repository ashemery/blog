---
title: "تمرير بعض المتغييرات للنواة لتنصيب Fedora 11"
date: 2009-07-31 20:07:29 -0500
categories: ["GNU/Linux", "Kernel"]
tags: ["nomodeset", "resolution", "vesa", "xdriver"]
permalink: "/2009/07/31/passing-kernel-parameters-to-install-fedora-11/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

لتنصيب توزيعة فيدورا 11 على بعض الأجهزة واجهتني مشكلة بإن الشاشة كانت دائماً تعطيني رسائل مثل:

Out of Range

Switch resolution to 1280x1024

ولهذا كنت أضطر الى تمرير بعض المتغييرات الى النواة أثناء عملية التركيب … من هذه المتغييرات كانت:

resolution=1280x1024

وأخرى

xdriver=vesa

وبعض الأحيان على بعض الأجهزة أضطر الى حذف المتغيير nomodeset … إن شاء الله ما تواجهون مشاكل مثلي :)

**تعديل:**

موضوع  مفيد في هذا الخصوص |[أضغط هنا](http://www.ojuba.org/wiki/linux/vga)|
