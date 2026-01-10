---
title: "تغيير الـ Bash Prompt"
date: 2007-07-31 21:07:08 -0500
categories: ["Development"]
permalink: "/2007/07/31/howto-change-the-bash-prompt/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته …

بعض الأحيان يود البعض تغيير الـ Bash Prompt الى شيء غير الموجود عليه حالياً:

```
[username@host pwd]$
```

أو في حالة المستخدم رووت هي:

```
[root@host pwd]#
```

وتريد تغييرها الى شيء آخر عليك مثلاً:

```
[\u@\h \T]#
```

كل ما عليك فعله هو وضع التالي:

```
export PS1="prompt_code"
```

داخل الملف التالي:

```
~/.bash_profile
```

أي إن كنت مستخدم رووت في الملف:

```
/root/.bash_profile
```

وإن كنت مستخدم بإسم ali:

```
/ali/.bash_profile
```

الآن بعد أن تعمل Log out ومن ثم تعمل Login ستجد إنه تغيير الـ prompt … أو إنك تغلق الشل وتفتحه مرة أخرى …

أو شرايكم تجربون الأمر هذا:

```
source ~/.bash_profile
```

::18

سأقوم بذكر خيارات الــ Bash Shell في أقرب فرصة ممكنة.

أخوكم B!n@ry …
