---
title: حل مشكلة Missing Dependency التي تظهر مع rebuild-security-providers
date: 2009-12-31 07:12:26 -0500
categories:
- Apache/Tomcat
- GNU/Linux
- Patch Management
tags:
- centos
- dependency
- jpackage
- jpackage-utils
- missing
- rebuild-security-providers
- redhat
- tomcat
- yum
permalink: /2009/12/31/solve-the-missing-dependency-issue-with-java-rebuild-security-providers/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

بسبب كوني أستعمل Tomcat فإنني أحتاج الى الجافا والبلاوي الزرقة التي تأتي من الجافا هذي :)

قبل كم يوم كنت أقوم بتحديث الخادم وإذا بالرسالة الفضيعة تظهر لي:

> Missing Dependency: /usr/bin/rebuild-security-providers is needed by package java-1.4

طبعاً السبب كله أكتشفت بإنه من الحزمة jpackage-utils … حيث ان الحزمة المتوفرة تتعارض مع الحزمة jpackage-utils الموجودة في المستودعات الرئيسية سواءاً كان الخادم Redhat أو CentOS لانها ظهرت عندي على كلاهما … والحل على أحد الخوادم كان عمل التالي:

حذف الحزمة jpackage-utils بدون أن أحذف الـ dependencies الخاصة بها من خلال:

rpm -e jpackage-utils –nodeps

بعد ذلك قمت بتركيب النسخة المتوفرة في مستودعات النظام (سواءاً Redhat أو CentOS):

yum install jpackage-utils

بعد ذلك تمكنت من تحديث النظام بدون مشاكل:

yum update

وهكذا الأمور أنتهت وأنحلت المشكلة ولله الحمد … طبعاً أهم شيء يا شباب إن كنت تستعمل مستودعات jpackage؟ أنصح بإيقافهم وعمل الخطوات التي ذكرتها … لانك ستعود لنفس المشكلة وهي تعارض الحزمة jpackage-utils مع الموجودة في المستودع الأصلي …

مصادر ساعدتني في التعرف على المشكلة وحلها: [الأول](http://groups.google.com/group/mugshot/browse_thread/thread/70299de0d90d6e60) | [الثاني](https://www.zarb.org/pipermail/jpackage-discuss/2008-June/012638.html) | [الثالث](http://linux.derkeiler.com/Mailing-Lists/Fedora/2008-01/msg00023.html) | [الرابع](http://www.mail-archive.com/centos@centos.org/msg19219.html) | [الخامس](http://www.centos.org/modules/newbb/viewtopic.php?topic_id=14911) | [السادس](http://www.fedoraforum.org/forum/archive/index.php/t-86854.html)

إن كان لديك سؤال أو إستفسار؟ ضعه [هنا](https://www.linuxac.org/forum/linuxac32/thread34442.html) …

دمتم بود …
