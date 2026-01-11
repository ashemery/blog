---
title: إستعمال شبكة Tor لأكثر من مجرد تصفح
date: 2011-11-28 22:17:45 -0500
categories:
- Networks
- Privacy
- Security
tags:
- anonymity
- ftp
- http-headers
- sftp
- ssh
- telnet
- tor
- user-agent
- usewithtor
- wget
permalink: /2011/11/28/using-the-tor-network-for-more-than-just-browsing/
reading_time: 2
---
الكثير منا يستعمل شبكة Tor وذلك لكي يتصفح بنوع من أنواع التخفي والسرية Anonymity … لكن ماذا لو كنت تريد مثلاً أن تقوم بتحميل ملف ما بدون أن يعلم صاحب الخادم الذي تحمل منه الملف رقم الأي بي الحقيقي لك؟

الجواب للتصفح هو Tor وللتحميل أيضاً نستطيع إستعمال أحدى الأدوات التي تأتي مع Tor والتي هي usewithtor …

مثلا لتحميل ملف معيين، كل الذي علينا القيام به هو:

```
$ usewithtor wget https://www.binary-zone.com/somefile.iso
```

هكذا أستعملنا wget من خلال شبكة tor لتحميل الملف somefile.iso …

لكن … هناك امر لازال مكشوف لصاحب الخادم! وهو السجل Log كهذا:

```
https://www.binary-zone.com 212.xxx.xxx.106 - - [28/Nov/2011:16:15:25 +0200] "GET /somefile.iso HTTP/1.1" 301 20 "-" "Wget/1.12 (linux-gnu)"
```

ما تم تسجيله في سجلات الخادم (مثلا اباتشي) هو نوع نظامك المستعمل ونوع المتصفح … هذه كشفتها أو تم التعرف عليها من خلال الـ HTTP Headers …

طيب إذا كنا نريد زيادة مستوى التخفي والسرية في التحميل، كل الذي علينا القيام به هو تغيير الـ User-Agent وهذا ممكن عمله من خلال التالي:

```
$ usewithtor wget https://www.binary-zone.com/somefile.iso -U "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727)"
```

وتستطيع معرفة شرح تفصيلي للـ User-Agent المستعمل هنا من خلال: [الأول](http://www.zytrax.com/tech/web/msie-history.html) | [الثاني](http://www.ua-tracker.com/agent.php)

هكذا لن نكون قد كشفنا نظامنا ومتصفحنا الحقيقي وكذلك قمنا بالتحميل من خلال مرور الحزم بداخل شبكة tor … طبعاً أنا أفترض إن القاريء يعرف ماذا نعني بشبكة Tor :)

هل هذا فقط ما نستطيع فعله؟ الجواب لا … نستطيع كذلك إستعمال usewithtor مع SSH و FTP و Telnet وأكيد SFTP كذلك … مثال على ذلك:

```
$ usewithtor ssh username@mydomain.com
$ usewithtor ftp username@mydomain.com
$ usewithtor sftp username@mydomain.com
$ usewithtor telnet mydomain.com
```

لمزيد من المعلومات:

http://code.google.com/p/torsocks/

وكذلك كتاب Malware Analysts Cookbook فهو كذلك من أروع الكتب في العصر الحالي :)
