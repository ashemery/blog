---
title: Howto To control vmware images from the CLI
date: 2010-01-29 00:35:07 -0500
categories:
- Virtualization
tags:
- clone
- images
- installtools
- register
- reset
- start
- stop
- unregister
- upgradevm
- vmrun
- vmware
permalink: /2010/01/29/howto-to-control-vmware-images-from-the-cli/
reading_time: 2
---
******السلام عليكم ورحمة الله وبركاته**

****أستعمل vmware كثيرا في عملي للتجارب وغيرها من الأمور … وفي الاسبوع الماضي بحثت عن طريقة التعامل مع الصور Images من خلال سطر الأوامر … يعني بدل من الدخول الى الخادم بواسطة المتصفح، أقوم بالتشغيل والإغلاق من خلال سطر الأوامر أو الطرفية … كل ذلك ممكن من خلال الأمر vmrun …

**ملاحظة مهمة جداً:**

**أهم نقطة يجب ان يكون النظام (صورة النظام) هذا محمل وراكب عليه Vmware Tools … هذا قبل ان تستمر بالقراءة …**

الآن بالغالب إذا لم تقم بعمل مستودعات خاصة، فإنه المستودع الرئيسي للـ VMWARE Server2 هو [standard] … اي فيه مسار وجود الصور للأنظمة التي يمكنك تشغيلها …

**لعرض الصور التي تعمل على الخادم حالياً:**

كود:

```
vmrun -T server -h https://IP_address:8333/sdk -u root -p  list
```

هنا أستعملنا الأمر vmrun ومن ثم ما بعد الحرف T والذي هو server هو لكي نوضح بإننا نستعمل نسخة الخادم … وبعدها تضع الرابط للخادم ومن ثم أسم المستخدم المستعمل لإدارة الـ vmware server والذي هو هنا في مثالنا root ومن ثم كلمة المرور له وبالأخير الأمر list وذلك لكي يعرض الذي يعمل على الخادم حالياً …

**لغرض تشغيل صورة:**

كود:

```
vmrun -T server -h https://IP_address:8333/sdk -u root -p  start "[standard] WinXP/WinXP.vmx"
```

هنا قمنا بتمرير الأمر start الى الصورة الموجودة في المسار الرئيسي [standard] والموجودة في المجلد WinXP/ والتي إسمها WinXP.vmx …

**لغرض إيقاف عمل صورة بشكل عادي:**

كود:

```
vmrun -T server -h https://IP_address:8333/sdk -u root -p  stop "[standard] WinXP/WinXP.vmx" soft
```

هنا أستعملنا الأمر stop لإيقاف الصورة ولكن بشكل soft … أي ليس بشكل قسري …

**لغرض إيقاف عمل صورة بشكل قسري:**

كود:

```
vmrun -T server -h https://IP_address:8333/sdk -u root -p  stop "[standard] WinXP/WinXP.vmx" hard
```

**لعمل إعادة تشغيل لصورة بشكل عادي:**

كود:

```
vmrun -T server -h https://IP_address:8333/sdk -u root -p  reset "[standard] WinXP/WinXP.vmx" soft
```

**إذا كنت لم تقم بتسجيل الصورة سابقاً؟ فقم بذلك من خلال الأمر:**

كود:

```
vmrun -T server -h https://IP_address:8333/sdk -u root -p  register "[standard] WinXP/WinXP.vmx"
```

**وإذا كنت تريد إلغاء تسجيل الصورة، نفذ الأمر:**

كود:

```
vmrun -T server -h https://IP_address:8333/sdk -u root -p  unregister "[standard] WinXP/WinXP.vmx"
```

اوامر أخرى أكتشفها بنفسك:

كود:

```
installtools
upgradevm
clone
```

وهناك غيرهم … إن شاء الله تفيدكم …

للنقاش: [أضغط هنا](https://www.linuxac.org/forum/showthread.php?35549)

دمتم بود …
