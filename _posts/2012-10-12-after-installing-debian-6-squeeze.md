---
title: "ما بعد تنصيب Debian 6 Squeeze"
date: 2012-10-12 12:19:36 -0500
categories: ["GNU/Linux", "Software/Tools"]
tags: ["Debian", "Debian6", "FFMPEG", "install", "opera", "Pidgin", "skype", "Squeeze", "update", "upgrade", "VideoLAN"]
permalink: "/2012/10/12/after-installing-debian-6-squeeze/"
reading_time: 2
---

بالنسبة لي بعد أن قمت بتنصيب التوزيعة قمت بإضافة المستودعات التي أحتاجها … وبالنسبة لي هذه هي المستودعات التي أفضلها بصراحة … غيري لربما يفضل مستودعات آخرى لكن أنا أستعمل المستودعات التالية: قم بتحميلها من [هنا](/assets/files/2012/debian6-source.list) …

بعد ذلك كل الذي عليك عمله هو إضافتهم الى مستودعاتك أو تبديلهم بمستودعاتك وعمل:

```
apt-get update
```

```
apt-get upgrade
```

إذا واجهتك مشاكل في مفاتيح GPG الخاصة بالمستودعات قم بالبحث عنها في مواقعها الخاصة … يعني: مفتاح جوجل من موقع جوجل وهكذا …

الآن بإمكانك تنصيب البرامج التي تستخدمها، مثلاً:

```
apt-get install skype opera google-chrome-stable unrar p7zip bluefish pidgin alacarte network-manager
```

أنتهينا من هذه المجموعة، يمكنك الآن كذلك تنصيب VideoLAN وجميع الـ Codecs التي سوف تحتاجها لتشغيل مختلف المرئيات والصوتيات … أسهل طريقة:

```
apt-get install vlc*
```

**ملاحظة مهمة جداً:**

لا أنصح بأستعمال مستودعات debian-multimedia وتنصيب VideoLAN وذلك لأنه ليس كل المرئيات ستعمل معك، الكثير سيعمل صوت بدون صورة … السبب في ذلك هناك خلل في مكتبات FFMPEG التي تقدمها هذه المستودعات … ولهذا عليك بأن تقوم بإلغاءها كما فعلت أنا في مستودعاتي … الكلام هذا من موقع منتديات Debian نفسها … الدليل [هنا](http://forum.videolan.org/viewtopic.php?f=13&t=70719) …

لديك برنامج آخر تحتاجه؟ كل ما عليك فعله هو تنصيبه :)

للنقاش: [هنا](www.linuxac.org/forum/threads/60740-ما-بعد-تنصيب-Debian-6-Sque)
