---
title: "مراقبة الــ Process لمستخدم معين"
date: 2007-10-22 02:19:54 -0500
categories: ["Snippets"]
permalink: "/2007/10/22/monitoring-processes-of-a-specific-user/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

لمراقبة الــ Processes التي تعمل على النظام حالياً بواسطة مستخدم معيين نفذ التالي:

```
top -U USERNAME
```

مثال:

```
top -U binary
```

سيضغل برنامج الــ top ولكن يعرض لك فقط ما يعمل بواسطة المستخدم binary …
