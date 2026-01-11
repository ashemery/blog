---
title: "Using Metasploit to Detect Idle Hosts"
date: 2011-08-01 03:11:39 -0500
categories: ["BackTrack", "IDS/IPS", "Metasploit", "Networks", "PenTest"]
permalink: "/2011/08/01/using-metasploit-to-detect-idle-hosts/"
reading_time: 4
---

تعتبر طريقة الفحص التي تسمى [IDLE Scan](/assets/files/2011/idle-scan-2.bin) ربما الى اليوم أحد أقوى طرق الفحص وذلك لأنه يمكن عملها ومن دون أن يرسل المهاجم ولا حُزمة واحدة الى الهدف وبالتالي ممكن تتجاوز فيها الكثير من الأمور، وأيضاً الفحص بشكل سري وغير مكشوف الى حد ما … لكن من بين الأمور التي تجعل هذا الفحص صعب التنفيذ هو إيجاد ضحية خاملة (Idle Host) نستخدمها في عملية فحص الهدف … وهنا يأتي دور Metasploit التي وفرت لنا أداة نستطيع من خلالها فحص الشبكة لكشف الأجهزة التي ممكن تفيدنا في تنفيذ Idle Scan … الأداة هذه هي [ipidseq](http://www.metasploit.com/modules/auxiliary/scanner/ip/ipidseq/) والموجودة في ظمن موديولات الـ auxiliary …

لنلقي نظرة كيف يمكن العمل بها:

```
msf > use auxiliary/scanner/ip/ipidseq
```

بعد ذلك لنرى خيارات الموديول ipidseq والتي هي:

```
msf auxiliary(ipidseq) > show options
Module options:
Name       Current Setting  Required  Description
----       ---------------  --------  -----------
INTERFACE                   no        The name of the interface
RHOSTS                      yes       The target address range or CIDR identifier
RPORT      80               yes       The target port
SNAPLEN    65535            yes       The number of bytes to capture
THREADS    1                yes       The number of concurrent threads
TIMEOUT    500              yes       The reply read timeout in milliseconds
```

أكثر خيارين ستحتاج لهما هم RHOSTS و THREADS … يفضل حسب كلام المطورين للأداة أن لا تستعمل أكثر من 16 حين تستعمل Metasploit في بيئة ويندوز وليس أكثر من 128 في بيئة جنو/لينُكس … أما بخصوص RHOSTS فيمكنك إستخدام الكثير من خيارات Nmap مثل إعطاءه IP Address لجهاز واحد، مجموعة أجهزة أو CIDR لشبكة أو حتى عدة CIDR من خلال الفصل بينهم بفاصلة وأخيراً وليس آخرا يمكنك إعطاءه ملف فيه مجموعة من العناوين كل عنوان في سطر منفصل …

الآن لنقوم بعمل تجربة سريعة على شبكتنا (192.168.1.0/24) من خلال:

```
msf auxiliary(ipidseq) > set RHOSTS 192.168.1.0/24
RHOSTS => 192.168.1.0/24
```

بعد ذلك:

```
msf auxiliary(ipidseq) > set THREADS 50
THREADS => 50
```

وأخيراً لننفذ:

```
msf auxiliary(ipidseq) > run
```

ملاحظات:

**أولاً:** إذا واجهتك مشكلة وظهرت لك مثل هذه (**مشكلة في مكتبة pcap الخاصة بلغة البرمجة روبي**):

```
[*] The Pcaprub module is not available: no such file to load -- pcaprub
[-] Auxiliary failed: RuntimeError Pcaprub not available
```

فحل المشكلة موجود [هنا](http://redmine.backtrack-linux.org:8080/issues/148) [وهنا](http://www.backtrack-linux.org/forums/backtrack-5-beginners-section/40565-metasploit-pcaprub-fix-bt5.html#post200380) …

ثانياً: يجب أن تسمح للـ Promiscuous Mode في حالة كنت تستعمل BackTrack بداخل VMWare … وهذه حلها [هنا](/assets/files/2011/virtual-ethernet-adapter-promiscuous-mode.bin) …

```
[*] 192.168.1.1's IPID sequence class: All zeros
[*] 192.168.1.109's IPID sequence class: Incremental!
[*] Scanned 256 of 256 hosts (100% complete)
[*] Auxiliary module execution completed
msf auxiliary(ipidseq) >
```

من خلال النتائج التي نجد في آخرها Incremental نستطيع إستعمال ذلك الجهاز (host) في عملية فحصنا بواسطة Nmap … الآن كل الذي علينا فعله هو تنفيذ Nmap كالتالي:

```
nmap -PN -sI 192.168.1.109 192.168.1.100
```

لمعرفة المزيد عن Nmap وبالذات طريقة فحص الـ IDLE Scan يرجى زيارة الموضوع التالي: أضغط هنا

او يمكن عمل الفحص من داخل Metasploit نفسها من خلال الأمر:

```
db_nmap -PN -sI 192.168.1.109 192.168.1.100
```

كلها تؤدي نفس الغرض …

ملاحظة: يفضل قبل أن تقوم بعملية الفحص بواسطة Nmap من داخل Metasploit أن تكون قد شغلت وأتصلت بقاعدة بيانات وذلك لتخزين النتائج فيها … هذا إن كنت تنوي إكمال العمل وليس لمجرد عمل تجربة … لمعرفة كيفية الإتصال بالقاعدة وأمور أخرى، يرجى قراءة الموضوع التالي: [أضغط هنا](/assets/files/2011/backtrack5-metasploit-4-with-postgresql.bin)

هناك طرق وأدوات أخرى لعمل فحص بواسطة Metasploit ويمكن أن تجد هذه الأدوات الخاصة بعمل Port Scan بداخل:

```
auxiliary/scanner/portscan/
```

وهي التالي:

```
auxiliary/scanner/portscan/ack                         normal  TCP ACK Firewall Scanner
auxiliary/scanner/portscan/ftpbounce                   normal  FTP Bounce Port Scanner
auxiliary/scanner/portscan/syn                         normal  TCP SYN Port Scanner
auxiliary/scanner/portscan/tcp                         normal  TCP Port Scanner
auxiliary/scanner/portscan/xmas                        normal  TCP "XMas" Port Scanner
```

أترك تجربتها لكم :)
