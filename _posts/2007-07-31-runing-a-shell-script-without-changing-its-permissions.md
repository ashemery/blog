---
title: "تشغيل Shell Script من دون أن تغيير صلاحياتها"
date: 2007-07-31 22:06:04 -0500
categories: ["Snippets"]
permalink: "/2007/07/31/runing-a-shell-script-without-changing-its-permissions/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

ما هو معتاد عليه المستخدمين هو تغيير الصلاحيات من أجل تشفيلها، لكن هناك طريقة أخرى وهي:

```
# bash shell.sh
```

أي تقوم بتمرير السكربت shell.sh الى الشل المراد تشغيله من خلالها. أو مثال آخر:

```
# sh shell.sh
```

بدل من تغيير الصلاحيات لها كالتالي:

```
# chmod +x shell.sh
# ./shell.sh
```

مع لينوكس دائماً يوجد حلول بديلة  ::18
