---
title: HOWTO Connect to Multiple VPN’s under GNU/Linux
date: 2009-05-24 10:16:43 -0500
categories:
- Linux Security
- Networks
- Security
tags:
- network-manager
- openvpn
- svn
- taptun
- virtual-network-device
- vpn
permalink: /2009/05/24/howto-connect-to-multiple-vpns-under-gnulinux/
reading_time: 3
---
السلام عليكم ورحمة الله وبركاته

في الموضوع السابق شرحت كيفية الإتصال بشبكة الـ VPN من داخل جنو/لينوكس والويندوز … الآن سنقوم بالتعرف على كيفية الإتصال بأكثر من شبكة VPN سواءاً على جنو/لينوكس أو الويندوز … عملية الإتصال لشبكة VPN أصلاً تتم من خلال عمل [TAP/TUN](http://vtun.sourceforge.net/tun/index.html)، طبعاً وهذا الجهاز التخيلي يقوم به بالجنو/لينوكس الـ Network Manager … ولكن للأسف Network Manager لا يستطيع عمل سوى واحد وبالتالي لا تستطيع أن تقوم بالإتصال بشبكتين VPN بمرة واحدة !!! طبعاً هي عبارة عن BUG ورأيت الكثيرين أخبروا جماعة جنوم عليها وبإذن الله يقومون بحلها … بحثت صراحة كثيراً لاعرف كيف يمكنني عمل هذا الـ Virtual Network Device المسمى TAP أو TUN ولكني لم اجد ذلك … حتى في [الموقع الرسمي](http://vtun.sourceforge.net/tun/index.html) لهم لم أجد معلومات كثيرة حوله بصراحة فقط مقارنة بسيطة بينهم وأمور بسيطة أخرى …

لهذا كان لابد من البحث عن طريقة أخرى توصلني الى نفس الهدف “الإتصال بشبكتين VPN” … حاجتي لها ملحة بصراحة لانه في العمل بيئة العمل الحقيقية Production Environment على شبكة VPN وبيئة العمل الخاصة بالتجارب Testing Environment على شبكة VPN منفصلة بالكامل … ويجب أن أكون متواجد هنا وهناك بنفس الوقت وليس أن أقوم بقطع الإتصال عن الاولى والإتصال بالثانية وعند الحاجة للأولى أقطع الإتصال عن الثانية وأرجع للأولى وعلى هذه الحالة !!! يجب أن أحل مشكلة عمل TAP/TUN في جنو/لينوكس، والحمد لله بعد البحث في Google وجدت ما أبحث عنه …

الفكرة تكمن بإستعمال برنامج [GOpenVPN](http://gopenvpn.sourceforge.net/) والذي يقوم بعمل TAP/TUN لوحده دون حاجتك للتدخل :) قمة السهولة صدقوني حتى أسهل من الويندوز، وعند شرحي للويندوز سترون الفرق بينهم !!! قال ويندوز أسهل قال !!! المهم لنقوم بتركيبه بالبداية:

نحتاج الى إضافة بعض البرامج والمكتبات قبل التركيب، لنقم بذلك:

sudo apt-get install libglib2.0-dev libgtk2.0-dev libglade2-dev libgnome-keyring-dev gksu subversion build-essential autogen automake autoconf intltool

بعدها لنقوم بتحميل المصدر لـ GOpenVPN، من خلال:

svn co https://gopenvpn.svn.sourceforge.net/svnroot/gopenvpn gopenvpn

الآن أدخل الى المجلد:

cd gopenvpn/trunk/gopenvpn/

الآن نفذ هذه:

./autogen.sh

ستظهر لك رسالة فيها خطأ وعبارة “configure.ac:5: required file” بسيطة لا تقلق، قم بتنفيذ التالي:

autoheader

وبعدها أرجع نفذ السكربت السابق:

./autogen.sh

الآن نفذ التالي:

intltoolize

وبعدها عملية الإعداد، والكومبايل والتنصيب:

./configure

make

sudo make install

هكذا أصبح البرنامج راكب عندك، لتشغيله نفذ الأمر:

/usr/local/bin/gopenvpn

ستظهر في الـ panel العلوية على اليمين مربع أحمر صغير مكتوب بداخله VPN …

**ملاحظة:** يجب ان تكون وضعت الملفات الخاصة بالإعدادات والشهادات والمفاتيح كلها في مجلد:

/etc/openvpn/

الآن كل الذي عليك تعمله هو تضغط على هذه الأيقونة وإختيار الشبكة VPN التي تريد الإتصال بها … هي ستقوم بعملية إنشاء TAP/TUN والإتصال بالشبكة وسيصبح لون الأيقونة أخضر بدل الأحمر … وتستيطيع أن تذهب الى القائمة بالبرنامج ومعرفة التفاصيل حول الشبكة من خلال الضغط على details …

![](http://binary-zone.com/images/firewall/dropdown.png)

الآن لو تريد عمل إختصار أو Short Cut له الأمر بسيط على سطح المكتب أضغط ضغطة يمين ومن ثم قم بإختيار Create Launcher … ضع التفاصيل التالية:

Name: gopenvpn

Command: /usr/local/bin/gopenvpn

Comment: OpenVPN Tray Client

أضغط على OK … الآن لكي تستطيع تشغيله بواسطة المستخدم العادي وليس root قم بقراءة المصادر …

**المصادر:**

[الأول](http://gopenvpn.sourceforge.net/) | [الثاني](http://tranceparance.wordpress.com/2009/02/28/gopenvpn-installation-instructions-for-ubuntu-linux-810/) | [الثالث](http://ubuntuforums.org/showthread.php?t=1021592) | [الرابع](http://vtun.sourceforge.net/)

بالتوفيق لكم يا شباب …
