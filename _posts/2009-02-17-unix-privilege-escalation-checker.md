---
title: Unix Privilege Escalation Checker
date: 2009-02-17 01:20:46 -0500
categories:
- Linux Security
- PenTest
- Security
- Unix
tags:
- bsd
- escalate
- escalation
- gnulinux
- hpux
- penetration-testers
- pentest
- privilege
- shell-script
- solaris
permalink: /2009/02/17/unix-privilege-escalation-checker/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

unix-privesc-check عبارة عن Shell Script جميل كتب من أجل مساعدة الـ Penetration Testers في فحص الخوادم أو الاجهزة التي تعمل عليها أنظمة كـ GNU/Linux و BSD و Solaris وحتى HPUX في البحث عن الأخطاء والثغرات في الإعدادات اللازمة للنظام وأيضاً معرفة هل بإمكان أحد عمل Escalate لصلاحياته من صلاحيات عادية الى صلاحيات إدارية مثلاً …  الأداة طبعاً ربما لن تكشف الكثير من العيوب على أنظمتنا الحالية كما ذكر المطور لها … ولكن لو كنت بفريق لعمل Pentest لشركة وكان لديهم أنظمة قديمة ستفيدك بشكل كبير جداً … ولكن مع هذا ممكن تجد عيوب في نظامك الحالي من يدري، كل شيء وارد …  لا تحتاج الى تركيب أو شيء كل ما هو عليك فعله هو تحميلها من [هنا](http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz) … ومن ثم فك ضغط الملف وبعد ذلك تنفيذها بهذه الطريقة:

./unix-privesc-check > output.txt

ستقوم بعمل فحص لأمور مثل:

external authentication is allowed in /etc/passwd

nsswitch.conf for addition authentication methods

writable config files

if /etc/shadow is readable

password hashes in /etc/passwd

accounts with no passwords

sudo configuration

permissions on swap file(s)

programs run from inittab

permissions on device files for mounted partitions

cron job programs aren’t writable (/etc/crontab)

home directories aren’t writable

readable sensitive files in home directories

SUID programs

Private SSH Keys home directories

وغيرها الكثير من الفحوصات … أنصحكم تجربوه ومن لديه الإمكانية في الإضافة أو التحسين فاليقم بذلك … وممكن بذلك يفيد نفسه والمطور الأصلي بنتائج جديدة … حيث كما ذكر المطور لهذه السكربت عيوب كثيرة قم بقرائتها والتعرف عليها … [الموقع الرسمي](http://pentestmonkey.net/tools/unix-privesc-check/) للسكربت …  إن شاء الله يفيدكم ويعجبكم …

دمتم بود …
