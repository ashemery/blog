---
title: Can We Say Farewell to Hiding Malicious EXEs in Stealth ADS
date: 2019-05-24 08:07:17 -0500
categories:
- AntiX
- Forensics
- Malware
- Metasploit
- Windows
tags:
- ads
- anti-forensics
- anti-virus
- av
- meterpreter
- reverse-shell
- stealth
permalink: /2019/05/24/can-we-say-farewell-to-hiding-exes-in-stealth-ads/
reading_time: 4
---
One of my current students asked if using Stealth Alternate Data Streams (ADS), could bypass AVs? Therefore, I wanted to prove that for the student by doing a simple experiment. What was done is the following:

1. Turned off Windows Defender on my Windows System (used for testing)

2. Created a malicious reverse shell (reverse meterpreter) and copied it over to my Windows system. It was named rev.exe.

Contents of the directory I copied the rev.exe to:

![](/assets/img/posts/2019/Tempdir-contents.png)

3. Created a reverse shell listener (multi-handler) on my attacking system (Kali) and was waiting for the victim machine to connect back to it.

4. Used the commands we know to hide the reverse shell named “rev.exe” in LPT1.txt and then checked the contents of the temp directory (location of files)  using FTK Imager

Command was:

```
type rev.exe > \\?\C:\Users\IEUser\Desktop\temp\LPT1.txt:rev.exe
```

Checked the contents of the directory (temp) using FTK Imager, to make sure my stealth ADS was created successfully:

![](/assets/img/posts/2019/FTK-view-Before-Clean.png)

5. Executed the command from the Stealth ADS, to make sure it is working and I did get a reverse shell to the Windows system, so it is armed (rev.exe) and working as seen in the figure below:

[![](/assets/img/posts/2019/RevShell-Run-From-StealthADS.png)](/assets/img/posts/2019/RevShell-Run-From-StealthADS.png)

On the attacking side, we can see our reverse shell is working:

[![](/assets/img/posts/2019/RevShell-Access-From-StealthADS.png)](/assets/img/posts/2019/RevShell-Access-From-StealthADS.png)

6. Then I scanned the temp directory using Windows Defender. Windows Defender was able to detect the file and disarm the malicious reverse shell there. It was completely removed. The ADS part of the file LPT1.txt was removed.

Threat detected:

![](/assets/img/posts/2019/Type-of-threat-detected-FilesScanned.png)

Type of malicious content detected:

![](/assets/img/posts/2019/Type-of-threat-detected-METERPRETER.png)

Location (full PATH):

![](/assets/img/posts/2019/Type-of-threat-detected-with-PATH.png)

7. To prove that it was completely removed, I tried to run the command again, but it failed, since the rev.exe hiding in ADS has been removed. Also, when checking the content of the temp directory, it was not showing my rev.exe shell that I copied there. So, both the malicious file in the directory and in the ADS were removed successfully.

![](/assets/img/posts/2019/FTK-view-After-Clean.png)

Contents of COM1.txt showing the putty.exe within ADS, just to show how it will be seen for example in FTK Imager:

[![](/assets/img/posts/2019/COM1-ADS.png)](/assets/img/posts/2019/COM1-ADS.png)

**Can We Say Farewell to Hiding Malicious EXEs in Stealth ADS?** I think the answer is clear now!

Before I end this, the only thing Windows Defender was unable to detect, was the putty.exe which you see, that was armed with a manually injected payload, as seen below :)

[![](/assets/img/posts/2019/mycode.png)](/assets/img/posts/2019/mycode.png)

See you in the next post!
