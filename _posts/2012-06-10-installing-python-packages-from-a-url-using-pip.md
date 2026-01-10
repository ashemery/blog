---
title: "Installing Python Packages from a URL using PIP"
date: 2012-06-10 16:20:12 -0500
categories: ["Development"]
tags: ["Bazaar", "GIT", "Installing", "mercurial", "Packages", "pip", "Python", "Scapy", "subversion", "svn"]
permalink: "/2012/06/10/installing-python-packages-from-a-url-using-pip/"
reading_time: 1
---

بعض الأحيان لربما تحتاج الى تنصيب مكتبة من مكتبات Python ولكن ليست موجودة في [PyPI](http://pypi.python.org/pypi) أو إن الموجود هناك في المكتبة لا يعمل أو قديم لم يتم تحديثه الى آخره من الأسباب … كل ما عليك فعله هو أن تحدد نوع الـ version control system الذي تستعمله تلك المكتبة … مثلاً مكتبة Scapy تستعمل Mercurial  ولهذا لتنصيب مكتبة [Scapy](http://hg.secdev.org/scapy) بواسطة pip يمكنك عمل التالي:

```
pip install hg+http://hg.secdev.org/scapy
```

ملاحظة: إذا ظهر لك خطأ بإنه لا يستطيع التعرف على الخيار hg؟ فكل ما عليك فعله هو تنصيب [Mercurial](http://mercurial.selenic.com/)

في حالة كنت تقوم بالتنصيب من Version Control مثل [GIT](http://git-scm.com/) أو [SVN](http://subversion.tigris.org/) أو [Bazaar](http://bazaar.canonical.com/en/) فكل ما عليك فعله هو إستعمال المتغييرات المناسبة وهي كالتالي:

```
svn+URL, git+URL, hg+URL or bzr+URL
```

وأظن واضحة كل واحدة تعني ماذا … وقبل أن أنسى: عليكم بالـ [virtualenv](http://www.virtualenv.org/en/latest/index.html) :)

[للنقاش](http://www.linuxac.org/forum/showthread.php/58906) …
