---
title: "Investigating USB Drives using Mount Points Not Drive Letters"
date: 2020-04-04 16:42:40 -0500
categories: ["DFIR", "Forensics", "Investigations", "Windows"]
tags: ["DFIR", "Forensics", "Investigations", "registry", "Registry Explorer", "RegRipper", "USB", "Windows", "Windows and tagged Computer Forensics"]
permalink: "/2020/04/04/investigating-usb-drives-using-mount-points-not-drive-letters/"
reading_time: 6
---

Yes, another excellent question came up by one of my students:

**If a user mounts the volume to a mount point, what artifacts could we find for the USB?**

Starting I think from Windows 8.1 or 10, a user could mount a volume into an empty directory. Which means, that a USB could be mounted to a directory and then the user accesses the content of the volume using that directory. A feature in the past was only seen on POSIX operating systems, such as Linux. The scenario I will be using for this experiment, is a user mounts a volume (USB) to a directory and also removes the drive letter. I will be using the C:\Mountpoint as the mount point for the USB.

Note(s) before you continue reading:

1. This post does not cover all USB artifacts (registry keys, registry values, events, etc), only the ones needed to answer the question above

2. The experiment in this post was repeated three times and they all led to the same results you will find below

**PART#1 – SETUP**

First as we can see in figure 1.1, the USB labeled FOR340USB has a drive letter E:, so let’s remove it.

![](/assets/img/posts/2020/Drives2.png)

Figure 1.1 – Drives Available

Now let’s add the mount point, which could be done as seen in figure 1.2.

![](/assets/img/posts/2020/Mountpoints.png)

Figure 1.2 – Adding a Mount Point to a Drive

Go ahead and remove the drive letter as seen in figure 1.3.

![](/assets/img/posts/2020/Remove_Drive_Letter_E.png)

Figure 1.3 – Removing Drive Letter

Just a check kind of thing! On your Windows Task bar, check that the drive is no longer seen there, as seen in figure 1.4.

![](/assets/img/posts/2020/Drives3.png)

Figure 1.4 – USB Drive Not Seen in Task Bar

If you have not checked my previous post about what artifacts you will find or where to find them, when we remove a drive letter? Please check my previous post titled “[No Drive Letter, No USB Evidence? Think Again!](/assets/files/2020/no-drive-letter-no-usb-think-again)“.

**PART#1 – SYSTEM HIVE**

Starting with [Registry Explorer](https://ericzimmerman.github.io/#!index.md) and doing a quick check of the USBSTOR as seen in figure 2.1 and the MountedDevices as seen in figure 2.2, we can find the following:

![](/assets/img/posts/2020/USBSTOR.png)

Figure 2.1 – USBSTOR Keys

![](/assets/img/posts/2020/MountedDevices-1.png)

Figure 2.2 – MountedDevices Keys & Values

??_USBSTOR#Disk&Ven_Kingston&Prod_DataTraveler_3.0&Rev_PMAP#5404A6F4E0A1E2719902006D&0#{53f56307-b6bf-11d0-94f2-00a0c91efb8b}

Breaking it down:

1. Type: **Disk**, Vendor: **Kingston**, Product: **DataTraveler_3.0**, and finally Revision: **PMAP**

2. Serial Number: **5404A6F4E0A1E2719902006D**&0#

3. Disk GUID: **53f56307-b6bf-11d0-94f2-00a0c91efb8b**

If we check the Portable Device Enumerator Service (WPDBusEnum) as seen in figure 2.3, we can see that this time the *FriendlyName* is actually a **mount point** and not a name as we’ve seen in previous analysis!

![](/assets/img/posts/2020/FriendlyName2.png)

Figure 2.3 – WPDBusEnum Keys & Values

Finally, since we are still examining the SYSTEM hive, let us also check for executables seen on the drive by checking the AppCompatCache as seen in figure 2.4 (with a quick Mountpoint filter).

![](/assets/img/posts/2020/AppCompatCache.png)

Figure 2.4 – MountedDevices Keys & Values

**PART#2 – SOFTWARE HIVE**

If we check the Windows Portable Devices keys as seen in figure 2.4, we can find the same *FriendlyName*, which is a **mount point** and not a name.

![](/assets/img/posts/2020/PortableDevices.png)

Figure 3.1 – Windows Portable Devices Keys & Values

Not much left, let’s move to the final interesting part :)

**PART#3 – NTUSER HIVE**

Now we need to check which user had this mount point configured, so we will be loading the NTUSER hive and first go to the MountPoints2 key, we can still see the Volume GUID, but the interesting thing we find this time, is a key under CPC named **LocalMOF** with the a value pointing to our mount point as seen in figure 4.1.

![](/assets/img/posts/2020/LocaclMOF.png)

Figure 4.1 – LocalMOF Keys & Values

The full path: NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\CPC\LocalMOF

Did the user run something from this mount point (USB Drive)? Well let’s check the UserAssist keys and values. After doing that with a quick filter as seen in figure 4.2, we can see the user ran 3 programs off this location procexp64.exe, a.exe, and DCode.exe and the details in the same figure 4.2.

![](/assets/img/posts/2020/UserAssist-1.png)

Figure 4.2 – UserAssist Values

Now another excellent location to check for evidence is the Program Compatibility Assistant keys found under the user registry hives. Yes, here I am referring to **AppCompatFlags** Registry Keys. Harlan Carvey has a plugin “*appcompatflags*” for these keys and you can read more about them from Corey Harrell’s post [here](http://journeyintoir.blogspot.com/2013/12/revealing-program-compatibility.html). After using the plugin with RegRipper, we can see some more entries related to this mount point of our user’s USB drive.

as seen in figure 4.3.

![](/assets/img/posts/2020/AppCompatFlags.png)

Figure 4.3 – AppCompatFlags Values

And that’s it for this post…

**SUMMARY**

So were we able to answer the question at the beginning of the blog and here is a summary of findings:

1. SYSTEM Hive

ControlSet001\Enum\SWD\WPDBUSENUM\\

– ContainerID

– FriendlyName

ControlSet001\Control\Session Manager\AppCompatCache

2. SOFTWARE Hive

Microsoft\Windows Portable Devices\Devices\SWD#WPDBUSENUM#_??_USBSTOR#\\

3. NTUSER Hive

Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\CPC\LocalMOF

– Mount point

Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store

– Values to used executables

Others not mentioned in this post but in previous post:

Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs

Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU

**Useful Resources:**

– Assign a mount point folder path to a drive, [URL](https://docs.microsoft.com/en-us/windows-server/storage/disk-management/assign-a-mount-point-folder-path-to-a-drive).

– Harlan Carvey’s AppCompatFlags Plugin, [URL](https://github.com/keydet89/RegRipper2.8/blob/master/plugins/appcompatflags.pl).

– Revealing Program Compatibility Assistant HKCU AppCompatFlags Registry Keys, [URL](http://journeyintoir.blogspot.com/2013/12/revealing-program-compatibility.html).
