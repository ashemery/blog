---
title: "ما هي أكثر 10 أوامر تستعملها ؟"
date: 2007-10-08 00:16:36 -0500
categories: ["Snippets"]
permalink: "/2007/10/08/what-is-your-most-10-used-commands/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

لمعرفة ما هي الأكثر عشر أوامر التي تسعتملها Top 10 Used Commands قم بتنفيذ الأمر التالي:

```
history | awk '{print $2}' | awk 'BEGIN {FS="|"}{print $1}' \
| sort | uniq -c | sort -n | tail | sort -nr
```

سيقوم بإظهار الـ Top 10 لكم على الـ Terminal …

أخوكم B!n@ry …
