---
title: "إيقاف إنتهاء مدة فاعلية كلمة السر"
date: 2007-05-23 20:28:14 -0500
categories: ["Linux Security"]
permalink: "/2007/05/23/howto-stop-password-expiration/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

منذ مدة طويلة لم أكتب حول لينوكس  ::19 وسبق أن ذكرت السبب ولكن اليوم تذكرت مسألة بسيطة وجميلة أحببت أن أذكرها هنا عسى أن تكون محل فائدة لأحدكم … هذه المسألة هي كيفية إيقاف العمر أو مدة فاعلية كلمة السر الخاصة بمستخدم معيين بحيث تصبح OFF …

الحين لمعرفة الإعدادات الحالية لمستخدم معيين إسمه binary مثلاً أعمل التالي:

```
rul3z:~ # chage -l notes
```

سيكون الناتج هو كالتالي:

```
Minimum:        0
Maximum:        99999
Warning:        7
Inactive:       -1
Last Change:            May 10, 2007
Password Expires:       Never
Password Inactive:      Never
Account Expires:        Never
```

الآن لإيقاف المدة قم بتنفيذ التالي:

```
rul3z:~ # chage binary
```

وقم بإدخال القيم التالية:

```
Minimum Password Age = 0
Maximum Password Age = 99999
Password Inactive = -1
Account Expiration Date = -1
```

أو قم بتنفيذ التالي  ::18 :

```
chage -I -1 -m 0 -M 99999 -E -1 username
```

درس بسيط جداً ويمكن تطبيقه بسرعة … سأعود لكم قريباً …

أخوكم B!n@ry …
