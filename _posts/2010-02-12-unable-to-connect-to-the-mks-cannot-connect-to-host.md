---
title: "unable to connect to the mks cannot connect to host"
date: 2010-02-12 15:04:53 -0500
categories: ["Firewalls", "Networks", "Virtualization"]
tags: ["iptables", "VMware Server 2"]
permalink: "/2010/02/12/unable-to-connect-to-the-mks-cannot-connect-to-host/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

بعد دخولك الى صفحة VMware Server 2 وتشغيل جهاز وهمي … تضغط على صفحة Console وبعدها حين تضغط على المربعات البيضاء أو الشاشة السوداء المكتوب عليها:

```
Open the console in a new window
click anywhere to open the virtual machine
```

تضغط ويفتح شاشة أمامك لكن بعد فترة بسيطة يعطيك خلل ويقول لك:

```
unable to connect to the mks cannot connect to host
```

السبب وراء ذلك هو المنفذ 903 مغلق بين جهازك الذي تتصل منه الى الخادم الذي عليه VMware Server 2 ولهذا كل الذي عليك هو فتح منفذ له لكي يستطيع العمل … تستطيع عمل ذلك بواسطة iptables وبأمر بسيط جداً … بعدها سيعمل كل شيء بشكل جيد …
