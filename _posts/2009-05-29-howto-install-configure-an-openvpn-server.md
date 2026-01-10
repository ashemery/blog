---
title: "Howto Install & Configure an OpenVPN Server"
date: 2009-05-29 13:59:57 -0500
categories: ["Firewalls", "Linux Security", "Linux Services", "Networks", "Security"]
tags: ["CA", "Certificate Authority", "IPSec", "iptables", "OpenSSL", "OpenVPN"]
permalink: "/2009/05/29/howto-install-configure-an-openvpn-server/"
reading_time: 4
---

السلام عليكم ورحمة الله وبركاته

![](http://binary-zone.com/images/firewall/openvpn.jpeg)

عملية تنصيب OpenVPN جداً بسيطة، وخطوات إعدادها سهلة أيضاً، ولهذا لا تقلق بإذن الله بعد الشرح ستكون قد عملت خادم عليه OpenVPN ويستعمل الشهادات للإتصال وليس الكلمات السرية المشتركة … لنقوم بتركيب:

apt-get install openvpn openssl

أو

yum install openvpn

الآن جميع الإحتياجات الخاصة (ملفات الإعداد، وسكربتات) بالـ OpenVPN ستجدها في المجلد /usr/share/doc/openvpn/examples/ ولهذا:

cd /usr/share/doc/openvpn/examples

الآن قم بنسخ الملفات التي نحتاجها في هذا الشرح:

cp sample-config-files/server.conf.gz /etc/openvpn

cp -r easy-rsa/2.0 /etc/openvpn

الآن أذهب الى مجلد الخدمة:

cd /etc/openvpn

الآن لنقم بتغيير اسم المجلد 2.0 الى أسم آخر، مثلاً easyrsa-scripts كالتالي:

mv 2.0 easyrsa-scripts

الآن نقوم بفك ملف الإعداد:

gzip -d server.conf.gz

الآن نحتاج الى عمل بعض الشهادات … شهادات للخادم، وشهادات للشخص الذي سيتصل على الخادم … كل ذلك أصبح سهلاً والشكر موصول لمطوري OpenVPN الذين قاموا بعمل سكربتات تقوم بتشغيلها وهي تعمل لك كل شيء، وإلا إستعمال openssl في عملهم كان سيكون فعلاً متعباً لك وصعب الى حد ما … لهذا لنذهب للمجلد الذي فيه السكربتات:

cd /etc/openvpn/easyrsa-scripts

الآن قم بتحرير ملف vars الذي فيه المتغييرات للشهادات:

vim ./vars

الآن قم بتعديل الخيارات التي بالأسفل الى ما يناسبك (لا تترك أي منها بدون قيمة):

# These are the default values for fields

# which will be placed in the certificate.

# Don't leave any of these fields blank.

export KEY_COUNTRY="US"

export KEY_PROVINCE="CA"

export KEY_CITY="SanFrancisco"

export KEY_ORG="Fort-Funston"

export KEY_EMAIL="me@myhost.mydomain"

مثلاً مفتاح الدولة أعتقد للأردن JO للسعودية KS وهكذا، المحافظة مثلاً AM يعني عمان وربما RI تعني الرياض، أسم المدينة عادي معروفة لكم، اسم المنظمة ضع ما تريد، والبريد أيضاً ضع البريد الذي تريده … قم بحفظ الملف وأخرج منه …

الآن سنقوم بعمل Certificate Authority او ما يرمز له بـ CA الرئيسي مع المفاتيح الخاصة به:

. ./vars

./clean-all

ممكن مرات هنا يطلب منك تنفيذ الأمر:

source ./vars

وبعد ذلك قم مرة أخرى بتنفيذ الأمر السابق clean-all … الآن لنقوم بعملية بناء الشهادة:

./build-ca

قم بالإجابة على الاسئلة، بالغالب بما إنك قمت بتعديل ملف vars لن تحتاج الإجابة سوى على أمر أو أثنين، فكلهم جاهزين مسبقاً …

الآن لنقوم بعملية توليد المفتاح الخاص بالخادم:

./build-key-server server

قم بإكمال جميع المتطلبات من خلال الرد على الاسئلة …

الآن لنقوم بتوليد مفتاح للمستخدم الذي سيتصل على الخادم:

./build-key user1

الآن لنقوم بتوليد Diffie Hellman Parameters:

./build-dh

الآن ملف الاعدادات الخاصة بالخادم، أفتحه وتصفحه، هو يعمل بالأساس إلا إذا كنت تريد التلاعب فيه وفي خياراته:

vim /etc/openvpn/server.conf

الآن لنقوم بنسخ المفاتيح والشهادات الى المجلد الرئيسي للخدمة:

cd /etc/openvpn/easyrsa-scripts/keys/

cp ca.crt server.crt server.key dh1024.pem /etc/openvpn

قم بإعطاء شهادات ومفاتيح المستخدم وأيضاً شهادة الخادم، لكي يضعها في جهازه والتي هي:

user1.crt

user1.key

ca.crt

قم بإعادة تشغيل خدمة OpenVPN:

/etc/init.d/openvpn restart

قبل أن أنسى، قم بتفعيل ip_forward لكي تستطيع التمرير للحزم الى داخل الشبكة، من خلال تحرير الملف:

vim /etc/sysctl.conf

بعد ذلك أحذف اشارة # من امام:

net.ipv4.ip_forward=1

وأحفظ الملف وأخرج وإذا لم تكن تريد الآن عمل إعادة تشغيل لجهازك نفذ الأمر التالي:

sysctl -w net.ipv4.ip_forward=1

للتأكد من التفعيل:

sysctl net.ipv4.ip_forward

الآن لنضيف شوية قوانين iptables للسماح بالخدمة لتمرير الحزم … قم بتحرير الملف /etc/rc.local

vim /etc/rc.local

وضع قبل السطر الذي عليه (exit 0) القوانين التالية:

iptables -P FORWARD ACCEPT

iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

الشبكة 10.8.0.0/24 هي التي سيتم إستعمالها من قبل OpenVPN كما في ملف الإعداد للخدمة، و eth0 هو المنفذ الذي يصلك بالأنترنت (ربما عندك هو شيء آخر قم بتغييره).

الآن لنقوم بإعادة تشغيل الجهاز أو إعادة تشغيل ملف rc.local من خلال الأمر:

/etc/init.d/rc.local start

الآن الخدمة تمام وكل شيء والحمد لله … للتأكد:

ps ax | grep openvpn

والناتج هو:

11602 ?        Ss     0:00 /usr/sbin/openvpn --writepid /var/run/openvpn.server.pid --daemon ovpn-server --cd /etc/openvpn --config /etc/openvpn/server.conf --script-security 2

الآن من جهاز المستخدم أستعمل أي طريقة من التي قمت بشرحهم سابقاً في الإتصال بهذه الخدمة وربط الشبكة التي هناك بالشبكة VPN …

طبعاً طريقة التعامل مع OpenVPN سهلة جداً جداً جداً مقارنة مع IPSec التي تحتاج الى ترقيعات وتعديلات على نواة جنو/لينوكس نفسها لكي تسمح النواة بتمرير حزم IPSec من خلالها … عملت عليهم على مستوى الـ Hardware وتمكنت من ربط شبكات عدة ببعضها البعض، ولكن بإستعمال نظام جنو/لينوكس مثل OpenSWAN لم أستعمله بعد … لكن إن شاء الله قريباً نتعرف عليه هو الآخر …

المصادر:

كتاب [Linux Networking Cookbook](http://www.amazon.com/Linux-Networking-Cookbook-Carla-Schroder/dp/0596102488) | [الموقع الرسمي للـ OpenVPN](http://openvpn.org/)

بالتوفيق للجميع …
