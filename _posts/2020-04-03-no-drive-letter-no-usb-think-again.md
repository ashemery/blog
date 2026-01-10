---
title: "No Drive Letter, No USB Evidence? Think Again!"
date: 2020-04-03 06:22:35 -0500
categories: ["DFIR", "Forensics", "Investigations", "Windows"]
tags: ["Computer Forensics", "DFIR", "registry", "Registry Explorer", "RegRipper", "USB", "Windows"]
permalink: "/2020/04/03/no-drive-letter-no-usb-think-again/"
reading_time: 6
---

This post is about a question asked:

**If the user removes the drive letter to hide the presence of a mounted USB drive, could we still locate that drive in the Windows Registry?**

Short answer is, YES it will still be seen in Disk Management. But let’s assume you do not have access to the computer anymore, but you do have the registry files. In other words, you imaged the drive but missed imaging the USB for some reason.

**Note(s) before you continue reading:**

1. This post does not cover all USB artifacts (registry keys, registry values, events, etc), only the ones needed to answer the question above

2. The experiment in this post was repeated three times and they all led to the same results you will find below

I will be listing all the registry locations that we can still check and find entries that the USB was plugged into the system, but it’s not seen currently. Also, I won’t go over all the USB artifacts, there are so many posts out there and good [books](http://windowsir.blogspot.com/p/books.html) too (WR 2ED, WFA 4ED, etc). In this post, I will just focus on some might have not been used before and then just need to correlate them together. So, let’s say you start by loading your registry files into [Registry Explorer](https://ericzimmerman.github.io/) or [RegRipper](https://github.com/keydet89/RegRipper2.8) (System, Software, and NTUSER), will use both here.

**PART#1 – SYSTEM HIVE**

First location will check is the MountedDevices found under the location: SYSTEM\MountedDevices

We know that there should be two entries for each volume, one that starts with \DosDevice\?: and has the drive letter and the other, which has the volume GUID. But unfortunately, as we can see in figure 1.1, the Volume GUID is there, but the drive letter is missing (last entry in figure)!

![](/assets/img/posts/2020/MountedDevices-1024x217.png)

Figure 1.1 – MountedDevices Key

Checking any of those two last entries, we can see that both have the same content ([Eric Zimmerman](https://binaryforay.blogspot.com/)‘s MountedDevices plugin already shows same info in Device Data), which is what’s we see inside the \DosDevice\ entry and the \??\Volume{GUID} entry:

_??_USBSTOR#Disk&Ven_Kingston&Prod_DataTraveler_3.0&Rev_PMAP#5404A6F4E0A1E2719902006D&0#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}

Breaking it down:

1. Type: **Disk**, Vendor: **Kingston**, Product: **DataTraveler_3.0**, and finally Revision: **PMAP**

2. USB Serial Number: **5404A6F4E0A1E2719902006D&0#**

3. Disk GUID: **53f56307-b6bf-11d0-94f2-00a0c91efb8b**

Like I said, I won’t go over all entries, but I need these to match them with those in the USBSTOR. Still in the SYSTEM hive, we can see in figure 1.2 the USBSTOR, all the information in our breakdown above, and two other interesting things; a ContainerID (might need it) and the FriendlyName.

![](/assets/img/posts/2020/ContainerID.png)

Figure 1.2 – Keys & Values Found in USBSTOR

Now, if we check the keys under the Portable Device Enumerator Service (WPDBusEnum), we can see the **ConatinerID**, **DeviceDesc**, and the **FriendlyName** which is **FOR340USB** as seen in figure 1.3. Please remember the name, we will need it shortly.

![](/assets/img/posts/2020/WPDBUSENUM.png)

Figure 1.3 – Keys & Values Found in WPDBUSENUM

**PART#2 – SOFTWARE HIVE**

Under this hive, I’ve only found two very interesting artifacts. One is what I want to call it the “User’s friendly name” and the other the drive letter, YES the drive letter! Now by checking the Windows Portable Devices keys as seen in figure 2.1, we can see the FriendlyName I mentioned before “FOR340USB”, which is what I used for this experiment.

![](/assets/img/posts/2020/Portable_Devices.png)

Figure 2.1 – FriendlyName in Windows Portable Devices

And the location where I found the Drive Letter and the FriendlyName (here named VolumeLabel), is under the VolumeInfoCache key. Full path is: **Software\Microsoft\Windows Search\VolumeInfoCache**

I will admit, I have never seen this key before, but it turns out [Harlan Carvey](http://windowsir.blogspot.com/) has, and that’s why he has a plugin for it. So using RegRipper this time, we can see the details:

![](/assets/img/posts/2020/VolumeInfoCache_RegRipper.png)

Figure 2.2 – Drive Letter & VolumeLabel Found in VolumeInfoCache

Now we know the Volume GUID, Volume Label (or Friendly Name), and the Drive Letter. All we need now, is corroborate this with the user that used the USB.

**PART#3 – NTUSER.DAT HIVE**

Checking the **MountPoints2** within the user’s registry hive and under the path **NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\**, and as we can see in figure 3.1, the volume GUID is found here, which means this user has used this USB.

![](/assets/img/posts/2020/MountPoints2.png)

Figure 3.1 – Volume GUIDs Found in MountPoints2

Now, let’s assume this user was using this USB but hiding it when no longer needed! This means, we could check other registry entries for more artifacts about this USB being used. Let’s first check the Recent Documents MRUs. We can see in figure 3.2, that the friendly name **FOR340USB (E:)** is found under the folder MRU.

![](/assets/img/posts/2020/RecentDocs.png)

Figure 3.2 – Evidence under RecentDocs MRU

Also when checking the **UserAssist** and filtering the “**E:\**” drive, we can find evidence, as seen in figure 3.3.

![](/assets/img/posts/2020/UserAssist.png)

Figure 3.3 – Evidence under UserAssist

**FINAL NOTE**

There are many ways to remove the drive letter of a volume, I preferred to test this PowerShell set of commands found in figure 4.1, which was taken from [here](https://winaero.com/blog/remove-drive-letter-windows-10/).

![](/assets/img/posts/2020/powershell-remove-drive-letter.png)

Figure 4.1 – Removing Drive Letter using Powershell

And that’s it for this one folks! We proved the entries do not get removed, even if the user removes the drive letter and we can still prove the USB has been used by the user (didn’t account timestamps in this case). Keep an eye out for the upcoming post ;)

**Useful References:**

– https://docs.microsoft.com/en-us/dotnet/api/system.io.drivetype?view=netframework-4.8
