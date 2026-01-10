---
title: "Prevent Windows Reboots on Expired VMs"
date: 2021-08-15 06:46:37 -0500
categories: ["Security", "Virtualization", "Windows"]
tags: ["AdvancedRun", "PsExe", "regedit", "sc", "service", "SysInternals", "whoami", "WLMS"]
permalink: "/2021/08/15/prevent-windows-reboots-on-expired-vms/"
reading_time: 1
---

Sometimes you have one of those VMs that you downloaded from Microsoft and then you used it for some testing. Now, after a certain amount of time, the free license given will expire and what will happen, is the VM will start to automatically shutdown I think after an hour. So how do we prevent this from happening?

The solution is easy:

1. Download [SysInternals](https://docs.microsoft.com/en-us/sysinternals/)

2. Start a privileged cmd.exe

3. Navigate to SysInternals directory and run PsExec as following:

psexec64.exe -i -d -s cmd.exe

Or using NirSoft’s AdvancedRun:

AdvancedRun.exe /EXEFilename cmd.exe /RunAs 4 /Run

4. This will start a new cmd.exe with “nt authority\system”. Use “whoami” to check that

5. Let’s first delete the service:

sc delete WLMS

6. Now open regedit.exe

7. Go to: **Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WLMS** and delete the whole key

8. Reboot your system

There you go! The system will no longer bother you with sudden shutdowns!
