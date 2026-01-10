---
title: "الجزء الخامس (1) من محاضرات HTID"
date: 2012-12-07 03:31:50 -0500
categories: ["Academia", "Exploitation", "PenTest", "Publications", "Vulnerability"]
tags: ["ASLR", "Assembly", "Canaries", "Cookies", "CPU", "Debuggers", "Demo", "DEP", "Exploit", "Exploitation", "GDB", "Heap", "Immunity Debugger", "Memeory Management", "Memory Corruption", "Metasploit", "mona.py", "Registers", "Ret2libc", "ROP", "SafeSEH", "Stack", "Stack Gaurd"]
permalink: "/2012/12/07/hacking-techniques-and-intrusion-detection-course-part-five-a/"
reading_time: 2
---

في البداية أود أن أشكر أخي العزيز [شادي](http://www.shadinaif.com/) على مساعدتي في عمل هذه المادة بالتحديد … صراحة لم يكن لتخرج المادة بهذا الشكل لولا فضل الله ومن ثم شادي … ألف شكر شادي، وإن شاء الله بميزان حسناتك …

الجزء الخامس معني بالـ  Software Exploitation سواءاً لينُكس أو ويندوز … بصراحة قمت بتقسيمه الى التالي:

**(1)** يتحدث عن مقدمة الى الـ Software Exploitation وماذا نعني بها ولماذا نحتاحها … كذلك الحديث عن المعالجات، المسجلات، لغة أسمبلي، والمكدس Stack وغيرها من الأمور الجد ظرورية لمعرفتها …

Introduction to CPU, Registers, Memeory Management, Assembly, and other stuff

**(2)** مقدمة سريعة عن المنقحات Debuggers … وتم توضيح فكرتهم من خلال برنامج بسيط وبإستعمال GDB …

**(3)** هنا نبدأ الحديث عن التلاعب بالذاكرة والتخريب عليها أو بعبارة أخرى Memory Corruption … في هذا الجزء نبدأ عملية Exploitation … سيتم إستعمال Immunity Debugger هنا … وكذلك سيتم عمل Demo كيفية تحويل الـ Exploit التي تم عملها الى Metasploit بواسطة mona.py …

**(4)** الطرق المتقدمة في التصدي مثل: ASLR, DEP, SafeSEH, NX, Canaries or Cookies or Stack Gaurd وكذلك كيف يمكن تجاوز هذه الحمايات … حيث سنتعرف على Ret2libc, Heap, ROP وغيرها … هذا الجزء متقدم للغاية، ولهذا يجب فهم ما سبق للوصول الى هنا …

تم رفع الجزء الأول والثاني، سيتم رفع البقية في القريب العاجل … المحاضرات تجدونها [هنا](/assets/files/2013/htid.bin.bin) …

بالتوفيق للجميع …
