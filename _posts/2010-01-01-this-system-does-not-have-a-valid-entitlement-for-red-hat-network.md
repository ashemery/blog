---
title: "This system does not have a valid entitlement for Red Hat Network"
date: 2010-01-01 10:44:30 -0500
categories: ["Linux Security", "Linux Services", "Patch Management"]
tags: ["entitlement", "Redhat", "RHEL", "RHN", "rhn_register"]
permalink: "/2010/01/01/this-system-does-not-have-a-valid-entitlement-for-red-hat-network/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

بعض الأحيان ربما بسبب عدم تجديد ترخيص توزيعتك RHEL مع شركة Redhat تسبب ظهور مثل هذه الرسالة عندما تحاول تعمل تحديث:

> RHN support will be disabled. Error Message: Service not enabled for system profile: “server” Error Class Code: 31 Error Class Info: This system does not have a valid entitlement for Red Hat Network. Please visit https://rhn.redhat.com/rhn/systems/SystemEntitlements.do or login at https://rhn.redhat.com, and from the “Your RHN” tab, select “Subscription Management” to enable RHN service for this system. Explanation: An error has occurred while processing your request. If this problem persists please enter a bug report at bugzilla.redhat.com. If you choose to submit the bug report, please be sure to include details of what you were trying to do when this error occurred and details on how to reproduce this problem.

أيضاً ربما قمت بتغيير إسم البروفايل من Server الى حاجة أخرى تسبب هذه المشكلة … على كل حال هذه المشكلة حصلت معي على خادم بسبب عدم تجديد الترخيص من قبل المسؤول عن التجديدات عندنا وحدثت على خادم آخر بعد تغيير أسم البروفايل … يعني الحل الذي سأكتبه يصلح للجميع إن شاء الله …

قم بالبداية بالدخول الى موقع Redhat والى [Redhat Network](rhn.redhat.com) بالتحديد ومن ثم أذهب الى Entitlement أو الى Systems وقم بحذف البروفايل حق الخادم الذي ظهرت عليه المشكلة … بعد ذلك أدخل الخادم نفسه وأعمل التالي:

```
rm /etc/sysconfig/rhn/systemid
```

ومن ثم قم بعملية تسجيل للخادم من جديد، وكأنك تسجله أول مرة مع [Redhat Network](rhn.redhat.com) من خلال:

```
rhn_register
```

وبعد ذلك ستعمل جميع الإمور إن شاء الله وتستطيع تحديث النظام بكل سهولة مرة أخرى سواءاً من موقع [Redhat Network](rhn.redhat.com) مباشرة أو من خلال الدخول الى الخادم وتنفيذ الأمر:

```
yum update
```

وفي حالة الترقية:

```
yum upgrade
```

بالتوفيق للجميع …
