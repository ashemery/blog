---
title: Web Application Finger Printer – WAFP
date: 2010-01-22 17:47:47 -0500
categories:
- Footprinting
- Web Security
tags:
- nmap
- p0f
- wafp
- web-application
permalink: /2010/01/22/web-application-finger-printer-wafp/
reading_time: 2
---
السلام عليكم ورحمة الله وبركاته

أداة أخرى مفيدة ربما بعض الشيء ظهرت في أواخر عام 2009 … هذه الأداة تعمل على إكتشاف نسخة الـ Web Application المستعمل … يعني هي مشابهة لعمل nmap و p0f في إكتشاف النظام والخدمات التي تعمل على الهدف … لكن هذه تكتشف البرمجيات العنكبوتية التي تعمل على الهدف …

مثال من موقع الأداة:

```
wafp.rb --verbose -p phpmyadmin https://phpmyadmin.example.de 
VERBOSE: loading the fingerprint database to the ram... 
Collecting the files we need to fetch ... 
Fetching needed files (#432), calculating checksums and storing the results to the database: 
............................................................................................ 
VERBOSE: request for "/themes/darkblue_orange/img/b_info.png" produced "Connection refused - connect(2)" for 1 times - retrying... 
............................................................................................ 
Checking gathered/stored checksums (#432) against the selected product (phpmyadmin) versions (#87) checksums: 
....................................................................................... 
found the following matches (limited to 10): 
+-------------------------------------------------------------+ 
phpmyadmin-2.11.9.1 296 / 299 (98.99%) 
phpmyadmin-2.11.9.2 295 / 299 (98.66%) 
phpmyadmin-2.11.9.4 295 / 299 (98.66%) 
phpmyadmin-2.11.8.1 295 / 299 (98.66%) 
phpmyadmin-2.11.9.5 295 / 299 (98.66%) 
phpmyadmin-2.11.8 295 / 299 (98.66%) 
phpmyadmin-2.11.9.3 295 / 299 (98.66%) 
phpmyadmin-2.11.9 295 / 299 (98.66%) 
phpmyadmin-2.11.4 294 / 299 (98.33%) 
phpmyadmin-2.11.5.2 294 / 299 (98.33%) 
+-------------------------------------------------------------+ 
WAFP 0.01-26c3 - - - - - - - - - http://mytty.org/wafp/ 
VERBOSE: Returncode stats: 
VERBOSE: Ret-Code 200 #302 
VERBOSE: Ret-Code 404 #130 
VERBOSE: deleting the temporary database entries for scan "472312620367191262036719_httpsphpmyadmin.example.de" ...
```

لتحميل الأداة: [أضغط هنا](http://mytty.org/wafp/#download)

لمعرفة المزيد: [أضغط هنا](http://mytty.org/wafp/)

للنقاش: [أضغط هنا](https://www.linuxac.org/forum/showthread.php?35399)

بالتوفيق للجميع …
