---
title: "عمل IPS بسيط لمنع عمليات Brute Force على SSH"
date: 2008-10-12 10:00:40 -0500
categories: ["Linux Security"]
permalink: "/2008/10/12/simple-ips-for-ssh-brute-force-attacks/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

في الكتيب الذي عملته [دليل إحتراف خدمة SSH وطرق حمايتها](/assets/files/2008/ssh.html) والذي يمكنك تحميله من [هنا](http://www.binary-zone.com/?page_id=256) ذكرت العديد من الطرق في التصدي لهذه النوع من الهجمات التي على خدمة SSH … لكن الطرق لا تنحصر بما ذكرت ولازال هناك المزيد والمزيد من هذه الطرق … اليوم أحببت وضع طريقة هي من خلال إستعمالنا للجدار الناري iptables … سنقوم من خلالها فعلياً بعمل Intrusion Prevention System أي IPS بسيط وتتمثل بعمل التالي:

```
iptables -N SSHACCESS
```

```
iptables -A INPUT -p tcp --dport 22 -m state /
--state NEW -j SSHACCESS
```

```
iptables -A SSHACCESS -m recent --set --name SSH
```

```
iptables -A SSHACCESS -m recent --update --seconds 300 /
--hitcount 3 --name SSH -j DROP
```

– السطر الأول هو عمل TABLE خاص أسميناه SSHACCESS

– السطر الثاني هو من أجل عملية الـ TCP Connection Tracking حيث نريد تحويل جميع الإتصالات التي حالتها هي NEW الى الجدول SSHACCESS طبعاً القادمة الى المنفذ 22 …

– السطر الثالث تسمح لنا بعمل قائمة أطلقنا عليها إسم SSH وذلك لوضع الـ IP التي تدخل الجدول SSHACCESS

– السطر الرابع قمنا بعمل تحديث للقائمة SSH من خلال إستعمال الخيار m recent- مع الخيار update– وطلبنا إن كانت الاتصال جاء من IP رقم XXX.XXX.XXX.XXX وتكرر 3 مرات خلال 300 ثانية قم بعمل DROP له …

ملاحظة: طبعاً تستطيع التلاعب بالقيمة الخاصة بعدد المحاولات (بالمثال 3) والقيمة الخاصة بالفترة الزمنية (بالمثال 300) …

لمعرفة المزيد حول الخيار recent الرجاء قراءة:

```
man iptables
```

طبعاً ولازال عندي المزيد من الطرق لحماية SSH والبوكس الي عندك  ::18

للنقاش —-> [أضغط هنا](http://www.linuxac.org/forum/showthread.php?t=16260)

ودمتم
