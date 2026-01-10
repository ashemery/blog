---
title: "BackTrack5: Metasploit 4 with PostgreSQL"
date: 2011-07-29 04:15:32 -0500
categories: ["BackTrack", "Books", "Database", "Metasploit", "OSINT", "PenTest"]
tags: ["BackTrack5", "CREATE", "Database", "db_autopwn", "db_connect", "db_disconnect", "db_driver", "db_export", "db_import", "db_nmap", "db_status", "grant", "Guide", "hosts", "imported", "Metasploit", "Metasploit 4", "Metasploit4", "nmap", "Penetration", "PostgreSQL", "Privileges", "Scan", "services", "Tester"]
permalink: "/2011/07/29/backtrack5-metasploit-4-with-postgresql/"
reading_time: 3
---

يبدو إن هناك تغييرات عدة حصلت في Metasploit 4 ومن بينها طريقة التعامل مع قواعد البيانات … سأحاول في هذه التدوينة ان أللخص أهم الأمور، وكذلك بعض المشاكل التي قد تواجهك حين تود تشغيل القاعدة مع Metasploit على Backtrack5 … وكذلك ينصح مطوري Metasploit أن يتم إستعمال PostgreSQL بدلا من أي قاعدة بيانات أخرى …

في البداية توزيعة Backtrack5 لا يأتي راكب عليها قاعدة البيانات PostgreSQL ولهذا علينا تركيبها … أمرها سهل جداً:

```
apt-get install postgresql libpq-dev
```

والآن لنقوم بتشغيلها:

```
/etc/init.d/postgresql-8.4 start
```

بعد ذلك لنقوم بإضافة مستخدم وقاعدة لغرض التجربة … أعمل التالي:

```
su - postgres
```

ثم لنقوم بدخول نظام قواعد البيانات PostgreSQL من خلال:

```
psql
```

والآن لنقم بإنشاء مستخدم وقاعدة لغرض العمل عليهم بداخل Metasploit … يمكن عمل ذلك من خلال الأوامر التي بالأسفل … لعمل مستخدم إسمه binary وبكلمة سر myPassword نفذ:

```
CREATE USER binary WITH PASSWORD 'myPassword';
```

الآن لإنشاء قاعدة بيانات إسمها msf4 نفذ الأمر:

```
CREATE DATABASE msf4;
```

والآن لإعطاء جميع الصلاحيات للمستخدم binary على قاعدة البيانات التي عملناها msf4 نفذ التالي:

```
GRANT ALL PRIVILEGES ON DATABASE msf4 to binary;
```

أنهينا كل شيء، يمكن الخروج من خلال:

```
\q
```

الآن لنذهب الى Metasploit … قبل كل شيء تأكد من تحديثك لها من خلال الأمر msfupdate وبعد ذلك يرجى تشغيل Metasploit من خلال الأمر msfconsole وليس من خلال /pentest/exploits/framework3/msfconsole وذلك لأنه الأخير لن يقوم بتحميل المتغييرات المطلوبة لعمل ميتاسبلويت مع قواعد البيانات … ولنفرض قمت بذلك لو عملت db_driver ستجده يكتب لك:

```
[*] No Active Driver
[*]        Available:
```

وللتأكيد يرجى زيارة الرابط التالي: [أضغط هنا](http://redmine.backtrack-linux.org:8080/issues/120)

الآن قم بإختيار المشغل postgres من خلال:

```
db_driver postgresql
```

بعد ذلك لنقوم بالإتصال بالقاعدة التي عملناها:

```
db_connect binary:myPassword@127.0.0.1/msf4
```

كون هذه أول مرة نشبك عليها هذه القاعدة، سيقوم PostgreSQL بعمل جميع الإعدادات اللازمة فلا تقلق … الآن كل شيء تمام … لنقوم على طرفية (Terminal) آخر بعمل scan بواسطة nmap لنعمل عليها في Metasploit:

```
nmap -PN -sS -A -oX Subnet1 192.168.1.0/24
```

بعد أن ينتهي الفحص من داخل nmap لنقوم بعملية توريد للمعلومات التي حصلنا عليها من nmap بواسطة أمر db_import … أتركه الى آن ينتهي:

```
db_import /root/Subnet1
```

المفروض تحصل الآن على التالي:

```
[*] Successfully imported /root/Subnet1
```

الآن كما ذكرت في البداية مع النسخة الرابعة الجديدة هناك عدة تغييرات في الهيكل Metasploit ومن هذه التغييرات إنه لم يعد هناك مثلا الأداة db_hosts بل أصبحت hosts فقط … السبب في ذلك حسب قول مطوري Metasploit هو إنه القاعدة أصبحت جزء من الأساس (core) … هذه العملية ستساعد على مواصلة متابعة جميع المعلومات التي قام بجمعها الـ penetration tester … الأدوات التي بقيت كما هي، هم التالي:

```
db_autopwn
db_connect
db_disconnect
db_driver
db_export
db_import
db_nmap
db_status
```

غير ذلك كلهم تغييروا … الآن يمكنك مواصلة العمل على النتائج التي وردناها (imported) الى داخل القاعدة … مثل:

```
hosts -c address,state,svcs
```

او:

```
notes
```

أو:

```
services -c info -p 22 -r tcp
```

وهكذا … الآن تستطيع إكمال عملك على المعلومات التي جمعتها سواء … طبعاً أكيد الكل سيركض خلف db_autopwn :)

**مراجع مفيدة:** [الأول](http://www.offensive-security.com/metasploit-unleashed/Using_The_Database) | [الثاني](https://community.rapid7.com/community/metasploit/blog/tags/db_hosts) | [الثالث](http://www.offensive-security.com/metasploit-unleashed/Configuring_Databases) | [الرابع](http://www.nostarch.com/metasploit.htm)

**ملاحظة:**

للأسف الكتاب [Metasploit: The Penetration Tester’s Guide](http://www.nostarch.com/metasploit.htm) لازال يشرح على الطريقة القديمة … وأقول للأسف لأنه برأيي كان ممكن يتم تأخير الكتاب بعض الشيء لحين صدور النسخة الرابعة بدل من إصدار الكتاب ومن ثم إصدار النسخة الرابعة بعده بحوالي أسبوع أو أقل … على كل حال كلامي هذا ليس للتقليل من الكتاب أو لكي لا تشتريه، ولكن لكي تحسب حسابك :)

للنقاش والمساعدة يرجى زيارة الموضوع في مجتمع لينُكس العربي [هنا](http://www.linuxac.org/forum/showthread.php?53040) …
