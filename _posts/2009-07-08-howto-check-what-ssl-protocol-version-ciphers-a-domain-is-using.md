---
title: "Howto Check What SSL Protocol Version & Ciphers a Domain is Using"
date: 2009-07-08 02:07:42 -0500
categories: ["Footprinting", "PenTest", "Security", "Web Security"]
tags: ["Ciphers", "curl", "OpenSSL", "SSL2", "SSL3", "SSLDigger", "SSLThing", "TLS1"]
permalink: "/2009/07/08/howto-check-what-ssl-protocol-version-ciphers-a-domain-is-using/"
reading_time: 3
---

السلام عليكم ورحمة الله وبركاته

أكيد قرأت الموضوع السابق بعنوان [Disabling Weak SSLv2 Support in Apache Server](/assets/files/2009/disabling-weak-sslv2-support-in-apache-server.bin.bin) والآن تتسائل كيف تقوم بالتحقق من عملك تم بنجاح أم لا … أو كيف تتحقق من نسخة البروتوكول والمشفرات التي على دومين معيين؟ جواب هذا السؤال هو هذا الموضوع إن شاء الله …

بعد إكمالي لإعداد الأباتشي في موضوعي السابق … كان يجب أن اقوم بالتحقق من النتائج ليس فقط من McAfee Secure وإنما من خلال إستعمال أدوات أخرى … ظروري تستعمل أكثر من أداة للفحص الذي تقوم به … ولهذا إستعملت أدوات عدة، وهي:

[OpenSSL](http://www.openssl.org/)

[cURL](http://curl.haxx.se/)

[SSLThing](http://www.packetstormsecurity.org/filedesc/sslthing.html)

[SSLDigger](http://www.foundstone.com/us/resources/proddesc/ssldigger.htm)

الآن، للفحص بوجود SSLv2 من خلال openssl نفذ التالي:

openssl s_client -ssl2 -connect example.com:ssl_port

ناتج فشل فحص بواسطة openssl قمت به على دومين لا وجود لـ SSLv2 عليه:

CONNECTED(00000003)

21176:error:1406D0CB:SSL routines:GET_SERVER_HELLO:peer error no cipher:s2_pkt.c:675:

21176:error:1407F0E5:SSL routines:SSL2_WRITE:ssl handshake failure:s2_pkt.c:428:

الآن للفحص بوجود SSLv3 من خلال  openssl نفذ التالي:

openssl s_client -ssl3 -connect example.com:ssl_port

إذا كنت تريد الفحص من خلال الأداة curl للبحص عن SSLv2 نفذ التالي:

curl --verbose --sslv2 https:// example.com:ssl_port

ناتج فشل فحص بواسطة curl قمت به على دومين لا وجود لـ SSLv2 عليه:

* About to connect() to example.com port 443 (#0)

*   Trying example.com... connected

* Connected to example.com (example.com) port 443 (#0)

* successfully set certificate verify locations:

*   CAfile: none

CApath: /etc/ssl/certs

* SSLv2, Client hello (1):

* error:1406D0CB:SSL routines:GET_SERVER_HELLO:peer error no cipher

* Closing connection #0

curl: (35) error:1406D0CB:SSL routines:GET_SERVER_HELLO:peer error no cipher

لو إن العملية نجحت لرأينا ما هي الـ Ciphers الموجودة بالإضافة الى معلومات البروتوكول والشهادة المستعملة …

إذا كنت تريد الفحص من خلال الأداة curl للبحص عن SSLv3 نفذ التالي:

curl --verbose --sslv3 https:// example.com:ssl_port

الآن بالنسبة الى SSLThing كل الذي عليك أن تعمله هو تنفيذها كالتالي:

sh sslthing.sh example.com:ssl_port

بعض النتائج التي حصلت عليها من SSLThing كانت:

Testing SSL2...

Testing SSL3...

EDH-RSA-DES-CBC3-SHA - 168 bits

DES-CBC3-SHA - 168 bits

DHE-RSA-AES128-SHA - 128 bits

AES128-SHA - 128 bits

RC4-SHA - 128 bits

RC4-MD5 - 128 bits

Testing TLS1...

عدم إظهار شيء بعد SSL2 أو TLS1 يعني إنهم غير مفعلين … اما SSL3 سرد لنا جميع الـ Ciphers المستعملة …

بخصوص الأداة SSLDigger فهي بسيطة وعلى الويندوز، وكما يقولون Straight Forward إستعمالها :)

**ملاحظة مهمة:**

ضع بدل example.com إسم الدومين الذي تريد أن تقوم بعملية الفحص عليه، وضع بعده رقم المنفذ الذي يعمل عليه SSL بدل من ssl_port …

إن شاء الله يكون محل فائدة لكم …
