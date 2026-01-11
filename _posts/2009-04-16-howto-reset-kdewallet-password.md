---
title: HOWTO reset kdewallet password
date: 2009-04-16 10:21:45 -0500
categories:
- GNU/Linux
- Software/Tools
tags:
- gaim
- kde
- kde4
- kopete
- pidgin
- wallet
- walletmanager
permalink: /2009/04/16/howto-reset-kdewallet-password/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

بصراحة مليت من كون كلماتك السرية على الجهاز معروفة بسبب Pidgin وما لقيت برنامج أفضل منه سوى Kopete … الجميل في Kopete بإنه يستعمل KDE Wallet لحفظ الكلمات السرية … وهذه الحافظة تقوم بتشفير الكلمات السرية هذه ولهذا هي في آمان ولله الحمد …

لكن !!!

المشكلة إني نسيت ما هي الكلمة السرية الي حطيتها لبرنامج KDE Wallet … قريت من خلال البحث في Google واحد يقول ركب برنامج KDE WalletManager … ركبته لكن ما ظهر لي بإنه عندي Wallet أصلاً وأنا متأكد إنه موجود !!!

طيب والحل؟ الحل إني رحت أدور بملفات المستخدم الي استعمله، بداخل المجلد الرئيسي له … دورت في المجلد:

.kde4/share/apps/

ولقيت بإنه هناك مجلد بداخله إسمه kwallet … ممتاز … دخلت عليه وقمت بعمل التالي:

mv kdewallet.kwl kdewallet.kwlOLD

ورحت شغلت برنامج KDE WalletManager ثاني ورحت حطيت كلمة سرية جديدة وكل شي تمام … طبعاً الفكرة هي بإن البرنامج KDE WalletManager اول ما شغلته وسويت كلمة سر جديدة راح عمل ملف جديد إسمه kdewallet.kwl بالمجلد:

~/.kde4/share/apps/

ملاحظة: قد تكون تستعمل الـ KDE القديم ما قبل KDE4 ولهذا سيكون مسار ملفك هو:

~/.kde/share/apps/

والحين خلاص أنتقلت الى برنامج Kopete بعد سنوات طويلة جداً من العمل على Gaim ومن ثم Pidgin … الآن كل الكلمات السرية مشفرة  ::bgrim::

ودمتم بود …
