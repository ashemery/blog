---
title: "HOWTO Split Large files using TAR"
date: 2009-02-13 11:16:48 -0500
categories: ["GNU/Linux"]
tags: ["tar"]
permalink: "/2009/02/13/howto-split-large-files-using-tar/"
reading_time: 3
---

**السلام عليكم ورحمة الله وبركاته**

بعض الأحيان لديك ملف كبير وتريد ان ترسله مثلا للناس لكي يقوموا بتحميله ولكن الكثير منهم يعاني من بعض مشاكل سرعة النت … ولهذا يفضل تقوم بتقسيم الملف هذا الى أقسام وتعطي الناس روابط لتلك الأقسام لكي يقوموا بتحميلهم واحد واحد … اليوم أريد عمل ذلك في هذا الموضوع من خلال إستعمال tar …

الآن لنفرض لدينا ملف لتوزيعة أعجوبة :) Ojuba2-Live.iso وحجمها حوالي 700 ميغا … ونريد تقسيمها الى أقسام كل قسم حجمه 100 ميغا … سنقوم بالبداية بالعملية الحسابية:

100 * 1024 = 102400

أي الـ 100 ميغا = 102400 كيلو بايت …

الآن نفذ الأمر التالي:

tar -c -M -v –tape-length=102400 –file=Ojuba2-Live.iso1.tar Ojuba2-Live.iso

سيبدأ البرنامج بسؤالك كالتالي:

Ojuba2-Live.iso

Prepare volume #2 for `Ojuba2-Live.iso1.tar’ and hit return:

قم بالرد على السؤال بالتالي:

n Ojuba2-Live.iso2.tar

وبعدها رد بالتالي:

n Ojuba2-Live.iso3.tar

وهكذا الى أن ينتهي من التقسيم الى العدد الممكن … أي بالنهاية ستحصل على مخرجات كهذه:

Prepare volume #2 for `Ojuba2-Live.iso1.tar’ and hit return: n Ojuba2-Live.iso2.tar

Prepare volume #3 for `Ojuba2-Live.iso2.tar’ and hit return: n Ojuba2-Live.iso3.tar

Prepare volume #4 for `Ojuba2-Live.iso3.tar’ and hit return: n Ojuba2-Live.iso4.tar

Prepare volume #5 for `Ojuba2-Live.iso4.tar’ and hit return: n Ojuba2-Live.iso5.tar

بعدها لترى النواتج أعمل:

ls -l

الخيارات التي أستعملت:

-c هو لعمل ملف tar

-M هو لإخباره بإننا نريد التقسيم عبر أجزاء متعددة

-v أي أعرض لنا تفاصيل

–tape-length هي التي نحدد من خلالها حجم القسم الواحد

–file هي التي من خلالها نحدد اسم القسم الواحد

الآن إن أردنا عملية إعادة فك التقسيم للأراشيف التي عملناهم نفذ التالي:

tar -x -M -v –file=Ojuba2-Live.iso1.tar Ojuba2-Live.iso

سيقوم بسؤالك بنفس الطريقة السابقة … أدخل الجزء الثاني ثم الثالث الى ان تصل الى الأخير … مثال:

Prepare volume #2 for `Ojuba2-Live.iso1.tar’ and hit return: n Ojuba2-Live.iso2.tar

Prepare volume #3 for `Ojuba2-Live.iso2.tar’ and hit return: n Ojuba2-Live.iso3.tar

Prepare volume #4 for `Ojuba2-Live.iso3.tar’ and hit return: n Ojuba2-Live.iso4.tar

Prepare volume #5 for `Ojuba2-Live.iso4.tar’ and hit return: n Ojuba2-Live.iso5.tar

بعدها لترى النواتج أعمل:

ls -l

نفس الخيارات أستعملت هنا بإستثناء الخيار x والذي هو لفك الأرشفة بدل الخيار c والذي كان لعمل ارشيف …

إن شاء الله يكون الموضوع مفيد لأحدكم …

ودمتم بود …
