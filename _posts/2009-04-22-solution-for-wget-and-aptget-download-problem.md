---
title: "حل مشكلة تحديث الحزم apt-get update وعدم إمكانية التحميل بواسطة wget"
date: 2009-04-22 13:16:41 -0500
categories: ["GNU/Linux", "Software/Tools"]
tags: ["apt-get", "http_proxy", "set", "variable", "wget"]
permalink: "/2009/04/22/solution-for-wget-and-aptget-download-problem/"
reading_time: 7
---

السلام عليكم ورحمة الله وبركاته

قبل فترة صارت عندي مشكلة بحيث لا أستطيع تحميل أي ملف من النت من خلال wget وأيضاً لما فكرت في تحديث مكتبة الحزم عندي بواسطة apt-get أيضاً فشلت وذلك لإنه يستخدم wget في التحميل والذي لا يعمل عندي أصلاً !!!

صراحة يومها وجدت الحل ولكن قبل يومين رجعت عندي نفس المشكلة وبسبب عدم كتابتي للحل للمشكلة، وكوني نسيت كيف قمت بحل المشكلة، أضطررت للبحث عن حل مرة أخرى …

لو أردنا تحميل ملف من موقع بواسطة wget وليكن:

wget -c -U Mozilla /assets/files/2009/ssh.pdf

المشكلة التي ستظهر هي التالي:

--13:15:43--  /assets/files/2009/ssh.pdf

=> `ssh.pdf'

Connecting to 61.7.231.36:80... connected.

Proxy request sent, awaiting response... 400 Bad Request

13:15:44 ERROR 400: Bad Request.

عند محاولة تحديث الحزم:

sudo apt-get update

المشكلة التي ستظهر لك هي التالي:

Err http://archive.ubuntu.com hardy Release.gpg

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy/main Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy/restricted Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy/universe Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy/multiverse Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-security Release.gpg

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-security/main Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-security/restricted Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-security/universe Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-security/multiverse Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-updates Release.gpg

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-updates/restricted Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-updates/main Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-updates/multiverse Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Err http://archive.ubuntu.com hardy-updates/universe Translation-en_US

Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

Reading package lists... Done

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy/Release.gpg  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy/main/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy/restricted/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy/universe/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy/multiverse/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-security/Release.gpg  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-security/main/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-security/restricted/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-security/universe/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-security/multiverse/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-updates/Release.gpg  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-updates/restricted/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-updates/main/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-updates/multiverse/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/hardy-updates/universe/i18n/Translation-en_US.bz2  Could not connect to localhost:8080 (127.0.0.1). - connect (111 Connection refused)

W: Some index files failed to download, they have been ignored, or old ones used instead.

W: You may want to run apt-get update to correct these problems

لو نظرنا الى السطر هذا من مخرجات wget:

Connecting to 61.7.231.36:80... connected.

لرأينا بإن 61.7.231.36 لا يمثل رقم الـ IP لموقع binary-zone.com وبالتالي هناك خلل !!! هنا تذكرت بإن الأمر يعود الى مشكلة في البروكسي … وتذكرت بإني قمت بإعداد البروكسي في أحدى المتصفحات للإتصال بالبروكسي هذا ويبدو كون المتصفح ذاك هو من برامج GNOME نفسها، فإنه على ما يبدو يقوم بالتعديل على إعدادات GNOME نفسها … وبالتالي كان يجب ان أقوم بالتعديل على هذه الإعدادات … هناك حلول كثيرة لهذه الحالة أليكم الروابط التي فادتني بشكل كبير جداً:

[الأول](http://ubuntuforums.org/showthread.php?t=1575) | [الثاني](http://ubuntuforums.org/archive/index.php/t-1586.html) | [الثالث](http://ubuntuforums.org/showthread.php?t=858016) | [الرابع](http://ubuntuforums.org/showthread.php?t=1064343)

للتأكد بإنك تستعمل بروكسي أو إن هناك إعدادات للبروكسي عندك، سنقوم بالتأكد من ذلك من خلال رؤية قيمة المتغيير http_proxy وذلك من خلال تنفيذ الأمر التالي:

set | grep proxy

إذا لم ترى المخرجات كهذه:

http_proxy=

-p --http-proxy --no-http-proxy\

--ftpproxy --ftpport --justdb --httpproxy --httpport \

--httpproxy --httpport --provides --triggers \

--httpproxy --httpport --provides --triggers \

--httpproxy --httpport --provides --triggers \

ورأيت رقم IP ؟ هذا يعني بإنك قمت بإعداد بروكسي في مكان ما … وجميع الروابط بالأعلى فيها حلول لتجاوز ذلك …

بالنسبة لي قمت بعمل حل بسيط وسريع وهو مشابه لما هو موجود في الروابط أعلاه ولكنه ربما أسرع :) حيث كل ما سأقوم به هو إعطاء قيمة جديدة للمتغيير http_proxy وذلك من خلال تنفيذ الأمر التالي:

export http_proxy=

الآن تستطيع إستعمال wget وتحديث الحزم apt-get بكل سهولة مرة أخرى  ::bgrim::

بالمناسبة يوجد الكثير من الأخوة يعانون من هذه المشكلة، وقرأت ربما جميع المواضيع التي [بالمجتمع](http://linuxac.org) والتي تستطيعون الوصول لها من خلال بحث Google الموجود بالأعلى وكلها لم يتم حل مشاكلتهم فيها على ما يبدو  ::bgrim::

دمتم بود …
