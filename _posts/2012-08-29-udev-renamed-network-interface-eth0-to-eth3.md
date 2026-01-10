---
title: "udev: renamed network interface eth0 to eth3"
date: 2012-08-29 16:28:01 -0500
categories: ["GNU/Linux", "Networks", "Virtualization"]
tags: ["dmesg", "eth0", "interface", "network", "persistent-net.rules", "udev"]
permalink: "/2012/08/29/udev-renamed-network-interface-eth0-to-eth3/"
reading_time: 2
---

أحد الانظمة التخيلية لدي حين أردت تشغيل الشبكة عليه، لم يستطع. حين بحثت من خلال:

```
dmesg | grep eth
```

كان بعد كل عملية إعادة تشغيل يعطيني رقم جديد. يعني مرة eth1 ومرة eth2 ومرة eth3. السبب في ذلك حسب ما قرأت هو إن رقم الـ MAC للجهاز جالس يتغيير … ولهذا الحل كان بسيط للغاية شكراً للروابط الموجودة في الأسفل … كل ما عليك فعله هو:

```
vim /etc/udev/rules.d/70-persistent-net.rules
```

ثم قم بتغيير إسم المنفذ من eth3 الى eth0 … وبعدها أعد تشغيل خدمة udev وكذلك الشبكة:

```
/etc/init.d/udev restart
```

ثم:

```
/etc/init.d/networking restart
```

وتأكد من إنها أصبحت تعمل الآن بشكل سليم … إن لم تعمل؟ قم بإعادة تحرير الملف الذي بالأعلى، وقم بحذف الخيار المعني بالـ MAC منه، مثلا يصبح كهذا:

```
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
```

وأعد تشغيل خدمة udev والشبكة مرة أخرى … وهكذا إن شاء الله تكون أنحلت المشكلة لديك … طبعاً النظام الذي أستعمله قديم، ولهذا ربما في الأنظمة التي تستعملونها لا يوجد فيها هذه المشكلة لانه يفترض تم حلها … على كل حال من باب توثيقها لدي، ولمن يريد الإستفادة تم كتابة هذه التدوينة :)

المصادر: [الأول](http://bachem.wordpress.com/2010/08/27/udev-renamed-network-interface-eth0-to-eth5/) | [الثاني](https://bugs.launchpad.net/ubuntu/+source/udev/+bug/145382) | [الثالث](http://www.debianadmin.com/rename-network-interface-using-udev-in-linux.html)

للتعليق: هنا
