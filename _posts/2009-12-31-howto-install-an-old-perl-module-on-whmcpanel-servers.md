---
title: howto install an old perl module on whm/cpanel servers
date: 2009-12-31 07:38:09 -0500
categories:
- GNU/Linux
- WHM/Cpanel
tags:
- carp
- cgi
- clan
- cpanel
- make
- modules
- perl
- whm
permalink: /2009/12/31/howto-install-an-old-perl-module-on-whmcpanel-servers/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

قبل كم يوم كان عندي أحد سكربتات الـ cgi تحتاج الى perl module إسمه Carp::Clan بإصدار قديم … لانها غير راضية على العمل بالإصدار الجديد … ولست بخبير بأمور الـ cpanel ولهذا كان لابد من تركيبه بشكل يدوي … ولهذا هنا عملية تركيب هذه المكتبة بشكل يدوي … الأصدار الموجود مع الـ cpanel هو 6.04 حالياً وانا احتاج 6.00 … فأليكم ما عملت:

1- تحميل المكتبة هذه من خلال البحث في موقع [The CPAN Search Site](http://search.cpan.org)

2- فك ضغط الملف بعد تحميله

3- الدخول الى مجلد المكتبة

4- تنفيذ الأوامر التالية:

```
[Carp-Clan-6.00]$ perl Makefile.PL 
Checking if your kit is complete...
Looks good
Writing Makefile for Carp::Clan
```

```
[Carp-Clan-6.00]$ make
cp lib/Carp/Clan.pm blib/lib/Carp/Clan.pm
cp lib/Carp/Clan.pod blib/lib/Carp/Clan.pod
Manifying blib/man3/Carp::Clan.3pm
```

```
[Carp-Clan-6.00]$ make test
PERL_DL_NONLAZY=1 /usr/bin/perl "-MExtUtils::Command::MM" "-e" "test_harness(0, 'blib/lib', 'blib/arch')" t/*.t
t/01pod.t .... skipped: Skipping author tests
t/03yaml.t ... skipped: Skipping author tests
t/10basic.t .. ok   
t/11basic.t .. ok     
All tests successful.
Files=4, Tests=57,  0 wallclock secs ( 0.03 usr  0.01 sys +  0.07 cusr  0.03 csys =  0.14 CPU)
Result: PASS
```

5- الآن نفذ أمر التنصيب بصلاحيات root:

```
[Carp-Clan-6.00]# make install
Installing /usr/lib/perl5/site_perl/5.8.8/Carp/Clan.pm
Installing /usr/lib/perl5/site_perl/5.8.8/Carp/Clan.pod
Installing /usr/share/man/man3/Carp::Clan.3pm
Appending installation info to /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod
```

وهكذا خلاص تم التركيب بنجاح والحمد لله … طبعا في لوحات cpanel وجدت بإنك قادر على فحص ملفات الـ cgi ومعرفة ماذا تحتاج من خلال أحد المزايا الموجودة في cpanel والتي تقول check for missing perl modules …

إن كان لديك سؤال أو إستفسار؟ ضعه [هنا](https://www.linuxac.org/forum/linuxac78/thread34443.html) …

دمتم بود …
