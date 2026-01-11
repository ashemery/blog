---
title: Howto Verify Fedora 12 ISO
date: 2010-01-23 15:40:49 -0500
categories:
- GNU/Linux
- Linux Security
tags:
- checksum
- curl
- gpg
- sha256sum
- verify
permalink: /2010/01/23/howto-verify-fedora-12-iso/
reading_time: 1
---
السلام عليكم ورحمة الله وبركاته

للتحقق من ملف التوزيعة Fedora 12 عليك أن تتبع خطوات معينة وذلك لانه الـ HASH الموجود في ملف CHECKSUM هو جزء لا يتجزء من مفتاح الـ PGP … وكما يؤكدون من خلال الجملة:

ولهذا للتحقق قم بتحميل مفاتيح Fedora الـ GPG:

```
$ curl https://fedoraproject.org/static/fedora.gpg | gpg --import
```

ويمكنك التأكد من هذه المفاتيح من خلال هذا الرابط: [أضغط هنا](https://fedoraproject.org/en/keys)

الآن قم بالتأكد من الـ CHECKSUM من خلال:

```
$ gpg --verify *-CHECKSUM
```

الناتج يجب ان يعطينا مفتاح سليم … ويجب ان يكون التوقيع الخاص به مثل احد هذه:

```
* 57BBCCBA - Fedora 12
* D22E77F2 - Fedora 11
* 4EBFC273 - Fedora 10
* 0B86274E - Fedora 10 pre-releases
```

الآن تأكدنا من المفاتيح وتأكدنا من الـ CHECKSUM لنقم بالتأكد من ملف الـ iso من خلال:

```
$ sha256sum -c *-CHECKSUM
```

إذا كان الناتج مطابق؟ إذن الملف سليم ولم يتغيير فيه شيء أثناء التحميل … الموضوع ترجمته من [هنا](https://fedoraproject.org/en/verify) … يعني ما جبت حاجة جديدة من عندي … للنقاش فيما يخص الموضوع: [أضغط هنا](https://www.linuxac.org/forum/showthread.php?35258)

دمتم بود …
