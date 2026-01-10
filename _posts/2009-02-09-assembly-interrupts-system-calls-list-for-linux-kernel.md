---
title: "Assembly Interrupts/System Calls list for Linux Kernel"
date: 2009-02-09 15:32:29 -0500
categories: ["Development", "Kernel"]
tags: ["Assembly", "Interrupts", "System Calls"]
permalink: "/2009/02/09/assembly-interrupts-system-calls-list-for-linux-kernel/"
reading_time: 2
---

**السلام عليكم ورحمة الله وبركاته**

لي فترة أصارع مع Assembly على بيئة جنو/لينوكس … أنا لست خبير في هذه اللغة ولكن الحمد لله عندي صديق خبير فيها بشكل مميز للغاية (عمل ألعاب عليها  ::22 الله يوفقه، لكن هو يعرف أسمبلي على الويندوز وليس جنو/لينوكس) وجالس يساعدني في تعلمها وإتقانها الى حد ما … الأمر الوحيد الذي وقف عائق في وجهنا أنا وهو هي لم نصل الى أرقام الـ Interrupts أو الـ System Calls الخاصة بـ Kernel جنو/لينوكس … عندي Reference ممتاز لـ Interrupts الخاصة بالـ BIOS ولكن للنواة لا … بحثت كثيراً أنا وإياه الجمعة الماضية ولكن كل الذي وجدناه هو الـ System Call على شكل دالة C … أي كلهم يعطونني [HLA](http://en.wikipedia.org/wiki/High_Level_Assembly) … وأنا أريد قائمة الـ Interrupts مع كل متغيير يستطيع أن يأخذها هذا الـ Interrupt … فكما يعرف الأخوة الذين يبرمجون في أسمبلي بإن كل Interrupt له قائمة من القييم التي يقبلها الـ registers أو الذاكرة … وكل واحد من هذه القييم لها دوور ووظيفة … سأواصل البحث وأحاول أشوف طريقة للحصول على هذه القوائم …

راسلت الأخ مؤيد السعدي وأفادني ببعض الأمور منها بإنني عند حصولي على الدالة مثلاً mknod والتي بالـ C تبدأ هكذا:

int mknod(const char *pathname, mode_t mode, dev_t dev);

أخبرني بإنه

pathname —> ebx

mode —> ecx

dev —> edx

سأقوم بالتجربة وأشوف … إن شاء الله تكون حل لما أبحث عنه …

**ملاحظة:** للحصول على هذه الدالة وغيرها أبحث في المصدر للنواة نفسها … يعني هنا:

/usr/src/$(uname -r)/include/asm-x86/

حالياً أنا استعمل [NASM](http://en.wikipedia.org/wiki/Netwide_Assembler) ولكننا وجدنا مؤخراً بإنه لا يدعم الـ Registers الجديدة مثل eex و efx و egx وربما حتى التي تخص الـ Multimedia … لا أعلم إن كان كلامنا 100% سليم أم لا … وربما يستطيع أحد أن يصححني في هذه الناحية … سأحاول تجربة [GAS](http://en.wikipedia.org/wiki/GNU_Assembler) والذي هو لجماعة GNU نفسهم والذي أعتقد يفترض يدعم كل المعالجات الجديدة بما فيها جميع إمكانيات البانتيوم وما بعدها … أيضاً كبداية أنصح بقراءة الكتاب [Linux Assembly Language Programming](http://www.amazon.com/Assembly-Language-Programming-Prentice-Technology/dp/0130879401) بسيط للغاية ويعطيك زبدة بداية الإستعمال للأسمبلي على جنو/لينوكس …  موقع وجدته الحين وأنا أبحث عن رابط للكتاب الذي ذكرته بالأعلى [Which Assembler is the Best?](http://webster.cs.ucr.edu/AsmTools/WhichAsm.html) سأقوم بقرائته أيضاً إن شاء الله وإن شاء الله يفيدكم …

ودمتم بود …
