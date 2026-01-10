---
title: "القراءة من قواعد البيانات الخاصة بالنظام !!!"
date: 2007-07-16 13:30:25 -0500
categories: ["Development"]
permalink: "/2007/07/16/using-getent-to-read-from-system-databases/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

اليوم بالصدفة إكتشتف أمراً لينوكساويياً ::18 ولا أروع هو getent حيث يساعد على قراءة المعلومات من قواعد البيانات الخاصة بالـ administration للنظام … مثل هذه القواعد هي:

```
-	passwd 
-	group 
-	services 
-	protocols 
-	aliases
-	hosts
-	shadow
-	netgroup
-	ethers
-	networks
```

حيث يمكنك إستعماله للحصول على معلومات معيينة من قاعدة من هذه القواعد بصورة مباشرة ومن دون الحاجة الى إستعمال الأمر grep …

أمثال:

```
$ getent passwd binary
$ getnet group admins
$ getent protocols igp
$ getent services telnet
```

ومن هنا نستطيع أن نقوم بإستعمال هذا الأمر في السكربتات BASH Scripts من أجل إستخراج معلومات معيينة.

أخوكم B!n@ry …
