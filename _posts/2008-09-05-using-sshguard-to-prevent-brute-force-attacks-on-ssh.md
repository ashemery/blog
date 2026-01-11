---
title: "إستعمال sshguard للتصدي لهجمات Brute Force على خدمة SSH"
date: 2008-09-05 00:46:18 -0500
categories: ["Linux Security"]
permalink: "/2008/09/05/using-sshguard-to-prevent-brute-force-attacks-on-ssh/"
reading_time: 3
---

السلام عليكم ورحمة الله وبركاته

أول شي رمضان مبارك عليكم جميعاً وأعاده الله علينا وعليكم باليمن والمسرات وتحرير الأراضي والمقدسات من المحتلين والغاصبين …

بسبب كثرت محاولات الإختراق من نوع Brute Force التي تتم على خدمة SSH فإن sshguard وجد ليتصدى لهذه النوعية من الهجمات … يقوم sshguard بمراقبة الـ LOG وحين يرى محاولات متكررة من IP معيين للدخول أو الشبك على خدمة الـ SSH يقوم بعمل BLOCK للـ IP الخاص بذلك الشخص الذي يحاول ويكرر محاولة الدخول الغير شرعية للخدمة …

لتركيب البرنامج على توزيعة أوبنتو:

```
sudo apt-get install sshguard
```

بالنسبة للتوزيعات الأخرى قم بتحميل البرنامج من هنا –> [أضغط](http://sourceforge.net/project/showfiles.php?group_id=188282&package_id=220122&release_id=615519)

بعد التحميل قم بتركيبه بالطريقة المعتادة

ما سأقوم بشرحه هو طريقة ربطه مع خدمة التسجيل syslog-ng بحيث يصير يعتمد على سجلاته ولو تريد ربطه مع نوع آخر أذهب الى الرابط هذا –> [دوس هنا](http://sshguard.sourceforge.net/doc/setup/setup.html)

الآن لكي نقوم بتمرير السجلات LOGS من syslog-ng الى sshguard قم بتحرير الملف التالي:

```
vim /etc/syslog-ng/syslog-ng.conf
```

الآن قم بوضع الكود التالي في الملف الذي قمت بتحريره بالأعلى:

```
# pass only entries with auth+authpriv facilities that contain sshd
filter sshlogs { facility(auth, authpriv) and match("sshd"); };
# pass to this process with this template (avoids  prefixes)
destination sshguardproc {
program("/usr/local/sbin/sshguard"
template("$DATE $FULLHOST $MESSAGE\n"));
};
log { source(src); filter(sshlogs); destination(sshguardproc); };
```

الآن قم بحفظ الملف وغلقه ونريد من خدمة syslog-ng بقراءة التغييرات التي حصلت على ملف الإعداد الخاص بها، قم بعمل التالي:

```
killall -HUP syslog-ng
```

أو قم بعمل:

```
sudo /etc/init.d/syslog-ng reload
```

الآن لكي تتأكد بإن sshgaurd جالس يعمل قم بتنفيذ الأمر:

```
ps ax | grep sshguard
```

جميل الآن كل شي جاهز باقي نضيف الروولز/القوانين الخاصة بالـ netfilter أي iptables

أول حاجة نعملها هي عمل CHAIN جديدة خاصة بـ sshgaurd لكي نستعملها في تمرير جميع الباكتس المارة الى SSH من خلالها… نفذ عزيزي القاريء :

```
iptables -N sshguard
```

بعد ذلك نريد أن نقوم بتمرير جميع البيانات المتجهة الى SSH أي المنفذ Port رقم 22 الى السلسلة CHAIN التي عملناها بالأعلى sshguard، نفذ يا طيب معي:

```
iptables -A INPUT -p tcp --dport 22 -j sshguard
```

أهم شيء تأكد بإن القوانين الأساسية للسلاسل عندك هي DROP وليست ACCEPT أوك ؟

الآن أي محاولة متكررة للدخول الى نظامك من خلال خدمة SSH سيتم عمل منع BLOCK لها من خلال sshgaurd

*المستندات المستعملة بالترتيب:*

[طريقة التركيب](http://sshguard.sourceforge.net/doc/setup/setup.html)

[الربط مع الـ syslog-ng](http://sshguard.sourceforge.net/doc/setup/loggingsyslog-ng.html)

[الربط مع الـ iptables](http://sshguard.sourceforge.net/doc/setup/blockingiptables.html)

[الموقع الرسمي للبرنامج](http://sshguard.sourceforge.net/)

[Documentation](http://sshguard.sourceforge.net/doc/)

هذا ما لدي وإن شاء الله يفيدكم في التصدي للعابثين … وكل عام وأنتم جميعاً والأمة الإسلامية جميعاً بألف ألف خير …

للنقاش حول البرنامج أرجوا أن تقوم بزيارة الموضوع الأصلي في مجتمع لينوكس العربي من خلال الضغط هنا –> [أضغط هنا](https://www.linuxac.org/forum/showthread.php?t=14865)

ودمتم بود
