---
title: "Compiling a Network Program using Pcap Library in CodeBlocks"
date: 2011-12-06 02:15:39 -0500
categories: ["Development", "Networks"]
tags: ["Build", "CodeBlocks", "Compile", "Compiling", "gcc", "include", "Linker", "pcap"]
permalink: "/2011/12/06/compiling-a-network-program-using-pcap-library-in-codeblockslibrary/"
reading_time: 2
---

في حالة قيامك بعمل Compile لبرنامج يستعمل [pcap](http://libpcap.org) في [CodeBlocks](http://codeblocks.org) فإنه سوف يعطيك خطأ وذلك لأنه لن يستطيع التعرف على المتغييرات والدوال الموجودة في مكتبة pcap بشكل أساسي، ولهذا علينا إضافة المكتبة لعملية الـ Compile … حتى لو كنت قد أضفت سطر الـ include لهذه المكتبة، بدون إخبار CodeBlocks ببناء هذا البرنامج بوجود هذه المكتبة لن ينفع …

أنتهينا من الكلام، لنبدأ العمل … أول شيء نعمله هو إننا نريد أن نضيف المكتبة pcap الى الـ Linker وذلك ليتم ربطها مع البرنامج لحظة عمل Compile له … ويمكن عمل ذلك من خلال الضغط على إسم المشروع في CodeBlocks Workspace ومن ثم الذهاب الى Build Options … كما في الصورة:

[![](/assets/img/posts/2011/buildoptions-213x300.png)](/assets/img/posts/2011/buildoptions.png)

بعد ذلك نتأكد من إختيارنا لـ Debug ونذهب الى صفحة Linker Settings ونقوم بإضافة المكتبة pcap … كل الذي عليك فعله هو الضغط على add ومن ثم كتابة pcap … هذا لأني أفترض إنك قمت بتركيب pcap حسب نظام الحزم لديك وتم وضعه في المسار الطبيعي للمكتبات … إن كنت قد قمت بتركيب pcap بشكل يدوي؟ عليك بإضافة المسار الكامل له … الصورة توضح العملية:

[![](/assets/img/posts/2011/addpcap-300x266.png)](/assets/img/posts/2011/addpcap.png)

بعد الإنتهاء من الإضافة كما في الصورة التي بالأسفل، كل الذي عليك فعله الآن هو عمل بناء أو Compile للبرنامج …

[![](/assets/img/posts/2011/pcapadded2linker-300x265.png)](/assets/img/posts/2011/pcapadded2linker.png)

**ملاحظة مهمة:** لا تنسى يجب ان تكون قد قمت بعملية تركيب لمكتبة pcap من الأساس …

```
P.S: apt-get install libpcap-dev libpcap0.8
```

بالتوفيق لكم …
