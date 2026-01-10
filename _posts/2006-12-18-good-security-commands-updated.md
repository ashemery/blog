---
title: "أوامر مفيدة في التحقق من الأمن (متجدد)"
date: 2006-12-18 20:51:28 -0500
categories: ["Linux Security"]
permalink: "/2006/12/18/good-security-commands-updated/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

وجدت من خلال تصفحي النت بعض الأوامر المفيدة في التأكد من الأمن على جهازك … ويمكن تنفيذها بشكل دوري للتأكد …

للتأكد من عدم وجود مستخدمين من دون باسورد

awk -F: '$2 == "" { print $1, "has no password!" }' /etc/shadow

للبحث عن المستخدمين الذين لديهم صلاحيات مشابهة الى root

awk -F: '$3 == 0 { print $1, "is a superuser!" }' /etc/passwd

للتحقق من الملفات التي تحمل صلاحيات SUID و SGID

find /dir -xdev -type f -perm +ug=s -print

للتحقق من صلاحيات الملفات على جهازك والتي يحمل ال others صلاحيات كتابة

find /dir -xdev -perm +o=w ! \( -type d -perm +o=t \) ! -type l -print

للتحقق من الكلمات السرية الغير جيدة

john /etc/shadow

منع عمل ping على ال Linux B0x الخاص بيك

iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

لتنزيل john من هنا تجده [هنا](http://www.openwall.com/john/f/john-1.7.0.2.tar.gz)

سيتم تزويد الموضوع بأوامر اخرى …
