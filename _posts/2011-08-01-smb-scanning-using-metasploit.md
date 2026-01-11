---
title: SMB Scanning بواسطة Metasploit
date: 2011-08-01 08:56:07 -0500
categories:
- Footprinting
- Linux Services
- Metasploit
- PenTest
- Windows
tags:
- auxiliary
- metasploit
- scanning
- smb
- smb-version
permalink: /2011/08/01/smb-scanning-using-metasploit/
reading_time: 2
---
حين تم تطوير Metasploit كان الهدف هو خلق بيئة متكاملة للمهاجم لتنفيذ هجومه على الهدف … من بين تلك الأهداف هي عمل Modules متخصصة في جزئيات معينة تسهل عليك الوصول الى الضحية … وكذلك حسب كتاب Metasploit الأخير، يقولون ليس مُعيب ان تسلك أسهل وأسخف الطرق للوصول الى الضحية … والكلام سليم 100% … لماذا تستهلك وقتك وجهد كبير في البحث عن طرق صعبة بعض الشيء … أستعمل الطرق الأسهل للوصول الى الهدف … والهدف هو إختراق الضحية أليس كذلك؟ إذن دائماً برأيي تبدأ بالأسهل وتتدرج …

في مثالنا هنا والذي سنتحدث عن SMB Scanning، لماذا نقوم بعمل فحص لجميع الشبكة والأجهزة والخدمات لنعرف الاجهزة التي يعمل عليها بروتوكول Server Message Block ؟ خاصة إذا كانت هناك أداة تمكننا من عمل ذلك بشكل مباشر؟ الجواب ببساطة هو ضياع للوقت ليس إلا حسب رأيي … ولعمل فحص SMB كل الذي علينا فعله هو التالي:

```
msf > use scanner/smb/smb_version
```

الآن لنرى الخيارات المتوفرة:

```
msf  auxiliary(smb_version) > show options
```

```
Module options (auxiliary/scanner/smb/smb_version):

Name       Current Setting  Required  Description
----       ---------------  --------  -----------
RHOSTS                      yes       The target address range or CIDR identifier
SMBDomain  WORKGROUP        no        The Windows domain to use for authentication
SMBPass                     no        The password for the specified username
SMBUser                     no        The username to authenticate as
THREADS    1                yes       The number of concurrent threads
```

الآن لتشغيله ببساطة كل الذي عليك فعله هو:

```
msf  auxiliary(smb_version) > set RHOSTS 192.168.1.0/24
```

بعد ذلك:

```
msf auxiliary(smb_version) > run
```

```
[*] 192.168.1.21:445 is running Unix Samba 3.x (language: Unknown) (name:ws_01) (domain:MYHOME)
[*] 192.168.1.23:445 is running Windows XP Service Pack 2 (language: English) (name:ws_02) (domain:MYHOME)
[*] Scanned 026 of 256 hosts (010% complete)
[*] 192.168.1.101:445 is running Windows 7 Ultimate (Build XXXX) (language: English) (name:ws_03) (domain:MYHOME)
[*] Scanned 103 of 256 hosts (040% complete)
[*] 192.168.1.104:445 is running Unix Samba 3.x (language: English) (name:ws_04) (domain:MYHOME)
[*] Scanned 256 of 256 hosts (100% complete)
[*] Auxiliary module execution completed
```

وهكذا تمكنا من معرفة الأجهزة التي يعمل عليها SMB وما هو الدومين وأسم الجهاز بدلاً من تشغيل فحص كامل والإنتظار لمعرفة هذه الأمور … ولهذا أذكر إنه دائماً أبدأ في أبسط وأسهل الحلول ومنها تسلق الى الأعلى :)
