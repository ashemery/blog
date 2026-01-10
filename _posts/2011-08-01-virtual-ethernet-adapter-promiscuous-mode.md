---
title: "السماح للـ Virtual Ethernet Adapter بدخول Promiscuous Mode"
date: 2011-08-01 02:32:01 -0500
categories: ["GNU/Linux", "Networks", "Snippets", "Virtualization"]
tags: ["Promiscuous Mode", "Virtual Ethernet Adapter"]
permalink: "/2011/08/01/%25d8%25a7%25d9%2584%25d8%25b3%25d9%2585%25d8%25a7%25d8%25ad-%25d9%2584%25d9%2584%25d9%2580-virtual-ethernet-adapter-%25d8%25a8%25d8%25af%25d8%25ae%25d9%2588%25d9%2584-promiscuous-mode/"
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
