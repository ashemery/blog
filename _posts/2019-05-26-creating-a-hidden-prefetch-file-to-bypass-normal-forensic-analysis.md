---
title: "Creating a Hidden Prefetch File to Bypass Normal Forensic Analysis"
date: 2019-05-26 10:11:15 -0500
categories: ["AntiX", "Forensics", "ThreatHunting", "Windows"]
tags: ["ads", "alternate data streams", "anti-forensics", "EXE", "malicious", "Prefetch", "stealth", "threathunting", "Windows"]
permalink: "/2019/05/26/creating-a-hidden-prefetch-file-to-bypass-normal-forensic-analysis/"
reading_time: 8
---

While doing more experiments of running EXEs and Malicious EXEs from ADS and Stealthy ADS to continue my previous work “[Can We Say Farewell to Hiding Malicious EXEs in Stealth ADS](/assets/files/2019/can-we-say-farewell-to-hiding-exes-in-stealth-ads.bin.bin)“, and in order to create a forensic image and share it with the community as I mentioned [here](https://twitter.com/binaryz0ne/status/1131951279540977664), I found some unusual findings!

When creating a forensic image, I also create a list of files and directories within that image, as seen in Figure 1, just for further checking and verification purposes. So, as usual, was doing the image to share and I noticed the following:

[![](/assets/img/posts/2019/Hidden-PrefetchFiles-CSV.png)](/assets/img/posts/2019/Hidden-PrefetchFiles-CSV.png)

Figure 1: List of files found in a Forensic Image

I’ve highlighted the four entries which are totally weird. What does this mean? That is what we are going to find out in this post and prove too. Now from the screenshot above, it seems that there are two text files created WELCOME.TXT and WELCOME2.TXT. These are the files I created on the desktop inside a directory named “creepy” and used to hide putty (PUTTY.EXE) in the first and a reverse shell (REVSHELL.EXE) in the second. Therefore, I decided to run some Prefetch analysis against these two files and see what’s going on.

The first quick tool I used was [WinPrefetchView](https://www.nirsoft.net/utils/win_prefetch_view.html), just to have a visual idea of the entries. I was surprised that there is nothing about the two files we saw in the previous screenshot as you can see in Figure 2 below:

[![](/assets/img/posts/2019/WinPrefetchView-Results.png)](/assets/img/posts/2019/WinPrefetchView-Results.png)

Figure 2: WinPrefetch Results

But that’s not enough, I went to use Eric Zimmerman’s tool Prefetch Parser ([PECmd](https://ericzimmerman.github.io/#!index.md)) and run the test again. So ran the tool against the whole directory and generated a CSV file:

```
PECmd.exe -d W:\Windows\Prefetch --csv C:\Users\IEUser\Desktop\sleuthADS\
```

Then I loaded the CSV file generated into Eric’s Time Line Explorer, as you can see in Figure 3:

[![](/assets/img/posts/2019/PECmd-Timeline-Results-1.png)](/assets/img/posts/2019/PECmd-Timeline-Results-1.png)

Figure 3: PECmd Results in Timeline Explorer

I was shocked that now I have two tools that are unable to see the two WELCOME.TXT and WELCOME2.TXT prefetch files or whatever these files are!!!.

Therefore, time to do some manual sifting through the image and see what is going on. When browsing the Prefetch directory, I noticed the following in Figure 4:

[![](/assets/img/posts/2019/WelcomeFiles-PrefetchEntry-1.png)](/assets/img/posts/2019/WelcomeFiles-PrefetchEntry-1.png)

Figure 4: Welcome Files in Prefetch Directory

Yes, we can see that they are listed exactly as normal files but with an ADS, as we saw in my previous post.

Let’s check each one of them. So, when accessing the first WELCOME.TXT file, we can see the details in Figure 5:

[![](/assets/img/posts/2019/Hidden-PrefetchFiles-FTK-PUTTY.png)](/assets/img/posts/2019/Hidden-PrefetchFiles-FTK-PUTTY.png)

Figure 5: Hidden Prefetch File for Putty using FTK

And the second file, WELCOME2.TXT resulted as seen in Figure 6:

[![](/assets/img/posts/2019/Hidden-PrefetchFiles-FTK-REVSHELL.png)](/assets/img/posts/2019/Hidden-PrefetchFiles-FTK-REVSHELL.png)

Figure 6: Hidden Prefetch File for Reverse Shell using FTK

They both have an alternate data stream (ADS), exactly how I created them, and the result of running these commands from within the ADS, resulted in creating a Prefetch file within an ADS too! We can prove that these are prefetch files, first by looking at the header (first 3 bytes), which shows the value is MAM. Based on the Prefetch File Format found [here](https://github.com/libyal/libscca/blob/master/documentation/Windows%20Prefetch%20File%20(PF)%20format.asciidoc), we know that this is for a Windows 10 prefetch file:

> As of Windows 10 the PF is stored in compressed form in a MAM file similar to SuperFetch

Again, what happened is, when I ran the EXEs from the ADS of each text file, the system did not generate a normal Prefetch file, but created a file with the same name of the original, and the true prefetch file was inside the ADS of that file. That is the reason why the tools WinPrefetchView and PECmd, were unable to analyze those files, since they are not prefetch files and both of these tools were designed for analyzing prefetch files.

Let’s try PECmd again, but by pointing to the file directly “WELCOME.TXT:PUTTY.EXE-A6BB0639.pf” and “WELCOME2.TXT:REVSHELL.EXE-41B5A636.pf”. Unfortunately, while trying different ways to run PECmd directly as you can see in the Figure 7 below, I was unable to achieve my goal.

[![](/assets/img/posts/2019/Failed-Prefetch-Analysis-Test1.png)](/assets/img/posts/2019/Failed-Prefetch-Analysis-Test1.png)

Figure 7: Failed Prefetch Analysis using PECmd “Test1”

And the second file as seen in Figure 8:

[![](/assets/img/posts/2019/Failed-Prefetch-Analysis2.png)](/assets/img/posts/2019/Failed-Prefetch-Analysis2.png)

Figure 8: Failed Prefetch Analysis using PECmd “Test2”

Not even approaching it as in Figure 9:

[![](/assets/img/posts/2019/Failed-Prefetch-Analysis-Test3.png)](/assets/img/posts/2019/Failed-Prefetch-Analysis-Test3.png)

Figure 9: Failed Prefetch Analysis using PECmd “Test3”

The solution was to extract the alternate data stream from each welcome file and run the tool again. This time, we managed to get the results we expected, as you can see in Figure 10 below:

[![](/assets/img/posts/2019/Hidden-Prefetch-PECmd-Results-PUTTY-1.png)](/assets/img/posts/2019/Hidden-Prefetch-PECmd-Results-PUTTY-1.png)

Figure 10: PECmd Results for Hidden Putty Prefetch File (Putty)

And the second hidden prefetch file as seen in Figure 11:

[![](/assets/img/posts/2019/Hidden-Prefetch-PECmd-Results-REVSHELL-1.png)](/assets/img/posts/2019/Hidden-Prefetch-PECmd-Results-REVSHELL-1.png)

Figure 11: PECmd Results for Hidden Putty Prefetch File (RevShell)

As you can see, if you just depend on running your tools, then you might miss something, it is always good to sift through the data you have, check stuff manually. I know this takes time, but it will help you make sure you did not miss something. Oh, and before I forget, I’m going to write another post showing how we can detect executables that were launched from alternate data streams could be detected, even if you did not have any event logs configured! More on that later…

So there you go, the post covered how to go under the radar and also how to find this sort of unusual activity.

See you in the next post…

Note(s):

1. Both Putty.exe and RevShell.exe were hidden in a normal ADS and stealth ADS (more on the later in the next post).

2. Both were executed from normal and stealth ADS

3. Putty has a manually injected payload, while RevShell.exe is a normal reverse shell meterpreter.

Good readings:

1. [Forensic Riddle #3 – Answer](https://www.hexacorn.com/blog/2011/12/05/forensic-riddle-3-answer/)

2. [“Hidden” Prefetch File Analysis and Alternate Data Sources](http://windowsir.blogspot.com/2020/01/hidden-prefetch-file-analysis-and.html)

3. [Prefetch folder is empty](https://forensicfocus.com/Forums/viewtopic/p=6601652/#6601652)
