---
title: "Simple Conficker Scanner v2"
date: 2009-04-18 11:19:11 -0500
categories: ["Cybersecurity"]tags: ["Conficker", "Honeynet", "Python", "Scanner"]
permalink: "/2009/04/18/simple-conficker-scanner-v2/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

جماعة مشروع الـ [Honeynet](http://www.honeynet.org/) قاموا بعمل برنامج بسيط مبرمج بالبايثون (يا حلاتك يالبايثون ::bgrim::) وذلك لإكتشاف الأجهزة التي أصيبت بالدودة Conficker أم لا … تم عملها تحت رخصة GPL ولهذا تستطيع أخذها والتعديل عليها … أضغط [هنا](http://www.honeynet.org/node/397) لقراءة المزيد …

لتحميلها | أضغط [هنا](http://four.cs.uni-bonn.de/uploads/media/scs2.zip) …

لتشغيلها:

python scs2.py 172.16.0.1 192.16.0.245

أي سنقوم بفحص الأجهزة التي عنوان الـ IP لها يبدأ بـ 172.16.0.1 مروراً الى العنوان 192.16.0.245 …

أيضاً المطورين قاموا بعمل نسخة للفحص من خلال الأنترنت | [أضغط](http://four.cs.uni-bonn.de/fileadmin/user_upload/werner/cfdetector/) للتجربة …

تود معرفة معلومات أخرى حول Conficker وطرق إكتشافها وأمور أخرى؟ تفضل | أضغط [هنا](http://four.cs.uni-bonn.de/wg/cs/applications/containing-conficker/) …

إن شاء الله تفيدكم …
