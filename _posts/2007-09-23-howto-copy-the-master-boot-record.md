---
title: "كيفية نسخ الـ MBR"
date: 2007-09-23 13:13:27 -0500
categories: ["Snippets"]
permalink: "/2007/09/23/howto-copy-the-master-boot-record/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

لنسخ الــ Master Boot Record حق الــ Hard Disk لجهازك قم بتنفيذ الأمر التالي:

```
dd if=/dev/hda of=/home/user/Desktop/mbr_backup \
bs=512 count=1
```

حيث يكون الهارد هنا من نوع IDE ولهذا كان إسمه hda لو كان الهارد عندك SATA سيكون إسمه غالبا هو sda …

هذي يفيدك لأخ نسخة إحتياطية منه وفي حالة خرابه بإمكانك إرجاعه الى الجهاز مرة أخرى كالتالي:

```
dd if=/home/user/Desktop/mbr_backup of=/dev/hda \
bs=512 count=1
```

في حالة كان جهازك من نوع SATA النسخ الإحتياطي له سيكون كالتالي:

```
dd if=/dev/sda of=/home/user/Desktop/mbr_backup \
bs=512 count=1
```

إن شاء الله يفيدكم …

أخوكم B!n@ry …
