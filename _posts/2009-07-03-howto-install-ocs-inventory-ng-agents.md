---
title: "HOWTO Install OCS Inventory NG Agents"
date: 2009-07-03 11:01:28 -0500
categories: ["GNU/Linux", "Networks", "Patch Management", "Security", "Vulnerability", "Windows"]
tags: ["Agent", "OCS Inventory NG", "OSSIM", "Patching", "Reports", "Security", "Vulnerabilities"]
permalink: "/2009/07/03/howto-install-ocs-inventory-ng-agents/"
reading_time: 3
---

السلام عليكم ورحمة الله وبركاته

الآن لنكمل باقي أجزاء OSSIM الذي تحدثت عنه [هنا](/assets/files/2009/open-source-security-information-management) الآن لنقوم بتركيب OCS Inventory NG Agent على توزيعات جنو/لينوكس الموجودة عندك على الشبكة … بالبداية يجب توفر التالي:

- dmidecode version 2.0 or higher

- PERL 5.6 or higher

- Perl module XML::Simple version 2.12 or higher

- Perl module Compress::Zlib version 1.33 or higher

- Perl module Net::IP version 1.21 or higher

- Perl module LWP (سابقا يسمى libwww-perl) version 5.8 or higher

- Perl module Digest::MD5 version 2.33 or higher

- Perl module Net::SSLeay version 1.25 or higher

- ipdiscover version 3 or higher

أيضاً يجب أن تعرف على أي جهاز يعمل الخادم الرئيسي OCS Inventory NG Communication Server وعلى أي منفذ … طبعاً بالغالب إذا لم تقم بالتعديل على المنفذ سيكون الأساسي نفسه …

الآن قم بآخذ الـ Client من صفحة Downloads وأنسخها على الجهاز المطلوب التنصيب عليه … قم بفك الضغط عنه ومن ثم الدخول الى المجلد ونفذ الأمر:

sh setup.sh

الآن، إذا كنت تنصبه على خادم OSSIM نفسه أو على خادم عن بعد حين تصل هذا السؤال أختر HTTP:

Which method will you use to generate the inventory ([http]/local) ?http

عند الوصول للسؤال عن الخادم ومكانه، إذا كان خادم OSSIM نفسه ضع 127.0.0.1 وإذا كان على خادم آخر ضع الـ IP له:

Which host is running OCS Inventory NG Communication Server [] ?127.0.0.1

هنا أترك المنفذ كما هو، أي أضغط على Enter فقط:

On which port is running OCS Inventory NG Communication Server [80] ?

هنا أضفط Enter فقط:

What is the value of TAG ([]) ?

بعد ذلك يجب ان تظهر لك رسالة مثل هذه:

+----------------------------------------------------------+

| Lauching OCS Inventory NG Agent...                       |

+----------------------------------------------------------+

OK, OCS Inventory NG Agent runs successfully ;-)

إذا لم تظهر مثلها يعني هناك خلل في عملية الكومبايل لإحدى الأدوات المطلوبة أو للعميل نفسه بسبب عدم توفر بعض المتطلبات التي ذكرتها في بداية الموضوع …

**الآن بخصوص تنصيبه على Windows:**

قم بتحميل العميل الخاص بالويندوز من داخل صفحة Downloads وبعد ذلك قم بفك الضغط عن الملف الذي يحتوي على العميل ومن ثم أدخل الى المجلد وقم بالضغط مرتين (Double-Click) على:

install.bat

ومن ثم لنعمل Force حالياً لإرسال المعلومات للخادم الآن وليس الإنتظار قم بالضغط رتين (Double-Click) على:

inventorize_now.bat

وهكذا يكون قد تم تركيب الإضافة على نظام ويندوز وسيبدأ بإرسال المعلومات الى الخادم الموجود على خادم OSSIM … في الختام بعد نجاح العملية أذهب الى Reports ومن ثم [OCS Inventory](http://www.ocsinventory-ng.org/) وسترى الأجهزة التي قمت بإضافتها هناك …

[![](http://binary-zone.com/images/security/ossim/ocs-inventory.jpeg)](http://binary-zone.com/images/security/ossim/ocs-inventory.jpeg)

فائدة [OCS Inventory NG](http://www.ocsinventory-ng.org/) هو لكي تستطيع ببساطة عمل مستودع به كل المعلومات عن الأجهزة التي لديك وعن البرمجيات التي منصبة عليها مع النظام وقطع العتاد وغيرها من الأمور الكثيرة التي أنصحك بإستعماله لتعرفها بنفسك … فبدون معرفتك للبرمجيات والأجهزة التي على شبكتك لن تستطيع لا وضع خطة لإدارة لـ Vulnerabilities أو Patching وستكون الأمور جداً صعبة وربما معقدة للغاية عليك … يعني تخييل أن تتعمل وتنظم وتسوي وغيرك يركب برمجيات من دون علمك أو يعمل إضافة لعتاد وحاجات بدون علمك !!!

نراكم بالجزء القادم …
