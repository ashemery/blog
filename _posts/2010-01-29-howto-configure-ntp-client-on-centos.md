---
title: "Howto configure NTP Client on CentOS"
date: 2010-01-29 00:41:08 -0500
categories: ["Linux Services", "Networks"]
tags: ["CentOS", "Client", "ntp", "NTP Server", "ntpd", "ntpdate", "ntpq", "pgrep"]
permalink: "/2010/01/29/howto-configure-ntp-client-on-centos/"
reading_time: 2
---

**السلام عليكم ورحمة الله وبركاته**

من متطلبات الـ [PCI Compliance](../category/pci-compliance/) إنه يكون التوقيت موحد لجميع الخوادم … ولهذا كان يجب ان نضيف خوادم NTP … في هذا الموضوع سأشرح طريقة إضافة الأجهزة الى خادم الـ NTP … لانني نسيت بصراحة اكتب خطوات إعدادا الخادم …

لنتأكد هل الخادم يستعمل ntp ام لا:

كود:

```
pgrep ntpd
```

إذا الجواب لا؟ قم بتنصيبه على الخادم الذي تريد ربطه، قم بإضافة الـ NTP من خلال الأمر:

كود:

```
yum install ntp
```

قم بتحرير الملف:

كود:

```
vim /etc/ntp.conf
```

وضع رقم الأيبي او أسم الدومين الذي تريد أن تحصل على التوقيت منه … أي عنوان الـ NTP Server … كالتالي:

كود:

```
server 192.168.1.50
```

أو:

كود:

```
server ntp.example.com
```

بعد ذلك لنثبت الخدمة في حال عملنا إعادة تشغيل:

كود:

```
chkconfig ntpd on
```

والآن نفذ الأمر:

كود:

```
/etc/init.d/ntpd start
Starting ntpd:                                             [  OK  ]
```

للتأكيد، نفذ:

كود:

```
ntpq -p
remote           refid      st t when poll reach   delay   offset  jitter
=============================================================================
```

ستظهر لك بعض الأمور…

تستطيع أيضاً تحديث التوقيت من خلال الأمر:

كود:

```
ntpdate pool.ntp.org
```

او في مثالنا:

كود:

```
ntpdate 192.168.1.50
```

المزيد؟ يا عم أقرأ:

كود:

```
man ntpdate
```

للنقاش: [أضغط هنا](http://www.linuxac.org/forum/showthread.php?35553)

موفقين إن شاء الله …
