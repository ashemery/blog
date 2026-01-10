---
title: "هل القرص الصلب الذي لديك SATA 1 أم SATA 2 ؟"
date: 2007-10-13 15:16:45 -0500
categories: ["Snippets"]
permalink: "/2007/10/13/what-harddisk-do-you-have-sata1-or-sata2/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

لمعرفة إن كان القرص الصلب الخاص بك يعمل على تقنية SATA 1 أم SATA 2 … كل ما عليك عمله هو تنفيذ الأمر التالي:

```
hdparm -I /dev/sda | grep SATA
```

إذا كان الناتج هو:

```
*    SATA-I signaling speed (1.5Gb/s)
*    SATA-II signaling speed (3.0Gb/s)
```

هذا يعني إن القرص الصلب Hard Disk لديك بإمكانه العمل على SATA 1 وعلى SATA 2 … أما إذا كان فقط 1.5Gb/s هذا يعني SATA 1 فقط …

أخوكم B!n@ry …
