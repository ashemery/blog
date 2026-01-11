---
title: Nmap 4.85BETA7 قادر على إكتشاف Conficker
date: 2009-04-11 12:46:11 -0500
categories:
- Footprinting
- Networks
- Security
tags:
- conficker
- nmap
permalink: /2009/04/11/nmap-485beta7-can-discover-conficker-worm-availability/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

ربما الكل سمع عن الدودة worm الأخيرة التي هزت العالم … وكان الجميع يتوقع أن يعود نشاطها مرة أخرى في يوم 4-1 ولكنه لم يحدث شيء … يبدو المطور لها أذكى من أن يعطي المراقبين تاريخ للمراقبة والمتابعة … ولهذا لم يلاحظ المراقبين أي تطورات أو هجمات في ذلك اليوم تخص Conficker … لكن الدودة هذه على ما يبدو لوحظ نشاطها يوم 8-4 حسب تقرير [F-Secure](http://www.f-secure.com/weblog/archives/00001652.html) وأيضاً يبدو بإن مطور/مطوري هذه الدودة جالسين يستفيدون سواءاً هم أم غيرهم من أعمال هذه الدودة كما يقول موقع [darkreading](http://www.darkreading.com/blog/archives/2009/04/hackers_launch.html) … على كل حال لي أصدقاء كثر أصيبت شبكاتهم في العمل بهذه الدودة … والجميل بالأمر بإن كلهم يقولون بإن الـ Anti-Virus لديهم لا يكتشف الدودة ولا شيء !!! يعني الأخ عامل فيها منظف ولكن لا ينظف شيء ::bgrim::

على العموم اليوم وانا اقرأ في موقع Nmap وجدت بإنهم وضعوا إعلان بوجود تحديث على Nmap قادر على إكتشاف إذا كانت الجهاز عليه Conficker أم لا …[رابط الإعلان](http://insecure.org/#conficker) … ولهذا كل الذي عليكم فعله هو تحميل النسخة هذه [Nmap 4.85BETA7](http://nmap.org/download.html) وتركيبها كما يلي:

bzip2 -cd nmap-4.85BETA7.tar.bz2 | tar xvf -

cd nmap-4.85BETA7

./configure

make

su root

make install

وبعد ذلك تنفيذ الأمر:

nmap -PN -T4 -p139,445 -n -v --script smb-check-vulns,smb-os-discovery --script-args safe=1 [targetnetworks]

كما هو موضح في موقع Nmap … طبعاً أستبدل [targetnetworks] بالمجال لشبكتك يعني مثلاً:

nmap -PN -T4 -p139,445 -n -v --script smb-check-vulns,smb-os-discovery --script-args safe=1 172.16.0.0/16

وسيقوم Nmap بفحص الأجهزة على الشبكة وإعلامك إن كان هناك وجود لدودة Conficker ام لا …

أذا ؤ شيء سيقول لك: Conficker: Likely CLEAN

وإذا وجد شيء سيقول لك: Conficker: Likely INFECTED

بالنسبة لي أقصى شي يصاب داخل شبكتي هو Windows Running on VirtualBox   ::hehe::

نسيت أبارك لمستخدمي جنو/لينوكس وBSD نظافة أجهزتهم  ::blah::
