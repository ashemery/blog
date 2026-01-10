---
title: "Windows Kernel Debugging Using Two VMs on Linux"
date: 2021-07-19 06:46:07 -0500
categories: ["Exploitation", "Kernel", "Virtualization", "Windows"]
tags: ["bcdedit", "debug", "kdnet", "serial", "WinDbg"]
permalink: "/2021/07/19/windows-kernel-debugging-using-two-vms-on-linux/"
reading_time: 4
---

Just thought of writing this here, because I keep forgetting how to do this stuff! Also, since [OST2](https://opensecuritytraining.info/) has lots of new courses related to Windbg, I thought this would be helpful for folks who use a Linux Workstation and would like to do Windows Kernel Debugging and follow [Xeno](https://twitter.com/XenoKovah)‘s new courses (highly recommend you check them out). This post does not explain how to install the [Windows 10 SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk/) on any of the systems, but again check out Xeno’s courses, you will find all of that there.

**Basic Info:**

VM with WinDbg = Debugger

– Host-Only IP Address = 192.168.16.16

VM to Debug = Debuggee

– Host-Only IP Address = DHCP

**Note(s):**

1. It does not hurt to test that they can both ping each other (firewall settings for ICMP is required here).

2. Some of the commands below could be used with /dbgsettings directly, but I decided to do it this way to be easier to understand and to have a menu option in some

Let’s get starting! Use whichever method you want, they should all work for you if you follow the settings correctly. First, start **cmd.exe** with elevated privileges and then pick the method of your desire.

**Method #1: Using Serial Ports**

Power off both VMs and add a serial port. Both will be socket ports and will be located at some location of your desire (e.g. /tmp/com1). Make sure the Debugger has “From: Client” -> “To: Virtual Machine” and the Debuggee has “From: Server” -> “To: Virtual Machine”.

Now, let’s first create a debugging option to choose from when rebooting/powering on the system.

bcdedit /copy {current} /d "Windows 10 Debugging"

Then use the 32 char identifier in the rest of the commands below (assuming 32-CHAR-Identifier = {AABBCCDD-1A1A-A1A1-BB11-ABCDEF123456}:

bcdedit /debug {AABBCCDD-1A1A-A1A1-BB11-ABCDEF123456} ON

bcdedit /set {AABBCCDD-1A1A-A1A1-BB11-ABCDEF123456} debugtype serial

bcdedit /set {AABBCCDD-1A1A-A1A1-BB11-ABCDEF123456} debugport 1

bcdedit /set {AABBCCDD-1A1A-A1A1-BB11-ABCDEF123456} baudrate 115200

Go to your Debugger VM and start Windbg, then go to File -> Kernel Debug -> COM. Make sure the settings here match those you used above in the bcdedit commands and then click OK to start. After that reboot your Debuggee VM, which can be done like this:

shutdown -r -t 0

If everything went fine, you should see your Debugger now connected to your Debuggee VM…

**Method #2: Using Network**

Again, we will first create a debugging option to choose when rebooting/powering on the system.

bcdedit /copy {current} /d "Windows 10 Network Debugging"

Then use the 32 char identifier in the rest of the commands below (assuming 32-CHAR-Identifier = {AABBCCDD-1A1A-A1A1-BB11-ABCDEF123456}:

bcdedit /debug {AABBCCEE-1A1A-A1A1-BB11-ABCDEF123456} ON

bcdedit /set {AABBCCEE-1A1A-A1A1-BB11-ABCDEF123456} debug on

bcdedit /set {AABBCCEE-1A1A-A1A1-BB11-ABCDEF123456} debugtype net

bcdedit /set {AABBCCEE-1A1A-A1A1-BB11-ABCDEF123456} port 50000

bcdedit /set {AABBCCEE-1A1A-A1A1-BB11-ABCDEF123456} hostip 192.168.16.16 nodhcp

bcdedit /set {AABBCCEE-1A1A-A1A1-BB11-ABCDEF123456} key a.b.c.d

Go to your Debugger VM and start Windbg, then go to File -> Kernel Debug -> NET. Make sure the settings here match those you used above in the bcdedit commands and then click OK to start. After that reboot your Debuggee VM, which can be done like this:

shutdown -r -t 0

If everything went fine, you should see your Debugger now connected to your Debuggee VM...

**Method #3: Using KDNet Directly**

Go to the location below where kdnet is located:

cd "C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\"

Then start the kdnet.exe on the Debugee system with IP of Debugger and Port as following:

kdnet.exe 192.168.16.16 50000

Now make sure you copy the key to the Debugger VM and use it to either start WinDbg using kdnet directly or using Windbg with the port and key given. Let's use the CLI method here, so we will first navigate to where kdnet is located:

cd "C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\"

Then use the command we got from the Debuggee VM found below on your Debugger VM:

windbg -k net:port=50000,key=thereis.somevery.longweird.keyusedhere

After that reboot your Debuggee VM, which can be done like this:

shutdown -r -t 0

And that's it, you can now debug your Windows 10 Kernel VM from another VM on Linux. Again, I highly recommend you check out the new [Open Security Training (OST2)](https://opensecuritytraining.info/) courses to continue your playing!
