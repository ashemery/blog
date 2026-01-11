---
title: Forensic Acquisitions over Netcat
date: 2019-06-04 05:35:57 -0500
categories:
- DFIR
- GNU/Linux
tags:
- acquisition
- acquisitions
- dfir
- distro
- forensic
- forensic-image
- linux
- netcat
- ssh
- tsurugi
permalink: /2019/06/04/forensic-acquisitions-over-netcat/
reading_time: 4
---
In the past I used to write here what I did so I do not forget, so I’ll try to get back to that habit again :)

These days whenever I find time, I’m playing with TSURUGI, which is a new (*at least to me*) Linux DFIR distro. More about the distro could be found on the system’s website [here](https://tsurugi-linux.org/). I highly recommend if you are reading these words of mine, that you go download TSURUGI and give it a try. It can be seen as the KALI Linux of DFIR!

Now, there is a project that I’m working on related to Linux, so I needed to acquire an image of a Linux system running on my testing system. So, I turned off the the system to be acquired and used the TSURUGI Linux to boot the system to be acquired. The problem in my setup, is I do not want to use a removable drive to acquire the image using TSURUGI and copy it to that target drive. Therefore, I had to go with other options, one was SSH. Doing acquisitions over SSH will be a great option, but unfortunately, in my situation, it did not work. I have not troubleshooted the reason why, since I’m not into that now, but I assume SSH did not work and every time I tried to connect to the running SSH, it just gave me a reset, because it was running in Read-Only mode from the RAM and therefore SSH sessions could not be created! (not 100% sure, just an assumption).

Then I remembered that the TSURUGI Linux team had another project which was exactly for acquisitions named [TSURUGI Acquire](https://tsurugi-linux.org/tsurugi_acquire.php). So, I downloaded this ISO file and tried to do the same, but this time since this is a smaller system, NO SSH was found :)

This is when I said, let me test NetCat! So, here is the plan:

1. System to be acquired where TSURUGI is running has an IP Address: 192.168.1.100

2. Target system used to store the evidence was running with IP Address: 192.168.1.10

3. Volume to be acquired was /dev/sda2

4. Size of volume was ~41 Gigabytes

Action time; on the target system run the following:

```
nc 192.168.1.10 -lvp 5555 | gzip -d | dd bs=64k of=image.dd
```

On the TSURUGI system where I want to acquire the VM volume, I used:

```
dd bs=64k if=/dev/sda2 | gzip -c | nc 192.168.1.10 5555
```

If you want to know which Block size to use, then maybe you can check [this](https://superuser.com/questions/234199/good-block-size-for-disk-cloning-with-diskdump-dd) discussion where a lot of benchmarking has been done. You can also replace gzip with bzip2 if you want, but that’s up to you, both compression tools work pretty well.

One final note, is if you are interested in checking the time it took for the acquisition, you can either depend on the final result in seconds, or you can use the Linux “time” command at the beginning of those commands above. So, with time calc in mind the commands would be:

```
time nc 192.168.1.10 -lvp 5555 | gzip -d | dd bs=64k of=image.dd
```

And:

```
time dd bs=64k if=/dev/sda2 | gzip -c | nc 192.168.1.10 5555
```

My second test took 71 minutes to acquire a ~84 Gigabyte volume (first test was mentioned on Twitter [here](https://twitter.com/binaryz0ne/status/1135729674565423104)). Both tests were validated to make sure the acquisition was 100% successfully done.

**One important note before I end this post, is I do not think the issue is with TSURUGI Linux that led me to acquire the volume this way, but it most probably is with me! As I said at the beginning, I’m new to the system and maybe that’s why I have not taken full advantage of it yet.**

That’s all folks!
