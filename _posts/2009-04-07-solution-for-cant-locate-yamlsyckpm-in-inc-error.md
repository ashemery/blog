---
title: حل مشكلة Can’t locate YAML/Syck.pm in @INC
date: 2009-04-07 06:47:53 -0500
categories:
- WHM/Cpanel
tags:
- cpanel
- perl-modules
- whm
permalink: /2009/04/07/solution-for-cant-locate-yamlsyckpm-in-inc-error/
reading_time: 3
---
السلام عليكم ورحمة الله وبركاته

اليوم على خادم لصديق كان فيه مشكلة وصلت له على البريد من قبل الـ cron تفيد بالتالي:

Can't locate YAML/Syck.pm in @INC (@INC contains: /usr/local/cpanel /usr/local/cpanel/cpaddons /usr/local/cpanel /usr/local/cpanel/whostmgr/docroot/cgi /usr/local/cpanel/cpaddons /usr/lib/perl5/site_perl/5.8.8/i386-linux-thread-multi /usr/lib/perl5/site_perl/5.8.7/i386-linux-thread-multi /usr/lib/perl5/site_perl/5.8.6/i386-linux-thread-multi /usr/lib/perl5/site_perl/5.8.5/i386-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib/perl5/site_perl/5.8.7 /usr/lib/perl5/site_perl/5.8.6 /usr/lib/perl5/site_perl/5.8.5 /usr/lib/perl5/site_perl /usr/lib/perl5/vendor_perl/5.8.8/i386-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.7/i386-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.6/i386-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.5/i386-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib/perl5/vendor_perl/5.8.7 /usr/lib/perl5/vendor_perl/5.8.6 /usr/lib/perl5/vendor_perl/5.8.5 /usr/lib/perl5/vendor_perl /usr/lib/perl5/5.8.8/i386-linux-thread-multi /usr/lib/perl5/5.8.8 .) at /usr/local/cpanel/Cpanel/DataStore.pm line 10.

BEGIN failed--compilation aborted at /usr/local/cpanel/Cpanel/DataStore.pm line 10.

Compilation failed in require at /usr/local/cpanel/Cpanel/cPAddons.pm line 11.

BEGIN failed--compilation aborted at /usr/local/cpanel/Cpanel/cPAddons.pm line 11.

Compilation failed in require at /usr/local/cpanel/whostmgr/docroot/cgi/cpaddons_report.pl line 10.

BEGIN failed--compilation aborted at /usr/local/cpanel/whostmgr/docroot/cgi/cpaddons_report.pl line 10.

فكان لازم نجد حل قبل الذهاب الى مدراء الـ Data Center الذي عليه الخادم … والحمد لله بالنهاية وجدت الحل من خلال عملية إعادة تركيب الـ Perl Modules للخادم … ولهذا خطوات تركيب هذه الـ Modules كانت بالنسبة لي كالتالي:

أول شي قم بإيقاف عمل WHM/CPanel

/etc/init.d/cpanel stop

بعد ذلك قم بتنفيذ الأمر التالي (زيادة خير):

/scripts/fixeverything

بعد ذلك قم بتحميل الملف الخاص بالـ Perl Modules كما يلي:

wget http://layer1.cpanel.net/perl588installer.tar.gz

قم بفك الضغط، ودخول المجلد الناتج:

tar xfvz perl588installer.tar.gz; cd perl588installer;

الآن سنقوم بتركيب الموديولات:

./install

سيأخذ بعض الوقت يعتمد على سرعة الخادم لديك … بعدها للتأكد من سلامة الموديولات وكل شي 100 الـ 100 نفذ التالي:

/usr/local/cpanel/bin/checkperlmodules

بعدها لنقم بعملية تحديث لللوحة من خلال التالي:

/scripts/upcp --force

أخيراً قم بإعادة تشغيل اللوحة:

/etc/init.d/cpanel restart

الآن للتأكد من المشكلة لم تعد موجودة، نفذ الأمر التالي:

/usr/local/cpanel/whostmgr/docroot/cgi/cpaddons_report.pl --notify

وهكذا إن شاء الله تكون أمور الخادم رجعت للطبيعي … إن شاء الله ما تحتاجون لهل طريقة ولا تصير عندكم مشاكل …

دمتم بود …
