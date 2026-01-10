---
title: "عجز Metasploit تغطيه W3af"
date: 2009-01-03 13:32:49 -0500
categories: ["Database", "PenTest", "Web Security"]
tags: ["LFI", "Metasploit", "RFI", "SQL Injection", "Wa3f", "Web Application", "XSS"]
permalink: "/2009/01/03/web-application-attack-and-audit-framework/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

![](http://binary-zone.com/images/pentest/w3af.png)

ربما كل من أستعمل Metasploit يعمل تماماً بإن هذه الـ framework فيها عيوب ونواقص … صحيح هي من أروع البيئات التطويرية لإكتشاف الثغرات وتطوير الإستغلال المناسب لها … وأيضاً مستعملة في إختبار الإختراق ولكن يعيبها أمرين:

**الأول:** هي غير قادرة على اكتشاف الثغرات في الـ Web Application …

**ثانياً:** هي غير قادرة على اكتشاف مشاكل وثغرات الـ SQL Injection ..

ولهذا بعد البحث حسب رأيي أعتقد بالنسبة للنقطة الأولى فإنه أصبح يمكن تلافيها من خلال إستعمال [Wa3f](http://w3af.sourceforge.net) والذي هي إختصار لـ Web Application Attack and Audit Framework وكما تلاحظون من الإسم فهو بيئة مخصصة لإكتشاف المشاكل والثغرات في برمجيات الويب Web Application … الهدف كما ذكره الموقع الرسمي للبيئة هو عمل بيئة عمل لإكتشاف وإستغلال الثغرات الموجودة في برمجيات الويب والتي يمكن بسهولة إستخدامها والإضافة عليها … يعني لها نفس الأهداف التي للـ Metasploit ولكن هذه موجهة لبيئة معينة من التطبيقات …

المشروع/البيئة تحتوي على أكثر من 130 برنامج ملحق Plugin تقوم بفحص إن كان هناك SQL Injection أو Cross Site Scripting أي XSS وأيضاً لديها الإمكانيات للبحث عن LFI و RFI  …

[تحميل المشروع](http://sourceforge.net/project/showfiles.php?group_id=170274) **|** [دليل استخدام المشروع](http://w3af.sourceforge.net/documentation/user/w3afUsersGuide.pdf) **|** [عرض للمشروع](http://w3af.sourceforge.net/documentation/user/w3af-T2.pdf)**|** [FAQ](http://w3af.sourceforge.net/faq.php) **|** [الموقع الرسمي](http://w3af.sourceforge.net)

أنصحكم بقراءة الـ FAQ فهي جداً مفيدة وممكن تتعرفون الى تفاصيل أكثر من ما ذكر هنا …  وعلى كل حال إن شاء الله قريباً أحاول شرح كيفية ربط المشروع W3af مع مشروع Metasploit …

**تريد تركيبه؟** أنصحك بإستخدام svn في عمل ذلك … أو تابع الموقع الرسمي لكيفية التحميل والتركيب … أما لو أحببت تركيبه من خلال svn فكل ما عليك فعله هو الذهاب الى المكان الذي تريد تحميل المشروع أليه وليكن المجلد الرئيسي لك ومن ثم تنفيذ الأمر:

```
svn co https://w3af.svn.sourceforge.net/svnroot/w3af/trunk w3af
```

وخلاص ::18

ودمتم بود …
