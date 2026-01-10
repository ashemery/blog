---
title: "Fast-Track 4 now rocking"
date: 2009-02-19 18:26:41 -0500
categories: ["News", "PenTest", "Security"]
tags: ["Fast-Track", "Metasploit", "Penetration Testing", "ShmooCon", "svn"]
permalink: "/2009/02/19/fast-track-4-now-rocking/"
reading_time: 3
---

السلام عليكم ورحمة الله وبركاته

![](/assets/img/posts/2009/FastTrackWebIconSm.gif)

تم صدور النسخة الجديدة 4 من بيئة Fast-Track التي تستعمل في مجال الـ Penetration Testing مع Metasploit او بدون … النسخة أعلنوا عنها في اجتماع [ShmooCon](http://www.shmoocon.org/) الأخير ولكنني لم أنتبه لها إلا اليوم صراحة … أيضاً من قام بقراءة موضوعي السابق “[حل مشكلة db_sqlite3 عند تشغيل Fast-Track على Ubuntu](/assets/files/2009/solution-for-launching-db_sqlite3-when-running-fast-track-on-ubuntu)” سيعرف كيف يقوم بعملية ترقية للـ Fast-Track … لمن لم يقرأه أنصحه بقراءته …

التغييرات الجديدة التي حصلت من 3 الى 4 حسب الـ Change Log هي:

– Completely redesigned web interface. Web interface design by RBG.

– Code cleanup, a lot of things are dynamically generated now and code reuse is becoming more and more common.

– Better functionality of the web interface and allowing easier understanding.

– Massive documentation campaign is underway to document all aspects of Fast-Track, customizations, and various other avenues.

– Improved Metasploit Autopwn Automated, sleeps 15 seconds after exploiting the system(s) and then does a sessions -l to list all sessions active, and gives you friendly reminders.

– Rewrote Metasploit Mass Client Attack to dynamically import all of the exploits now, much easier to update and includes every single browser exploit for Metasploit.

– Bug fixes in SQL Injector Binary Payload GET and POST

– Color changes on xterm launches for WebGUI

– Additional login_bypasses for SQLPwnage

– Added multiple exploits to the exploit menu

– Added about, credits, and changelog to command-line mode.

– Added XML Parsing Exploit to Fast-Track Client Side, rewrote large portion of the exploit for heap spray +bind shell.

– Added XML Parsing Exploit to Fast-Track Exploits section.

– Code optimization in SQL Bruter

– Fast-Track update now utilizes SVN, not a custom update script that was used in the past. Much more efficent and reliable.

– Added a new tool called PayloadGenerator, just a simple tie in to the Metasploit Framework to simplify some Metasploit payload creation.

أيضاً لتحميل البرنامج بشكل منفرد نفذ الأمر التالي (أفضل من تحميل حزمة البرنامج وذلك بسبب تسهيل الترقية بالمستقبل):

svn co http://svn.thepentest.com/fasttrack

أو لمن قام بمتابعة موضوعي السابق كل ما عليك فعله هو:

python fast-track.py -i

ومن ثم قم بإختيار الخيار (1) Fast-Track Updates وبعد ذلك قم بإختيار الخيار (1) ايضاً والذي هو Update Fast-Track وخلاص سيقوم هو بتحديث النسخة التي لديك الى النسخة الرابعة …

إن شاء الله تكون محل فائدة لكم …

دمتم بود …
