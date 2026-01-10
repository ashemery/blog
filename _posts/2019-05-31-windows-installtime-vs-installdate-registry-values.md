---
title: "Windows InstallTime vs InstallDate Registry Values"
date: 2019-05-31 21:51:36 -0500
categories: ["Forensics", "Windows"]
tags: ["DCode", "InstallDate", "InstallTime", "registry", "Registry Explorer", "timestamps", "Windows"]
permalink: "/2019/05/31/windows-installtime-vs-installdate-registry-values/"
reading_time: 2
---

This is just a quick post about two Registry Values InstallTime and InstallDate which are found under the following key:

**SOFTWARE\Microsoft\Windows NT\CurrentVersion**

![](/assets/img/posts/2019/installationDateTime.png)

The confusion happens when my students ask which one is correct?  The answer is aquatically both! Yes, both are correct. The only difference is InstallDate is a **Unix 32-bit Timestamp**, while InstallTime is a **Windows 64-bit Timestamp**.

As you can see in the screenshots below (SOFTWARE hive loaded using [Registry Explorer](https://ericzimmerman.github.io/#!index.md)), the proof that they are both the same. I’ve used [DCode](https://www.digital-detective.net/dcode/) for this task, even though you could just rely on Registry Explorer from Eric Zimmerman by right clicking on the value and choosing “Data interpreter”.

InstallDate:

[![](/assets/img/posts/2019/InstallDate.png)](/assets/img/posts/2019/InstallDate.png)

InstallTime:

[![](/assets/img/posts/2019/InstallTime.png)](/assets/img/posts/2019/InstallTime.png)

Don’t forget to adjust your timezones.

That’s all for now!
