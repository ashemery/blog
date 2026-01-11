---
title: Windows Sandbox Scripts
date: 2024-04-05 05:07:45 -0500
categories:
- DFIR
- Investigations
- Malware
- Research
- Security
- Software/Tools
- ThreatHunting
- Virtualization
- Windows
tags:
- malware-analysis
- reverse-engineering
- windows-sandbox
permalink: /2024/04/05/windows-sandbox-scripts/
reading_time: 2
---
Windows Sandbox is an amazing Windows feature that could be used for Malware Analysis. In order to install it you’ll need to follow this blog post [here](https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-overview) by Microsoft.

![](/assets/img/posts/2024/run-in-sandbox.png)

One thing about this Sandbox, is everything is ephermal, which means once you close the sandbox or power off the Sandbox, all the files, changes, applications, etc will be gone. So, in order to setup your Malware Analysis lab every single time, you’ll have to do one of two things: (1) Go through the whole setup of your applications and configurations every single time, which is so bad and time consuming (+wasting), or you (2) use .wsb scripts to automate everything!

Some of the best scripts that I use, can be found below:

[Run-in-Sandbox](https://github.com/damienvanrobaeys/Run-in-Sandbox)

[Windows_Sandbox_Editor](https://github.com/damienvanrobaeys/Windows_Sandbox_Editor)

[Sandbox](https://github.com/FireFart/sandbox)

[REEWSB](https://github.com/d00m3dd00d/REEWSB)

A nice reference with info about pre-installing your applications can be found in the post titled “[Start Windows Sandbox with Preinstalled Apps](https://weltweitimruhestand.de/start-windows-sandbox-with-preinstalled-apps)“.

You can also follow this thread found [here](https://twitter.com/binaryz0ne/status/1776078031972368837) for other discussions and topics related to Windows Sandbox.
