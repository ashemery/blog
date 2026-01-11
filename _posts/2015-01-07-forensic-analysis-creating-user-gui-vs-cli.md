---
title: 'Forensic Analysis: Creating User GUI vs CLI'
date: 2015-01-07 19:32:01 -0500
categories:
- Forensics
- Windows
tags:
- analysis
- forensics
- prefetch
- shellbags
- user
- windows
permalink: /2015/01/07/forensic-analysis-creating-user-gui-vs-cli/
reading_time: 5
---
Hello,

This is my first forensic analysis post in English; as I’m sure you noticed by now that all of it is in Arabic; so excuse me for my bad English :)

The whole idea came out when [@azeemnow](https://twitter.com/azeemnow) asked the #DFIR community the following:

**how can you tell the difference between a Windows account created from cmdline vs GUI interface?**

Found here: [URL](https://twitter.com/azeemnow/status/550300078439956480)

I tried to help by giving ideas, but it seems they didn’t help solve the case! So I said to myself why not replicate the process and do some checks!

Actions below done not in exact listed order (more later)!!!

1- Started a cmd.exe with Administration priveleges, and executed:

**net user cmduser cmduser /add**

2- From the Windows Control Panel and using the User Account applet, I added a user named **guiuser**.

Now; the first idea I had in mind is I thought that checking the system logs alone was enough to find clues about the exact location of execution & creation. I was wrong about that! Both log entries showed no difference at all except the username for sure :)

In the Event Viewer, the creation process logged (among a couple others) the event ID **4720** “A user account was created”. For the sake of creating some deceptive I won’t mention which user was created first CLI or GUI; the first user was created at time 1/7/2014 4:40:02 pm where the second was created at 1/7/2015 4:40:30 pm.

At this time [@azeemnow](https://twitter.com/azeemnow) had already prepared a super timeline (could be found here: [URL](https://twitter.com/azeemnow/status/552174924681334784)). The timeline showed no proof to our investigation!

After a discussion with Harlan [@keydet89](https://twitter.com/keydet89) on mail, he pointed me to check for the net.exe and net1.exe prefetch files, last executed times, and that they will be shortly before the user account was created. This check is to prove that a user account was added using the CMD.EXE. I extracted both files and used Jean-Michel Picod’s [@jmichel_p](https://twitter.com/jmichel_p) [prefetch](http://bitbucket.cassidiancybersecurity.com/prefetch-parser) Python script to examine this (my prefetchParser.py has some issues so its not complete).

So let’s check the NET.EXE prefetch file:

![](/assets/img/posts/2015/net-prefetch.png)

So let’s check the NET1.EXE prefetch file:

![](/assets/img/posts/2015/net1-prefetch.png)

Correlating the results from the prefetch files and the events found, we can assume that the user that was created at **2015-01-07 14:40:02** is the user account created from the **CLI** “CMD.EXE”.

Now what about the other user? The clue Harlan gave me was to check shellbag entries for the user account used to create the user pointing to the User Account applet. Okay I said to myself; this is the best time to check Eric Zimmerman’s [@EricRZimmerman](https://twitter.com/EricRZimmerman) latest **ShellBags Explorer** and give it a try (download it from here: [ShellBagsExplorer](https://www.dropbox.com/s/lw9d0zrzqcrccy4/ShellBagsExplorer.zip)).

I extracted the **UsrClass.dat** for the user who created the accounts and loaded it into Eric’s Shellbags Explorer; and it truly does a fantastic job of categorizing things and displaying all the activity recorded in a simple tree heirarchy way. From the SBE I found that the user has opened the Control Panel, User Accounts at time 1/7/2015 2:40:20 pm.

![](/assets/img/posts/2015/sbe1-useraccounts.png)

By clicking on the User Accounts applet, the Manage Accounts page was displayed to the user also at time 1/7/2015 2:40:22 pm.

![](/assets/img/posts/2015/sbe2-manageaccounts.png)

Then from there the user has opened the **Create New Account** window, which he/she used to create the account at time **1/7/2015 2:40:30 pm**.

![](/assets/img/posts/2015/sbe3-createuser.png)

If we correlate the creation time found from the ShellBags Explorer with those in the Events Viewer, we can confirm that the second user that was created at time 1/7/2015 4:40:30 pm is the user account that was created from the **GUI** “User Account” applet and not from the command line.

Also, if you create a timeline of what was done, you’ll be able to confirm not by matching the events time/date but by seeing them listed one after another. I’m not going into creating the timeline analysis here, maybe I’ll create another post for that later when I find time :(

That’s all for now!

**Notes:**

– Testing was done on a Windows 7 32 bit. Maybe later will check on another system especially Windows 8.

– I created the cmduser frist then the guiuser. Didn’t mention this at the begining to enjoy the process yourself :)

– I’m no forensic expert, so correct me wherever you find a mistake in this post.

**Acknowlegments:**

1- Thanks to Azeem for shouting the question, which gave the idea for running a test.

2- Thanks a lot for Harlan, not just for helping me here, but for his consistent DFIR community support and priceless posts!

3- Thanks to Eric Zimmerman’s Shellbags Explorer. I highly recommend you download the tool and read the wonderful documentation that comes with it.

B!n@ry
