---
title: "ASP.NET Debug Method Enabled"
date: 2009-07-11 12:07:39 -0500
categories: ["Apache/Tomcat", "Footprinting", "PCI Compliance", "PenTest", "Security", "Web Security", "Windows"]
tags: ["ASP.NET", "debug", "Notepad", "PCI Compliance", "Web Application"]
permalink: "/2009/07/11/asp-net-debug-method-enabled/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

مشكلة أخرى ظهرت عندي عند عمل فحص على PCI Compliance وكانت بإنه الـ Debug مفعل في ملفات ASP.NET وهذه تكشف بعض المعلومات التي لا يفترض يتم كشفها إلا للأشخاص المصرح لهم بذلك authenticated users … ولهذا عليك بإيقاف ذلك أو عمل تعطيل لها من خلال التالي:

قم بفتح ملف **Web.config** بأي محرر مثل Notepad أو غيره … وبعد ذلك أبحث عن مكان وجود الخيار debug … ستجده يساوي true قم بتغييره الى false وخلاص أنتهى الأمر :)

مثال:

هكذا عطلتها على مستوى Web Application واحد فقط … لو تريد تعطيلها على مستوى الجميع؟ كل الذي عليك فعله هو التالي:

حرر الملف **Machine.config** بواسطة برنامج مثل Notepad … وبعد ذلك ضع بدل true كلمة false وخلاص أنتهى الأمر …

مراجع مفيدة: [الأول](http://support.microsoft.com/kb/815157)
