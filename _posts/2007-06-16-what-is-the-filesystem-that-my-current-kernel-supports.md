---
title: "ما هي الـ Filesystem التي يدعمها الكيرنل الحالي ؟"
date: 2007-06-16 10:59:04 -0500
categories: ["Kernel"]
permalink: "/2007/06/16/what-is-the-filesystem-that-my-current-kernel-supports/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

درس سريع خفيف لطيف مش راح ياخذ منكم سوى أمر واحد بس  ::18

سؤال يتداور في أذهان الكثيرين: كيف يمكنني أن أعرف ما هي نظام الملفات filesystems التي يدعمها الكيرنل الذي يعمل عندي حالياً ؟

إجابة بسيطة جداً، قم بتنفيذ الأمر التالي:

```
$ cat /proc/filesystems
```

سيكون الناتج مشابه لهذا تقريباً:

```
nodev   sysfs
nodev   rootfs
nodev   proc
nodev   tmpfs
nodev   pipefs
nodev   eventpollfs
nodev   devpts
nodev   ramfs
nodev   devfs
nodev   ext3
nodev   usbfs
nodev   usbdevfs
vfat
```

ولهذا لا تسألني بعد اليوم هل نظامي يدعم الـ NTFS أم لا ::18

أخوكم B!n@ry …
