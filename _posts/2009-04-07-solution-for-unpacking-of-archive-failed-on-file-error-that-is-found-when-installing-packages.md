---
title: "حل مشكلة unpacking of archive failed on file عند تنصيب الحزم"
date: 2009-04-07 19:23:40 -0500
categories: ["WHM/Cpanel"]
tags: ["attributes", "chattr", "lsattr", "upcp"]
permalink: "/2009/04/07/solution-for-unpacking-of-archive-failed-on-file-error-that-is-found-when-installing-packages/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

بالأمس أيضاً واجهتني مشكلة أخرى الآن تذكرت أن أكتب عنها وعن حلها::bgrim::

ملاحظة: هذه المشكلة ظهرت على خادم عليه لوحة تحكم WHM/CPanel …

كنت أريد أن أقوم بتحديث النظام … لكن كان كل مرة يفشل في إكمال التحديث بسبب هذه المشكلة التي بالأسفل:

Downloading Packages:

bind-utils-9.3.4-10.P1.el5.i386.rpm

Running rpm_check_debug

Running Transaction Test

Finished Transaction Test

Transaction Test Succeeded

Running Transaction

Installing     : bind-utils                                        [1/1]

Error unpacking rpm package 30:bind-utils-9.3.4-10.P1.el5.i386

error: unpacking of archive failed on file /usr/bin/dig: cpio: rename

Installed: bind-utils.i386 30:9.3.4-10.P1.el5

Complete!

صحيح هو يقول بإنه تم التنصيب، لكن هذه الرسالة لا تختفي وأشك بإنه التنصيب تحقق بشكل سليم … حاولت بطريقة أخرى:

/scripts/ensurerpm bind-utils

لكن نفس المشكلة تظهر مرة أخرى !!! ولهذا قمت بحذف الحزمة:

rpm -e bind-utils

ورجعت عملت تحديث للنظام:

/scripts/upcp --force

ولكن كانت تظهر نفس المشكلة مرة أخرى  ::sady::

طيب والحل ؟ وبعدين هي مطولة معك ههههههههههههه ::hehe:: ؟ الجواب لا  ::bgrim::

المشكلة تقول بإنه الحزمة غير قادرة على إستبدال البرنامج الحالي dig … فقمت بعرض صلاحياته:

ls -l /usr/bin/dig

لا يوجد فيه شيء غريب … لكن بعد ذلك قلت خليني نشوف الـ attributes الخاصة به:

lsattr /usr/bin/dig

فكان الجواب:

----i------------- /usr/bin/dig

هنا عرفت بإن المشكلة بإن البرنامج تم وضع خيار Immutable عليه، ولهذا قمت بتغييره وحذف هذا الخيار عنه:

chattr -i /usr/bin/dig

وبعدها رجعت عملت تحديث وقف عند برنامج أخر أظن كانت host، رحت عملت نفس الشي:

chattr -i /usr/bin/host

ورجعت عملت تحديث وجدت برنامج آخر … كل ما عليك فعله هو رفع هذا الخيار عن البرنامج الذي يظهر فيه الخلل ومن ثم قم بإرجاعه بعد نجاح التنصيب … بالأخير أنهيت التنصيب بشكل سليم:

Finished Transaction Test

Transaction Test Succeeded

Running Transaction

Installing     : bind-utils                                        [1/1]

Installed: bind-utils.i386 30:9.3.4-10.P1.el5

Complete!

والحمد لله … كل ما عليك فعله الآن هي إرجاع الصلاحيات الذي حذفناها من خلال الأمر:

chattr +i /usr/bin/dig

chattr +i /usr/bin/host

ونفس الشيء بالنسبة لباقي البرامج الذي حذفت الصلاحيات عنها … وخلاص رجع الخادم يعمل Full Option خخخخخخخ

بالمناسبة أنا لست خبير في لوحات WHM/CPanel ولهذا ربما هناك طرق أخرى لحل هذه المشاكل … لكن هذه التي تمكنت من خلالها أنا لحل مشاكلي  ::wink::

بالتوفيق للجميع …
