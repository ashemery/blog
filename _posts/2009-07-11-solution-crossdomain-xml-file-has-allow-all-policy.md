---
title: 'Solution: CrossDomain.xml File Has Allow-all Policy'
date: 2009-07-11 10:21:15 -0500
categories:
- Apache/Tomcat
- PCI Compliance
- Security
- Web Security
tags:
- pci-compliance
- tomcat
permalink: /2009/07/11/solution-crossdomain-xml-file-has-allow-all-policy/
reading_time: 1
---
السلام عليكم ورحمة الله وبركاته

هذه مشكلة أخرى ظهرت لي أثناء الفحص للحصول على PCI Compliance وهي موجودة في خادم Tomcat … طبعاً هي ممكن تكون خلل في حالات وفي حالات أخرى لا … إن كانت تعرض بيانات للعامة أو غير موجودة خلف جدار ناري الشركة وغيرها … في هذه الحالات ممكن يكون Allow all غير ذلك لا … في حالتي الأمر لا يجب ان لا يتم ربطها إلا مع بيانات تأتي من دومين أو IP معيين … ولهذا الحل كان هكذا:

أفتح الملف:

vim crossdomain.xml

وبدل من كون الملف إعداداته هكذا (أنظر الصورة):

![](http://binary-zone.com/images/pentest/CrossDomain.jpeg)

حيث يعتبر example.com هو الدومين الذي نريد السماح لبياناته بالمرور … الآن أعد تشغيل Tomcat وخلاص سيكون كل شيء تمام الحين … أعد الفحص أيضاً للتأكد من غلقك لهذه المشكلة …

مراجع مفيدة: [الأول](http://kb2.adobe.com/cps/142/tn_14213.html) | [الثاني](http://livedocs.adobe.com/flash/8/main/00001621.html) | [الثالث](http://www.adobe.com/devnet/articles/crossdomain_policy_file_spec.html)

بالتوفيق لكم …
