---
title: تنصيب 3.2 Metasploit على Ubuntu
date: 2008-12-31 15:04:33 -0500
categories:
- Linux Security
- PenTest
- Security
tags:
- exploits
- ids-signatures
- metasploit
- openssl
- payloads
- penetration-testing
- reconnaissance
- ruby
- ruby-gems
- ruby-rails
- ubuntu
permalink: /2008/12/31/howto-install-metasploit-on-ubuntu/
reading_time: 4
---
السلام عليكم ورحمة الله وبركاته

![](/assets/img/posts/2008/Metasploit_Logo.png)

[Metasploit](http://www.metasploit.com/) عبارة عن بيئة تطويرية مفتوحة المصدر أساس عملها هو لتكوين بيئة مناسبة للباحثين في مجال الأمنية لتطوير الثغرات exploits والـ payloads وكتابة تواقيع لأنظمة إكتشاف الدخلاء IDS Signatures وغيرها من الأدوات التي ممكن تفيدك في عملية البحث والإستكشاف reconnaissance عن الثغرات وغيرها من الأمور في مجال الـ testing أي مجال تجربة الإختراق Penetration Testing …

النسخة شهدت قفزة كبيرة في تطويرها منذ أن [صدرت النسخة 3.0 في عام 2007](http://blog.metasploit.com/2007_03_01_archive.html) … حيث تم إعادة كتابتها بالكامل بواسطة لغة البرمجة Ruby بعدما كانت مكتوبة بالبيرل وبعض أكواد C وبعض أكواد Assembly … ومنذ ذلك اليوم وهي في تطور مستمر وإضافات مستمرة للأدوات والثغرات التي تحتويها … وكل هذا لمساعدة المطورين فيما سبق ذكره من أعمال … تأتي رخصتها تحت رخصة MSF License والتي هي قريبة من الرخصة التجارية EULA …

الآن لتنصيبها على Ubuntu قم بمتابعة الخطوات التي سأقوم بها … وذلك لأننا سنحتاج الى حزم عديدة وأغلبها تخص Ruby لتركيبها لكي نستطيع أن نشغل Metasploit ولهذا أولاً قم بتنفيذ الأوامر التالية:

```
sudo apt-get install libzlib-ruby
sudo apt-get install libopenssl-ruby
sudo apt-get install libdl-ruby
```

بعدها لنقوم بتعديل على بعض المخازن الموجودة لدينا … ولنأخذ نسخة إحتياطية من ملف sources.list نفذ:

```
cd /etc/apt
sudo cp sources.list sources.list.bak
```

بعدها قم بتحرير الملف:

```
sudo vim sources.list
```

وأبحث عن السطور التي بالأسفل وأحذف الإشارة # التي في بداية السطر:

```
# deb http://us.archive.ubuntu.com/ubuntu/ hardy universe
# deb-src http://us.archive.ubuntu.com/ubuntu/ hardy universe

# deb http://security.ubuntu.com/ubuntu hardy-security universe
# deb-src http://security.ubuntu.com/ubuntu hardy-security universe
```

الآن قم بعمل تحديث الحزم ومن ثم تركيب حزم أخرى من خلال:

```
apt-get update
sudo apt-get install ruby ri rdoc mysql-server libmysql-ruby
```

الآن لنقوم بتركيب Ruby Gems و Ruby Rails التي تحتاجها Metasploit وذلك من خلال:

```
apt-get install rubygems
apt-get install rails
```

الآن أذهب الى موقع Metsploit الرسمي وقم بتحميل الـ Framework أو أضغط [هنا](http://www.metasploit.com/framework/download/?id=framework-3.2.tar.gz) لعمل ذلك …

بعد التحميل قم بتنفيذ الأوامر التي بالأسفل لتركيبهم على جهازك:

```
tar zxvf framework-3.2.tar.gz
cd framework-3.2/
sudo mkdir /usr/local/bin/msf
sudo cp * /usr/local/bin/msf -r
cd /usr/local/bin/msf
```

الآن لنقم بتشغيل Metasploit من خلال تنفيذ الأمر:

```
sudo ./msfweb
```

يفترض لو كل شيء تم بشكل صحيح وسليم، ستظهر لك أكواد مثل التالية:

```
[*] Starting msfweb v3.2-release on http://127.0.0.1:55555/

=> Booting WEBrick...
[*] WEBrick directory traversal patch loaded
=> Rails 2.1.2 application started on http://127.0.0.1:55555
=> Ctrl-C to shutdown server; call with --help for options
[2008-12-31 13:38:31] INFO  WEBrick 1.3.1
[2008-12-31 13:38:31] INFO  ruby 1.8.6 (2007-09-24) [i486-linux]
[2008-12-31 13:38:31] INFO  WEBrick::HTTPServer#start: pid=9158 port=55555
```

إذا لا سامح الله ظهرت لك مشكلة Error بخصوص openssl؟

قم بتنيفذ الخطوات التي بالأسفل وإن شاء الله تنحل:

```
apt-cache search ruby | grep openssl
libopenssl-ruby - OpenSSL interface for Ruby
libopenssl-ruby1.8 - OpenSSL interface for Ruby 1.8
libopenssl-ruby1.9 - OpenSSL interface for Ruby 1.9
```

بعدها قم بتركيب الحزمة libopenssl-ruby التي تحتاجها Metasploit … حيث ذكروا بإنها تحتاج الى نسخة openssl الخاصة بـ Ruby وليس تلك الخاصة بلغة C والتي يستعملها الأباتشي …

```
apt-get install libopenssl-ruby
```

الآن كل ما عليك فعله هو الذهاب الى المتصفح على الرابط التالي:

[http://127.0.0.1:55555/](http://127.0.0.1:55555/)

ستظهر لك صورة تشبه هذه:

[![](/assets/img/posts/2008/msf3.2.png)](/assets/img/posts/2008/msf3.2.png)

ياله أنتهينا من التنصيب وجميع ما يخص ذلك … نكمل مع Metasploit في موضوع آخر …

مراجع مستعملة:

[صفحة FAQ](http://en.wikibooks.org/wiki/Metasploit/Frequently_Asked_Questions)

[صفحة الدعم والكتيبات](http://www.metasploit.com/framework/support/)

[مدونة Metasploit](http://blog.metasploit.com/2007_03_01_archive.html)

ودمتم بود …
