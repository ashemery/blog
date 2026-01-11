---
title: Open Source Security Information Management
date: 2009-06-20 09:00:23 -0500
categories:
- Footprinting
- Linux Security
- Linux Services
- Networks
- PenTest
- Security
tags:
- arpwatch
- assets
- bsd
- gpl
- ips
- nagios
- nessus
- ocs-ng
- osiris
- ossec
- ossim
- p0f
- pads
- security-professional
- snort
- spade
- tcptrack
permalink: /2009/06/20/open-source-security-information-management/
reading_time: 5
---
السلام عليكم ورحمة الله وبركاته

![](http://binary-zone.com/images/security/ossim/logo-hdr.png)

منذ فترة لم نكتب عن حاجة جديدة والسبب العمل، ولهذا قررت أكتب عن بعض الأمور التي أستعملها في عملي وبعض التقنيات والطرق أيضاً التي أستعملها في إدارة العمل … في البداية ربما الكثير منا يظن بإن الحماية والأمن هي فقط أمن المواقع وهذا أمر ليس صحيحاً، ولهذا نرى الكثيرين يهتمون بهذا الجانب وينسون جوانب أخرى كثيرة … المحافظة على Assets الشركة هي أمن، المراقبة والمتابعة للخدمات وكيف هو عملها وأداءها هو أمن، المتابعة والمراقبة لسجلات الأنظمة والخدمات هو أيضاً أمن، ومعرفة ما يدخل الى شبكتك وماذا يخرج منها هو أيضاً أمن وغيرها الكثير من الأمور …

طيب لمراقبة الشبكة تستعمل ntop ولمراقبة الخدمات والخوادم تستعمل Nagios ولمراقبة الحزم ربما تستعمل tcptrack ولمراقبة الـ MAC Addresses تستعمل ArpWatch ولمراقبة هل هناك هجمات أو لا من خلال IDS تستعمل Snort وغيرها من الأدوات التي تستعملها للمراقبة والمتابعة لما يخص الشبكة التي تشرف عليها … طيب أنظر الى حجم العمل الذي سيكون على كاهلك والسبب وجود عدة برامج وعدة روابط وبرامج للمتابعة … ستتنقل بين متابعة Nagios و Snort وغيرها من البرامج كل مرة … متعب صح ؟

وأيضاً لو كانت الإدارة تطلب منك تقارير إسبوعية عن حالة الشبكة والخدمات التي عليها كيف ستعمل ذلك وأنت تستعمل هذه البرامج بهذه الطريقة؟ الجواب مهلك بصراحة وأكثر من ما تتوقعون حتى لو كانت الشبكة صغيرة جداً فما بالك حين يكون حجمها عشرات من الخوادم ومئات الموظفين وأجهزتهم !!!

هنا يأتي نظام OSSIM والذي هو إختصار لـ Open Source Security Information Management … والذي يصفه المطورون بإنه الهدف من عمله هو لتوفير تجميع شامل من البرامج حين تعمل مع بعضها البعض توفر لمدير الشبكة أو المسؤول الأمني عنها تفاصيل كاملة عن كل النواحي الموجودة في شبكته سواءاً الشبكة، الأجهزة، الوصول الفيزيائي لها، الخوادم، الى آخره.

أيضاً ما يوفره هذا النظام بالإضافة الى البرمجيات مفتوحة المصدر التي يستعملها هو نظام إرتباط لعدة مستويات من التصورات بالإضافة الى إمكانية عمل التقارير وأدوات لإدارة الحوادث وكل هذا يعمل على مجموعة معرفة من الـ Assets مثل الأجهزة، الشبكات، المجموعات والخدمات.

جميع هذه المعلومات ممكن أن يتم حصرها بناءاً على الشبكة أو الـ Sensor وذلك لعرض المعلومات التي تريدها فقط … وأيضاً إمكانية إستعمال عدة مستخدمين للنظام وذلك لإعطاء مثلاً كل مستخدم وظيفة معينة (مثلاً فريق الحماية في الشركة، يعطى لكل شخص في الفريق إمكانية العمل على وظائفه الخاصة فقط، ولن يرى باقي التفاصيل) بناءاً على بيئة العمل … مع إمكانية إستعمال النظام للعمل كـ IPS أي Intrusion Prevention System وذلك بناءاً على نظام الإرتباط المبني على المعلومات التي لديه … كل هذا بالنهاية سيعطي إضافة حقيقية لأي Security Professional …

النظام مبني على دبيان أعتقد 4.10 والله أعلم، وكان يستعمل بالسابق رخصة BSD وقبل فترة أنتقل مطوروه الى رخصة GPL وذلك حسب ما فهمت لإعطاء حرية أكبر … النظام يحتوي على البرامج التالية:

* Arpwatch, used for mac anomaly detection.

* P0f, used for passive OS detection and os change analisys.

* Pads, used for service anomaly detection.

* Nessus, used for vulnerability assessment and for cross correlation (IDS vs Security Scanner).

* Snort, the IDS, also used for cross correlation with nessus.

* Spade, the statistical packet anomaly detection engine. Used to gain knowledge about attacks without signature.

* Tcptrack, used for session data information which can grant useful information for attack correlation.

* Ntop, which builds an impressive network information database from which we can get aberrant behaviour anomaly detection.

* Nagios. Being fed from the host asset database it monitors host and service availability information.

* Osiris, a great HIDS.

* OCS-NG, Cross-Platform inventory solution.

* OSSEC, integrity, rootkit, registry detection and more.

تخييل كل هذه مربوطة مع بعضها البعض وكلها تحت واجهة واحدة ؟ صدقوني جربوا تستعملوا هذه البرامج بشكل منفصل وستعرفون كم هو رهيب أن تجدها في مكان واحد … أنظر الى حجم المعلومات التي ستحصل عليها من خلال هذه البرامج وكلها مفيدة بدون شك …

هذا الموضوع هو الجزء الأول فقط، من ما يخص OSSIM سأكمل الحديث عن أمور أخرى حول هذا النظام، منها:

أولاً: كيفية بناءاً المجموعات أو إضافة الأجهزة مع كيفية مراقبتها من خلال Ntop و Nagios.

ثانياً: كيفية ربط الأجهزة بالشبكة سواءاً تستعمل جنو/لينوكس أو ويندوز مع مستودع OCS-NG من خلال الـ Agent الخاص بها.

ثالثاً: كيفية إضافة الـ Agent الخاص بـ OSSEC والذي هو الـ HIDS.

رابعا: كيفية عمل Scan من خلال Nessus أو Nmap من خلال النظام وما هي فائدة ذلك.

خامساُ: غير ذلك.

أليكم بعض الصور من النظام:

صفحة المخططات الرئيسية لمختلف الأمور

![](http://binary-zone.com/images/security/ossim/ChartExePanel.jpeg)

صفحة برنامج Ntop

![](http://binary-zone.com/images/security/ossim/ntop.jpeg)

صفحة برنامج Ntop مع الـ Sessions المفتوحة حالياً

![](http://binary-zone.com/images/security/ossim/ntop-session.jpeg)

صفحة برنامج Nagios

![](http://binary-zone.com/images/security/ossim/nagios.jpeg)

صفحة المخططات التوضيحة للمخاطر التي عندك

![](http://binary-zone.com/images/security/ossim/ChartAggRisk.jpeg)

صفحة إعدادات المستخدمين للنظام

![](http://binary-zone.com/images/security/ossim/ConfUser.jpeg)

صفحة الـ Correlation Directives

![](http://binary-zone.com/images/security/ossim/CorrDirectives.jpeg)

صفحة الأحداث التي يعرضها لنا BASE (لمن أستعمل Snort فبدون شك يعرف ما هو Basic Analysis & Security Engine هذا)

![](http://binary-zone.com/images/security/ossim/EventsBASE.jpeg)

صفحة أنواع الحوادث

![](http://binary-zone.com/images/security/ossim/IncidentType.jpeg)

طبعاً هذا ليس كل شيء، ولكنها عبارة عن عينة فقط، إن شاء الله نتعرف على المزيد لاحقاً، وأتمنى يكون الجميع لديه النظام ليكون العمل أسهل :)

الموقع الرسمي للنظام | [أضغط](http://www.ossim.net/)

لتحميل النظام (Stable) نسخة 1.0.6 | [من هنا](http://downloads.alienvault.com/ossim-installer-1.0.6.iso)

لتحميل النظام (Beta) نسخة 1.1beta | [من هنا](http://data.alienvault.com/ossim-installer-x86_1.1.beta1.iso)

في الأخير لن أقوم بشرح كيفية تنصيب النظام، لأنه بصراحة سهل جداً وسهولته تصل لحد السخافة أن أقوم بأمانة بشرح ذلك … هذه المجموعة من المطورين (المدريديين :) ) عملوا إنجاز بأمانة وأنجاز صعب تتخييله إلا لو أستعملت ولو بعض هذه البرمجيات لوحدها … أنصح كل من يود التعلم أن يقوم بتركيب هذا النظام ولو على VMware والبدأ بالتعلم …

لي عودة لإكمال الشرح إن شاء الله لاحقاً … إن شاء الله يفيدكم ويكون محل فائدة لكم، ولا تنسوني من دعواتكم :$

دمتم بود …
