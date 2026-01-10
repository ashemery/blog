---
title: "Solution: kernel panic-not syncing: VFS: unable to mount root fs on unknown block"
date: 2012-08-22 02:09:23 -0500
categories: ["GNU/Linux", "Kernel", "Virtualization"]
tags: ["bin", "Boot", "Controller", "dmesg", "hd", "IDE", "ISO", "Kernel", "mount", "panic", "SATA", "sd", "storage", "VBoxManage", "VDI", "VirtualBox", "vmdk", "VMware"]
permalink: "/2012/08/22/solution-kernel-panic-not-syncing-vfs-unable-to-mount-root-fs-on-unknown-block/"
reading_time: 3
---

من باب توثيق العمل ولكي أتذكر في حالة حصلت معي نفس الحالة مرة أخرى أود أن أوثق حل لهذه المشكلة التي ظهرت لي. كنت قد جلبت نسخة نظام تخيلي لكن يعمل على بيئة عمل VMware وأنا لا استعمل هذه البيئة بل أستعمل Virtualbox … فأردت تحويل النظام الى النظام الذي يتعامل معه Virtualbox وهو VDI … قمت بتحويل الملف الذي إمتداده vmdk الى bin من خلال:

```
qemu-img convert vmware.vmdk virtualbox.bin
```

طبعاً قم بتغيير الاسماء حسب ما هو موجود لديك … بعد ذلك نفذت الأمر التالي:

```
VBoxManage convertdd virtualbox.bin virtualbox.vdi
```

الآن قمت بفتح برنامج Virtualbox وعملت NEW وقمت بالسير في خطوات إضافة/عمل نظام تخيلي جديد … عند وصولي الى مكان عمل قرص صلب جديد، أخترت إنه لدي واحد وقمت بإختياره … الخطوات كالتالي:

```
NEW -> Next
Name: TESTING
Operating System: Linux
Version: other linux
```

بعد ذلك Next ثم قم بتحديد حجم الذاكرة التي تريد إعطاءها للنظام التخيلي … ثم الضغط على Next … في الصفحة الجديدة قم بإختيار:

```
Use existing hard disk
```

وقم بإختيار النظام الذي قمت بتحويله للتو: virtualbox.vdi … بعد ذلك أكمل باقي الخطوات …

الآن بعد تشغيلي للنظام ظهرت لي المشكلة التي في عنوان التدوينة:

```
kernel panic-not syncing: VFS: unable to mount root fs on unknown block
```

قمت بغلق النظام التخيلي وقمت بفتح الإعدادات وإضافة الى القرص المرن نسخة ملف ISO لنظام لينُكس (مثلاً أوبنتو) … أي أريد نظام أقوم بعمل Boot من خلاله فقط … وبعد ذلك ثبت إعدادات النظام إن الإقلاع من القرص االمدمج هذا وقمت بتشغيل النظام التخيلي مرة أخرى … هكذا دخلت على نظام وليكن حسب ما ورد هنا أوبنتو … ذهبت الى صلاحيات الجذر root وقمت بالبحث في dmesg عن إسم القرص الصلب … فوجدته بإسم sda … وعملت ربط mount له لأرى محتوياته:

```
mount /dev/sda1 /mnt
```

مع شوية بحث بداخل محتويات المجلد /mnt والذي هو النظام الأصلي virtualbox.vdi وليس قرص أوبنتو … علمت بإن النظام مهيء للتعامل مع أقراص من نوع sd وليس hd أي يتعامل مع قرص SATA وليس IDE … ولهذا قمت بغلق النظام ومن ثم ذهبت الى إعدادات النظام التخيلي … وذهبت الى صفحة storage وقمت بإضافة Controller جديد نوعه SATA وقمت بعد ذلك بعمل إلغاء ربط للنظام virtualbox.vdi من الـ Controller الذي نوعه IDE وقمت بربطه مرة أخرى في الـ Controller الذي نوعه SATA … وبعدها حفظت الإعدادات وقمت بتشغيل النظام مرة أخرى …

وهكذا ولله الحمد عاد يعمل مرة أخرى ولكن ببيئة عمل Virtualbox … أتمنى تفيد هذه التدوينة أحد، كما سوف تفيدني بالمستقبل من دون شك كوني كثير النسيان :)

للنقاش: [هنا](http://www.linuxac.org/forum/showthread.php/59926-kernel-panic-not-syncing-VFS-unable-to-mount-root-fs-on-unknown-block)
