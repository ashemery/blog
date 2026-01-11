---
title: "مشاكل الـ Defunct Process !!!"
date: 2008-09-19 04:30:14 -0500
categories: ["GNU/Linux"]
permalink: "/2008/09/19/defunct-process-problems/"
reading_time: 2
---

**السلام عليكم ورحمة الله وبركاته**

بعض الأحيان قد يحصل خلل في **process** معيين ويتحول الى **defunct process** … والمشكلة في هذا الحالة تعني بإن الـ **process** ميت **Dead** … ولهذا حتى لو ذهبنا وعملنا:

```
kill -9 PID
```

لن تجدي نفعاً … فهل بعمرك سمعت عن قتل الميت ؟؟؟!!!

![](https://www.linuxac.org/forum/images/smiley/la5ma.gif)

وسيبقى حالة الـ **process** هي هي **defunct** … لا أعلم بالنسبة لمدراء الخوادم بدون شك مرت عليهم سواءاً مع *SSH* أو *HTTPD* أو أي خدمة أخرى يقدمونها …

سؤال: ما هي الحلول لـ process في حالة الـ defunct؟

الجواب: هناك ثلاث حلول

**الأول:** قم بالبحث عن الـ **process** الأب للبرنامج وقم بعمل غلق له kill مثلاً:

```
ps -A | grep defunct
```

هذه ستعرض لكم الـ **processes** التي حالتها **defunct**.

أو لمعرفة الـ **PPID** أي الـ **ID** الخاص بالأب **Parent Process** قم بتنفيذ التالي:

```
ps -ef | grep defunct
```

الآن عرفنا الـ **PPID** قم بعمل kill له:

```
kill -9 PPID
```

أعد تنفيذ الأمر الأول لمعرفة هل لازالت بحالة **defunct** أم لا:

```
ps -A | grep defunct
```

أيضاً يمكنك إستعمال الأمر:

```
pstree
```

لمعرفة الأب للـ **Process** … الطرق كثيرة والهدف روما

![](https://www.linuxac.org/forum/images/smiley/tooth.gif)

لو كانت قد أنحلت المشكلة وذهبت الـ **defunct process** ممتاز أنحلت المشكلة، إن لم تذهب؟ تابع …

**الثاني:** قم بحذف الملفات المؤقتة المرتبطة بهذا الـ **process** في الغالب ستجدهم في المجلد

```
/tmp
/var/run
/var/lock/subsys
```

ومن ثم تأكد كل شيء تمام:

```
ps -A | grep defunct
```

إن لم تحل المشكلة؟ أذهب للحل الأخير …

**الثالث:****تعيد تشغيل النظام**

![](https://www.linuxac.org/forum/images/smiley/tooth.gif)

![](https://www.linuxac.org/forum/images/smiley/3ayoo6.gif)

![](https://www.linuxac.org/forum/images/smiley/tooth.gif)

![](https://www.linuxac.org/forum/images/smiley/3ayoo6.gif)

بأمانة هناك بعض المرات ستجد بإنه فعلاً هذه الـ **processes** لا تستطيع إيقافها حتى بالـ

```
kill -9 PID
```

**وضعت الموضوع لارى هل هناك في جعبة أحدكم غير الحلول الثلاثة التي ذكرتهم؟؟؟؟؟**

إن كان لديك حل يرجى الإضافة … لأن هذه الـ **defunct** تسبب قلق خاصة لما عندك سيرفر شغال في بيئة Production ولم تنفع معك الحالات السابقة وتضطر الى عمل إعادة تشغيل للنظام

![](https://www.linuxac.org/forum/images/smiley/ob.gif)

![](https://www.linuxac.org/forum/images/smiley/frustrated.gif)

![](https://www.linuxac.org/forum/images/smiley/blabla.gif)

غندك حلول وأفكار ؟ تعال خبرنا فيها —> [أضغط هنا](https://www.linuxac.org/forum/showthread.php?t=15460)
