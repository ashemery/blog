---
title: "عمل mount لمجلد على Samba بواسطة fstab"
date: 2008-10-14 10:00:20 -0500
categories: ["Linux Services"]
permalink: "/2008/10/14/mounting-a-samba-share-using-fstab/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

لعمل mount لمجلد تم عمل مشاركة share له من خلال Samba لكي يظهر لك بعد تشغيل النظام (إعادة التشغيل) مباشرة كل ما عليك فعله هو التالي:

```
vim /etc/fstab
```

بعد ذلك لنفرض أسم المجلد هو binary وهو موجود على الخادم 10.0.0.1 والمستخدم الذي مسموح له الوصول له هو binary سيكون الأمر هكذا:

```
//10.0.0.1/binary /mnt/samba smbfs 
username=binary,password=password 0 0
```

ضع بدل password الكلمة السرية للمستخدم binary وسيعمل هذا السطر لك mount تلقائي عند تشغيل الجهاز.

ودمتم …
