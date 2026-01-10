---
title: "Challenge #9 – Encrypt Them All Case"
date: 2023-03-27 04:29:48 -0500
categories: ["Anti-Forensics", "Challenges", "DFIR", "Forensics", "Investigations", "Windows"]
tags: ["aes", "anti-forensics", "bit-locker", "challenges", "DFIR", "gnupg", "Investigations"]
permalink: "/2023/03/27/challenge-9-encrypt-them-all-case/"
reading_time: 2
---

In this case you are required to decrypt all the data and files that have been encrypted using different crypto methods.

E01 for the drive could be found: [here](https://archive.org/details/anti-forensics-case-2)

**#1: Lost in Space:**

We noticed that the whole communication started with a README file within the users documents directory. Unfortunately, this file seems to be encrypted with AES and we do not have the password to decrypt it. You would either need to search the cache for the communication or try to recover the file before it was encrypted. It seems this file leads to the solution of our next requirement.

**#2: Do Not Be Deceived!:**

It seems Jane has been using a volume with full disk encryption (Bitlocker). It has been applied to a volume named R2D2. You are required to decrypt this volume and find what was hidden within it.

**#3: “Your Focus Determines Your Reality.”:**

One of the messages sent to the unknown part seemed to be using asymmetric encryption with a Public/Private key. Since we were able to acquire an image of Jane’s system, you should be able to extract these keys and use them to decrypt the message. The message which has been shared with our unknown third party, is within the keys file within the user’s download directory. You need to decrypt this file in order to get the secret message. Do you know what this was used for?

Case was done with the help of Dr. Mariam Khader. Her Twitter handle could be found [here](https://twitter.com/maryst33d).

Solutions to this case and others can be found at Cyber 5W under the Case Studies section which can be found [here](https://academy.cyber5w.com/collections/case-studies).

End of Case.
