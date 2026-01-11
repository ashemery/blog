---
title: Disabling Weak SSLv2 Support in Apache Server
date: 2009-07-08 01:47:35 -0500
categories:
- Linux Security
- Linux Services
- PCI Compliance
- Security
- Web Security
tags:
- pci-compliance
- ssl
- sslciphersuite
- sslprotocol
- sslv2
- sslv3
- tlsv1
permalink: /2009/07/08/disabling-weak-sslv2-support-in-apache-server/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

هذه واحدة من المشاكل التي وجدتها بعد الفحص الخارجي الذي قمت به من أجل متطلبات الـ [PCI Compliance](/assets/files/2009/pci-compliance-standards.bin.bin) الأسبوع الماضي … على الرغم من كون أغلب المتصفحات اليوم تقوم بإستعمال TLSv1 الأقوى و SSLv3 ولكن مع هذا يجب عمل تعطيل كامل لـ SSLv2 ولهذا ما لنا سوى تنفيذ الحلول :)

عملية ترقيع هذه المشكلة بسيطة للغاية …

بالبداية أبحث في ملف httpd.conf أو ssl.conf عن التوجيه SSLCipherSuite ومن ثم غييره الى التالي:

SSLProtocol -ALL +SSLv3 +TLSv1

SSLCipherSuite ALL:!ADH:RC4+RSA:+HIGH:+MEDIUM:-LOW:-SSLv2:-EXP

هكذا في السطر الأول قمنا بتعطيل جميع البروتوكولات من خلال إشارة – وفعلنا فقط SSLv3 و TLSv1 …  في السطر الثاني قمنا بتفعيل جميع المشفرات المتوسطة والعالية وقمنا بإيقاف عمل الضعيفة منها …

الآن كل الذي عليك فعله هو إعادة تشغيل خادم الأباتشي … للتأكد بإن SSLv2 لا يعمل الآن؟ تابع في الموضوع القادم بعنوان:

[Howto Check What SSL Protocol Version & Ciphers a Domain is Using](/assets/files/2009/howto-check-what-ssl-protocol-version-ciphers-a-domain-is-using.bin.bin)

السبب في كتابته في موضوع منفصل، وهو لأن له علاقة بمواضيع كثيرة سيتم كتابتها قريباً إن شاء الله ولكي يكون مرجع لهذه المواضيع ولنا جميعاً :)

دمتم بود …
