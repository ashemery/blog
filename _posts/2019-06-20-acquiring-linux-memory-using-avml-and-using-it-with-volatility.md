---
title: "Acquiring Linux Memory using AVML and Using it with Volatility"
date: 2019-06-20 02:26:27 -0500
categories: ["DFIR", "Forensics", "Memory", "Software/Tools"]
tags: ["Acquiring", "avml", "Forensics", "LiME", "Linux", "memory forensics", "Profile", "Volatility"]
permalink: "/2019/06/20/acquiring-linux-memory-using-avml-and-using-it-with-volatility/"
reading_time: 4
---

This is another quick post going over the process to acquire memory from a Linux system, but instead of using [LiME](https://github.com/504ensicsLabs/LiME), I’m going to use [AVML](https://github.com/microsoft/avml) which stands for Acquire Volatile Memory for Linux, and could be found [here](https://github.com/microsoft/avml). The tool has been developed by [Brian Casewell](https://twitter.com/evilcazz) for Microsoft and is a “userland volatile memory acquisition tool”.

AVML tries to acquire memory from the following memory sources:

/dev/crash

/proc/kcore

/dev/mem

The installation is straight forward and well documented on the Github page. I used the build on Ubuntu, which is really just “copy & paste” no super power required there, thanks to Brian! One note is there are two builds, one will provide an upload feature to upload the images to Azure and the other build without that. The size is really small, mine with full features was 5.5MB. After finishing the build you will find the binary (at least on my system) under:

```
./target/x86_64-unknown-linux-musl/release/
```

Now you can use the “**avml**” binary you found there or even copy it to other systems, or run from a USB too.

To acquire the image of the system of interest, just do the following:

```
$sudo ./avml /path/2/file/image.mem
```

There is a neat feature to compress the memory for you, but unless your supports that, do not use it, especially if you only have one shot at obtaining the memory!

Now what we need to do is build the Volatility profile for the system of interest. This could be done using the following steps:

1. Clone the Volatility Repo:

```
git clone https://github.com/volatilityfoundation/volatility
```

2. Go to the Linux tools available to build the profile found here:

```
cd volatility/tools/linux/
```

3. Now as stated on the Volatility’s [Linux website](https://github.com/volatilityfoundation/volatility/wiki/Linux) (not doing rocket science here), make sure you know which Kernel you’re building your module for, therefore check it using:

```
$ uname -r
```

Now go ahead and do the following (in my case “4.15.0-51-generic”):

```
$ sudo make -C /lib/modules/4.15.0-51-generic/build/ CONFIG_DEBUG_INFO=y M=$PWD modules
$ dwarfdump -di ./module.o > module.dwarf
$ sudo zip Ubuntu64-4.15.0-51.zip module.dwarf /boot/System.map-4.15.0-51-generic
```

**Note(s): 1. I named my profile “Ubuntu64-4.15.0-51” so it can be easy to know for which kernel is this profile. 2. The profile will only work on a system with the same Kernel, if you’re working with a different system, then you must build another profile.**

4. Now copy the profile to the profiles directory:

```
$ cp Ubuntu64-4.15.0-51.zip ../../volatility/plugins/overlays/linux/
```

5. Go back to the root of the volatility directory:

```
$ cd ../../
```

Now if you’ve done all the steps correctly, then you’ll have a new Linux profile. To check, run the following:

```
$ vol.py --info | grep Linux
```

You should see something similar to:

![](/assets/img/posts/2019/linux-profilesH.png)

Now to use the built profile with our memory acquired by AVML, we can do:

```
$ python vol.py --profile=LinuxUbuntu64-4_15_0-51x64 -f /tmp/image.mem linux_mount
```

You should see something similar to:

![](/assets/img/posts/2019/linux_mount-sample-1.png)

For more Volatility commands, just check:

```
$ vol.py --info | grep -i Linux
```

And that’s it! Big thanks to Brian for creating such an awesome tool!

Edit (Dec. 24th, 2023): [dumpit-linux](https://github.com/MagnetForensics/dumpit-linux) tool
