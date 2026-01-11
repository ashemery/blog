---
title: Disabling SSLv2 & Weak CipherSuites Support in Apache Tomcat
date: 2009-07-11 12:39:49 -0500
categories:
- Apache/Tomcat
- Footprinting
- PCI Compliance
- PenTest
- Security
- Web Security
tags:
- apache
- ciphersuites
- jsse
- keystore
- openssl
- sslv2
- tomcat
permalink: /2009/07/11/disabling-sslv2-weak-ciphersuites-support-in-apache-tomcat/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

نفس الخلل الذي ظهر عندي في خادم Apache من أجل فحص الحصول على [PCI Compliance](/assets/files/2009/pci-compliance-standards.bin.bin) ظهر في خادم Tomcat وهو وجود [Weak supported SSL ciphers suites](/assets/files/2009/disabling-weak-sslv2-support-in-apache-server.bin.bin) … وبصراحة أنا ما لي خبرة في Tomcat ولهذا كان لازم أبدأ بالقراءة عنه وعن طريقة عمله وإعداداته … والحمد لله بعد القراءة عرفت أين ملفات الإعداد وكيف أقوم بحل المشكلة … الآن كل الذي عليك فعله هو التالي:

أذهب الى المجلد الخاص بملفات Tomcat (سيختلف من توزيعة لأخرى ومن تنصيب لآخر) ومن ثم قم بتحرير ملف الإعدادات الخاص بالخادم:

vim server.xml

وأبحث عن الـ SSL port connector أي الحقول الخاصة بموصل الـ SSL … مثال:

قم بتغييرهم ليصبحوا هكذا:

**لا تنسى تستبدل التالي:**

KeyStorePassOfYours بكلمة السر الخاصة بالـ KeyStore الخاص بك

example.com.pem.keystore بالخاص بالخادم والدومين الخاص بك

بعد ذلك قم بعملية إعادة تشغيل لـ Tomcat:

/etc/init.d/tomcat restart

وإن شاء الله خلاص يكون المشكلة قد حلت … جرب أعمل إعادة فحص على الخادم للتأكد من ذلك …

**ملاحظات:**

– تأكد بإنك تستعمل OpenSSL وليس [JSSE](http://java.sun.com/javase/technologies/security/) حيث لكل واحد إعدادات مختلفة في Tomcat …

– للفحص راجع المواضيع السابقة مثل [Howto Check What SSL Protocol Version & Ciphers a Domain is Using](/assets/files/2009/howto-check-what-ssl-protocol-version-ciphers-a-domain-is-using.bin.bin) أو قم بزيارة الموقع التالي: [ServerSniff](http://www.serversniff.net/content.php?do=ssl) للتأكد …

مراجع مفيدة: [الأول](http://tomcat.apache.org/tomcat-6.0-doc/ssl-howto.html) | [الثاني](http://httpd.apache.org/docs/2.0/mod/mod_ssl.html#sslciphersuite) | [الثالث](http://tomcat.apache.org/tomcat-6.0-doc/apr.html) | [الرابع](http://www.javaworld.com/javaworld/jw-05-2001/jw-0511-howto.html?page=1) | [الخامس](http://www.serversniff.net/content.php?do=ssl) | [السادس](http://java.sun.com/javase/technologies/security/)

بالتوفيق لكم جميعاً …
