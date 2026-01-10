---
title: "تفعيل الـ Promiscuous mode على جنو/لينوكس"
date: 2008-04-09 00:47:32 -0500
categories: ["Linux Security"]
permalink: "/2008/04/09/activating-network-card-promiscuous-mode/"
reading_time: 3
---

السلام عليكم ورحمة الله وبركاته

كثيراً ما يقرأ البعض منا عن مصطلح الــ Promiscuous mode طيب ما هو؟ وكيف نقوم بتفعيله على نظام جنو/لينوكس ؟

بإختصار شديد إن كارت الشبكة NIC يعمل في حالتين:

الحالة الأولى: Promiscuous mode

الحالة الثانية: unPromiscuous mode

نأتي لل Promiscuous mode في هذه الحالة يكون كارت الشبكة قادرا على قراءة جميع ال Packets التي تمر في نفس الشبكة أو نفس المجال وأقصد هنا ال Collision Domain سواءا كانت الpacket تحمل رقم ال IP الخاص بذلك الجهاز أو ﻻ أو تحمل رقم ال MAC Address أو ﻻ … لن أخوض في شرح الـ Collision Domain ﻷنه مسألة ال Collision Domain مسألة كبيرة وتحتاج الى شرح طويل لذلك سأختصر الموضوع على الجميع وأوضح معناه هنا في هذا التعريف … حيث إنه ال Collsiosn Domain للشبكات ال Flat هو جميع الخطوط المربوطة على ال Hub أو ال Hubs … كلهم يمثلون Collision Domain واحد … أما في حالة ال Switched Network ولنفرض عندي Switch واحد فإنه … كل جهاز مربوط على مدخل port على ال switch يمثل collision domain بحد ذاته … يعني لديك switch فيه 16 port إذن لديك 16 Collision Domain … لكن بالطبع ال 16 أفضل من الواحد … لكن كما قلت لا مجال لذكر هذه الأسباب الحين …

إذن بإختصار مفيد: Promiscuous mode يسمح لكارت الشبكة بقراءة جميع ال packets التي تمر من أمامه أو من خلاله سواءا كانت موجهة له أو ﻻ …

الحين ناتي الى ال unPromiscuous mode وهو أكيد سيكون عكس ما تم ذكره في الأعلى حيث يكون بإستطاعة كارت الشبكة من قراءة فقط ال packets التي هي موجهه له فقط … وهذه هي الحالة الإعتيادية للكارت بالتأكيد …

نسيت أن أذكر مسألة مهمة وهي: إنه في حالة العمل العادي unPromiscuous mode لن يقوم الكارت بمقاطعة ال CPU وإعطاءه ال Packets بينما في حالة ال Promiscuous mode سيتم مقاطعة ال CPU وإعطاءه ال Packets … هذا مهم جدا ﻷنه منها نستنتج إنه في الحالة الأولى ﻻ يوجد معالجة بينما في الحالة الثانية يوجد معالجة …

الآن لتفعيل الـ Promiscuous mode على كارت الشبكة لديك نفذ الأمر التالي:

```
ifconfig $INTERFACE promisc
```

إن كنت تريد وقف التفعيل قم بتنفيذ الأمر التالي:

```
ifconfig $INTERFACE -promisc
```

طبعا ضع بدل من INTERFACE$ الكرت الذي تريد تفعيل الخاصية هذه عليه، مثلاُ eth0 أو eth1 وهكذا …

هذه الخاصية يتم تفعيلها بصورة تلقائية لو كنت تستعمل أحد هذه البرامج:

[AirSnort](http://airsnort.shmoo.com/) | [Wireshark](http://www.wireshark.org/) | [tcpdump](http://www.tcpdump.org/) وغيرهم الكثير …

**Update:**

Another useful resource: [Tcpdump Cheatsheet](https://comparite.ch/tcpdumpcs)

الحين يسأل سائل ماذا ستفيدني هذه الخاصية؟

الجواب بسيط: ستفيدك في أمور التدقيق على الشبكة وما يسير فيها من Traffic وهنا أقصد الـ Packets وأيضاً وبدون شك مسائل الـ SNIFFING … لكن ﻻ تنسوا شباب كل هذا يعتمد على نوع الشبكة switched أو ﻻ …

ودمتم …
