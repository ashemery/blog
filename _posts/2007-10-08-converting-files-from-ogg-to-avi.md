---
title: "تحويل الملفات من نوع ogg. الى avi."
date: 2007-10-08 00:33:36 -0500
categories: ["Snippets"]
permalink: "/2007/10/08/converting-files-from-ogg-to-avi/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

من خلال الدروس التي بدأ[مجتمع لينوكس العربي](https://www.linuxac.org) تقديمها أعطاني أحد الأخوة هناك الطريقة هذه وأحببت أن أضيفها الى المدونة عسى تفيد أحد المارين من هنا … وهي طريقة تحويل الملف من نوع ogg. الى avi. … الطريقة سهلة جداً … وهي كما يلي:

```
mencoder /path2file/video.ogg -ovc lavc -oac mp3lame -o \
/path2output/video.avi
```

إسم العضو هو [detective linux](https://www.linuxac.org/forum/member.php?u=4429) وكان هذا في الموضوع [شرح إستعمال الـ Gaim](https://www.linuxac.org/forum/showthread.php?t=6330) شكراً ﻷخونا على هذه الطريقة … وأتمنى تفيد أحدكم …

أخوكم B!n@ry …
