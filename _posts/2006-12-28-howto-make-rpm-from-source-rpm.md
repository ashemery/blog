---
title: "بناء rpm من ملف source rpm"
date: 2006-12-28 14:03:51 -0500
categories: ["GNU/Linux"]
permalink: "/2006/12/28/howto-make-rpm-from-source-rpm/"
reading_time: 2
---

**السلام عليكم ورحمة الله وبركاته …**

في بعض الأحيان تكون تبحث لساعات عن برنامج معيين وبالتالي تجد له فقط

> pkgname.src.rpm

طيب ما الحل ؟؟؟ المشكلة انت بحاجة للبرنامج هذا لكن الملف pkgname.src.rpm هذا عبارة عن حزمة rpm لكن ﻻ تحتوي على الملفات الـ binary لهذا البرنامج وإنما على الكود source له … فماذا نفعل في هذه الحالة ؟ نريد حل … البرنامج نحن بحاجة أليه … النجدة … الفزعة … عاجل … ههههههه الحل بسيط :) تابع معي فقط …

لبناء الحزمة نفذ التالي:

rpmbuild –clean –rebuild pkgname.src.rpm

هذا سيقوم ببناء الملف .rpm لك … ويضعه لك في مجلد خاص بهيكلية جهازك تحت المجلد هذا /usr/src/packages/RPMS يعني لو نفرض هيكلية جهازك هي x86 سيضعها لك في مجلد إسمه /usr/src/packages/RPMS/x86 وهكذا بالنسبة للأنواع الأخرى مثل x86_64 وغيرها …

في بعض الأحيان تحتاج أن تعملها كالتالي:

rpm -i packagename.src.rpm

cd /usr/src/packages/SPECS

rpmbuild -bb packagename.spec

rpmbuild –clean packagename.spec

exit

cp /usr/src/packages/RPMS/x86/pkgname.rpm /home/username

طبعا --bb تعني أبني ال binary pckg بعد أن تنفذ مرحلة الـ prep الإعداد … ومرحلة الــ build البناء … وأخيرا مرحلة التنصيب install …

–clean تعني أحذف ملفات البناء بعد الإنتهاء … والكثير من الأوامر الثانية هي معروفة مسبقا للجميع …

هذه الطريقة تعمل تحت توزيعة لينوكس سوزي openSuSE أو حتى SLES لكن تحت التوزيعات الأخرى مثل RedHat يجب عليك أن تقوم بتنصيب برنامج الـ rpmbuild بالأول حتى تستطيع تنفيذ هذه الخطوات …

أتمنى ينال إعجابكم …

أخوكم B!n@ry …
