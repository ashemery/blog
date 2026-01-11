---
title: 'Update: Hidden Prefetch Files Detection using New PECmd'
date: 2019-05-26 18:33:21 -0500
categories:
- AntiX
- ThreatHunting
- Windows
tags:
- ads
- alternate-data-streams
- anti-forensics
- exe
- malicious
- prefetch
- stealth
- threathunting
- windows
permalink: /2019/05/26/update-hidden-prefetch-files-detection-using-new-pecmd/
reading_time: 3
---
Before diving into this post, I wanted to say, that I have been teaching digital forensics for a long time by now, and in my Operating System Forensics class, I use [Eric Zimmerman](https://ericzimmerman.github.io/#!index.md)‘s tools a lot, and when I say “a lot”, I truly mean it! The course is not about tools, but when it comes to using a tool to form an understanding of what that session was about, then you’ll always find a tool from Eric there (plus others for sure)! This is one thing about how great Eric’s tools are, but for me, there is more than that! Me and my students from time to time find new things, new bugs, etc. I sometimes send Eric a message from inside class and share a sample with him. We most of the times, get the solution fixed while we’re still in class! That is one of the best things about this guy, how much he cares about his tools, and how much support he provides the community! That is why, I doubt you’ll get such support even from a commercial vendor. They will never be able to get back to you this quick.

What does all that mean here? Well, continuing the previous work “[Creating a Hidden Prefetch File to Bypass Normal Forensic Analysis](/assets/files/2019/creating-a-hidden-prefetch-file-to-bypass-normal-forensic-analysis.bin.bin)” it means we just got a fix or a new feature added to PECmd :)

Let’s check it out. After running the command again using the updated version:

```
PECmd.exe -d W:\Windows\Prefetch –csv C:\Users\IEUser\Desktop\sleuthADS\UpdatedResults
```

We can see now that, PECmd is able to detect executable files that run out of hidden Prefetch files.

[![](/assets/img/posts/2019/updatedPECmd-Results.png)](/assets/img/posts/2019/updatedPECmd-Results.png)

So, there you go. The solution was done even faster than me writing this post, except that I had to go take a break, before getting back to this :)

Eric is probably going to release this very soon. Thank you so much my friend for your continous and precious work, I’ve said it before and will again “**The DFIR Community will always be in debt for you**”

And before I forget, there is still more to the Stealthy ADS coming!
