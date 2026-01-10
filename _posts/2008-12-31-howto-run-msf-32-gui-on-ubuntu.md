---
title: "تشغيل الواجهة الرسومية لـ MSF 3.2 على Ubuntu"
date: 2008-12-31 23:47:01 -0500
categories: ["Linux Security", "PenTest", "Security"]
tags: ["Metasploit", "MSF", "Ubuntu"]
permalink: "/2008/12/31/howto-run-msf-32-gui-on-ubuntu/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

![](/assets/img/posts/2008/msf3-gui-logo.png)

بعد أن قمنا بالموضوع السابق [بتركيب Metasploit 3.2 framework على اوبنتو](/assets/files/2008/howto-install-metasploit-on-ubuntu.bin.bin) …الآن إن كنت ترغب بتشغيل الواجهة الرسومية الخاصة بها عليك تركيب بعض الحزم الإضافية والتي هي libgtk2-ruby و libglade2-ruby … كل ما عليك فعله هو:

```
sudo apt-get install libgtk2-ruby libglade2-ruby
```

بعد ذلك اذهب الى المجلد التي ركبنا فيها MSF والذي هو:

```
cd /usr/local/bin/msf
```

وقم بتشغيل الواجهة كالتالي:

```
sudo ./msfgui
```

ستظهر لك شاشة تشبه هذه:

[![](/assets/img/posts/2008/msf3-gui.png)](/assets/img/posts/2008/msf3-gui.png)

هذه لمن يحب أن يستعمل الواجهة الرسومية GUI الخاص بها …

ودمتم بود …
