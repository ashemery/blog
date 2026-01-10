---
title: "مشكلة عمل كومبايل لبرنامج cryptkeeper"
date: 2010-07-20 21:12:50 -0500
categories: ["GNU/Linux", "Linux Security", "Security", "Software/Tools"]
tags: ["cryptkeeper", "make", "خزنة أعجوبة الشخصية"]
permalink: "/2010/07/20/solving-cryptkeeper-compile-problem/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

كنت أود تنصيب برنامج [cryptkeeper](http://tom.noflag.org.uk/cryptkeeper.html) على توزيعتي الجديدة، ولكن للأسف ظهرت عندي مشاكل كان لابد من حلها لكي أستطيع تركيب البرنامج …

البرنامج ببساطة عبارة عن حاجة مشابهة لما قام به الأخ مؤيد مشكوراً “[خزنة أعجوبة الشخصية](http://www.linuxac.org/forum/showthread.php?41865)” … صدقاً لم اعرف بذلك البرنامج سوى أول أمس ولهذا كنت خلاص مبلوش في حل مشكلة cryptkeeper أصلاً …

المهم توزيعتي هي Fedora 13 – x86_64 … وعند محاولتي عمل كومبايل له ظهرت التالي:

```
/usr/bin/ld: note: 'XFlush' is defined in DSO /usr/lib64/libX11.so.6 so try adding it to the linker command line
/usr/lib64/libX11.so.6: could not read symbols: Invalid operation
collect2: ld returned 1 exit status
make[2]: *** [cryptkeeper] Error 1
make[2]: Leaving directory `/home/username/Desktop/cryptkeeper-0.9.5/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/username/Desktop/cryptkeeper-0.9.5'
make: *** [all] Error 2
```

وكان لابد من إيجاد حل ولهذا بعد المحاولات العديدة قمت بالحل بالطريقة التالية … حرر الملف:

```
vim src/Makefile.in
```

ومن ثم قم بالبحث عن:

```
CXXLINK = $(CXXLD) $(AM_CXXFLAGS) $(CXXFLAGS) $(AM_LDFLAGS) $(LDFLAGS) \
```

وحولها الى:

```
CXXLINK = $(CXXLD) $(AM_CXXFLAGS) $(CXXFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -lX11 -ldl -lXext \
```

ومن ثم احفظ الملف وأعد عملية الكونفيغ:

```
./configure
```

ومن ثم أعمل الكومبايل مرة أخرى:

```
make
```

وبعدها تنصيبه بصلاحيات المستخدم root كالعادة:

```
make install
```

وخلاص … موفقين إن شاء الله …

للنقاش: [هنا](http://www.linuxac.org/forum/showthread.php?41931)
