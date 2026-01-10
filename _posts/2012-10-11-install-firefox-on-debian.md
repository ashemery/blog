---
title: "Install Firefox on Debian"
date: 2012-10-11 23:00:02 -0500
categories: ["GNU/Linux", "Software/Tools"]
tags: ["Debian", "Firefox", "iceweasel", "install", "Web Browser"]
permalink: "/2012/10/11/install-firefox-on-debian/"
reading_time: 2
---

![](/assets/img/posts/2012/firefox_.jpg)

بعد المشاكل التي حصلت لدي كان يجب ان اعيد العمل مرة أخرى ولهذا سأقوم بتدوين الأمور لعل أحتاجها في المستقبل … أول حاجة قمت بها هو تحميل وتركيب المتصفح فايرفوكس … كل ما عليك فعله هو تحميل المتصفح من [هنا](http://www.mozilla.com) …  بعد ذلك لك حرية الإختيار بين تخزينه في المجلد /opt/ او المجلد /usr/share/ عني أستعمل الأخير … قم بفك الضغط عن الملف ونقله الى هناك … إذا كان الجهاز يستعمله أكثر من شخص فيفضل أن تعطيه الصلاحيات التالية:

```
chown -R root:users /usr/share/firefox
```

وإذا لم يكن فلو تركته كما هو لا يوجد مشكلة … بالحالة أعلاه كل من هو عضو في مجموعة users له صلاحيات لإستعمال المتصفح … بعد لنقم بعمل symbolic link لتشغيل المتصفح:

```
ln -s /usr/share/firefox/firefox /usr/bin/firefox
```

الآن لنعمل أيقونة لسطح المكتب:

```
touch /usr/share/applications/firefox.desktop
```

بعد ذلك قم بتحرير الملف بالمحرر الذي يعجبك:

```
vim /usr/share/applications/firefox.desktop
```

وضع المحتوى الذي بالأسفل أو ما يناسبك:

```
[Desktop Entry]
Encoding=UTF-8
Name=Mozilla Firefox
Comment=Browse the World Wide Web
Type=Application
Terminal=false
Exec=/usr/bin/firefox %U
Icon=/usr/share/firefox/icons/mozicon128.png
StartupNotify=true
Categories=Network;WebBrowser;
```

أحفظ الملف وقم بالخروج … والآن لنقم بحذف iceweasel من النظام:

```
apt-get remove iceweasel
```

وهكذا أنتهينا من تنصيب المتصفح Firefox وكذلك حذف المتصفح القديم iceweasel من النظام … لا تقلق لموضوع التحديثات وذلك لأن المتصفح الحديث للمتصفح يقوم بتحديث المتصفح لوحده … لمزيد من المعلومات من [هنا](http://forums.debian.net/viewtopic.php?f=16&t=62113) …
