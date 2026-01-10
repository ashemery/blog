---
title: "شغل جميع صوتياتك وفيديوهاتك على Fedora 8"
date: 2007-11-23 05:42:57 -0500
categories: ["Development", "Software/Tools"]
permalink: "/2007/11/23/run-all-sounds-and-videos-under-fedora-8/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته …

الموضوع هذا لكي يساعدك في تشغيل كل الملفات الصوتية والفيديوهات حقك على [Fedora 8 Werewolf](http://fedoraproject.org/) الرائعة … أول شي تأكد من إضافتك مخازن الـ Livna من خلال إستعمال السكربت الموجود في هذا الموضوع: [العودة لـ Fedora بعد غياب أكثر من سنة ونصف](/assets/files/2007/asset)

بعد ذلك قم بتنصيب برنامج mplayer من خلال:

```
yum -y install mplayer-gui
```

برنامج مفيد آخر هو الـ xine نصبه هكذا:

```
yum -y install xine
```

برنامج رائع آخر هو الـ VLC نصبه هكذا:

```
yum -y install vlc
```

برنامج آخر رائع جداً جداً وﻻ غنا عنه في مجال الصوتيات الـ Banshe نصبه هكذا:

```
yum -y install banshee
```

بعد ذلك نفعل بعض الكودات التي تأتي من ضمن مخازن livna كالتالي:

```
yum -y install xine-lib-extras-nonfree
```

أيضاً:

```
yum -y install gstreamer gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly
```

الآن ستقول لي ماذا عن برنامج الـ Realplayer وملفات الـ rm والـ ram ؟ أقول لك صراحة مدري ليش موقعهم فيه خلل عندما تطلب تحميل البرنامج منهم … على كل حال لدي نسخة من البرنامج سأبحث عنها وأعطيها لكم لو وجدتها … لكن أكمل الحلول وصدقني لن تحتاج له حتى … الآن لتفعيل الكودات الأخرى وتشغيل ملفات مثل wmv و ram و rm بشكل صحيح ودون مشاكل حمل السكربت [بالضغط هنا](/assets/files/2007/win32codecs.sh) ونفذ التالي:

```
chmod +x win32codecs.txt
```

بعد ذلك قم بتشغيلها كما يلي:

```
./win32codecs.sh
```

سيقوم بتحميل الكودات كلها من النت وتخزينها في الأماكن الصحيحة الخاصة بنظامك … بعد ذلك شغل وأستمتع بصوتياتك وفيديوهاتك دون مشاكل في الصوت وﻻ في جودة الصورة … أي سؤال أو مساعدة تفضل أطرحه إن شاء الله بساعدكم …

دمتم بود …

**B!n@ry S3Z—> Fedora 8 Werewolf r0x**
