---
title: HOWTO change Java Runtime Environment Package
date: 2009-04-16 09:09:28 -0500
categories:
- GNU/Linux
- Software/Tools
tags:
- aria
- idm
- java
- jre
- openjdk
- sun
permalink: /2009/04/16/howto-change-java-runtime-environment-package/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

اليوم أحتجت أشغل برنامج بالجافا والي هو IDM الي ذكره أخونه [PuppetMaster](https://www.linuxac.org/forum/members/puppetmaster.html) في [مجتمع لينوكس العربي](https://www.linuxac.org/forum/linuxac13/thread23982.html) … المشكلة بإنه كلما شغلت البرنامج يقول لي بإنه هذي النسخة من الـ JRE غير صالحة … وموقع البرنامج والأخ صاحب الموضوع يقولون أستعملوا الأمر التالي لإضافة الجافا هذي:

sudo apt-get install sun-java6-jre

ولما نفذت الأمر يقول لي الجافا هذي راكبة عندي وبآخر تحديث !!! طيب والحل ؟

جربت أشغل البرنامج التالي:

update-java-alternatives --set sun-java6-jre

ولكن يقول لي:

update-java-alternatives: directory does not exist: /usr/lib/jvm/sun-java6-jre

وعرفت السالفة، سويت:

ls /usr/lib/jvm/

طلع عندي نسختين من الجافا واحدة الي من Sun والثانية OpenJDK … وكانت أسماء المجلدات هكذا:

java-6-openjdk

java-6-sun

java-6-sun-1.6.0.07

حتى بالحقيقة java-6-sun عبارة عن Link الى مجلد java-6-sun-1.6.0.07 … وبعدها كل الي سويته:

update-java-alternatives --set java-6-sun

وخلاص رحت شغلت البرنامج IDM لكي نرى مميزاته وجماله … إن شاء الله تنفعكم الطريقة … وشكراً للأخ PuppetMaster على البرنامج الجيد، ولكن الى الآن يبقى حبيبي ورقم واحد بالنسبة لي هو aria   ::wink::

دمتم بود …
