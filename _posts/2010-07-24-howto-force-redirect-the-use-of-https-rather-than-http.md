---
title: "Howto force/redirect the use of https rather than http"
date: 2010-07-24 18:44:51 -0500
categories: ["Apache/Tomcat", "Linux Security", "Linux Services", "Security", "Web Security"]
tags: ["HTTP", "HTTPS", "RewriteCond", "RewriteEngine", "RewriteRule"]
permalink: "/2010/07/24/howto-force-redirect-the-use-of-https-rather-than-http/"
reading_time: 1
---

السلام عليكم ورحمة الله وبركاته

إذا كان لديك موقع تريد فرض إستعمال HTTPS على المتصفحون بدل من إستعمال HTTP فكل ما عليك فعله هو:

```
Redirect permanent / https://www.arabnix.com/
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
```

هذا الكود ضعه في الإعدادات الخاصة بالموقع arabnix.com حيث سيقوم بتحويل كل من يتصفح الموقع arabnix.com من تصفحه بشكل عادي HTTP الى تصفح مشفر بإستعمال HTTPS …

بالتوفيق لكم …
