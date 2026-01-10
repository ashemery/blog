---
title: "أخذ Snapshot من ناتج الأمر top"
date: 2007-10-22 02:27:54 -0500
categories: ["Snippets"]
permalink: "/2007/10/22/taking-a-snapshot-from-the-top-commands-results/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

بعض الأحيان تريد أن تقوم بعملية تدقيق مثلاً للبرامج التي تعمل … أو أخذ Snapshot من ناتج الأمر top لدراستها على مهل … كل ما عليك فعله هو التالي:

```
top -n 1 -b > /path2dir/top_snapshot
```

بعد ذلك أعرضه بأي برنامج مثلاً

```
more /path2dir/top_snapshot
```
