---
title: "السماح للـ Virtual Ethernet Adapter بدخول Promiscuous Mode"
date: 2011-08-01 02:32:01 -0500
categories: ["GNU/Linux", "Networks", "Snippets", "Virtualization"]
tags: ["Promiscuous Mode", "Virtual Ethernet Adapter"]
permalink: "/2011/08/01/%d8%a7%d9%84%d8%b3%d9%85%d8%a7%d8%ad-%d9%84%d9%84%d9%80-virtual-ethernet-adapter-%d8%a8%d8%af%d8%ae%d9%88%d9%84-promiscuous-mode/"
reading_time: 1
---

دخول بطاقة الشبكة في حالة Promiscuous Mode مسموح فقط حين يكون للمستخدم الذي طلب الدخول أليه بصلاحيات root على جنو/لينُكس … وبالتالي الأجهزة التخيلية (Virtual Machines) التي تعمل بداخل VMWare والتي تريد الدخول الى هذه الحالة يجب ان تحصل على صلاحيات من المشغل الأصلي للنظام … أي تحصل على صلاحيات السماح بذلك من قبل الـ Host نفسه …

على كل حال، عملية التحويل الى ذلك، ليست صعبة ويمكن عمل ذلك من خلال الخطوتين التاليتين:

```
chgrp newgroup /dev/vmnet0
chmod g+rw /dev/vmnet0
```

هذه لإعطاء المستخدمين في المجموعة newgroup إمكانية الدخول الى حالة Promiscuous Mode … أما إن كنت تريد إعطاء جميع المستخدمين ذلك؟ كل الذي عليك فعله هو:

```
chmod a+rw /dev/vmnet0
```

لمزيد من المعلومات: [أضغط هنا](http://vmware.com/info?id=161)

من يستعمل VMWare في تجاربه سيحتاج الى هذه الطريقة ولهذا تم تدوينها من باب الرجوع أليها عند الحاجة …
