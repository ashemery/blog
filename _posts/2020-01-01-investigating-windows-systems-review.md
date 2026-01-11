---
title: Investigating Windows Systems (Book Review)
date: 2020-01-01 00:28:21 -0500
categories:
- Books
- Forensics
- Investigations
- Windows
tags:
- analysis
- artifacts
- dfir
- investigating
- micro-timelines
- pivot-points
- review
- skills
- timelines
- windows
permalink: /2020/01/01/investigating-windows-systems-review/
reading_time: 9
---
Hello,

We have a saying in Arabic “ان تأتي متآخراً، خيراً من أن لا تأتي أبدا” and in English “Better late, than never!”. This is my review to [Harlan Carvey](http://windowsir.blogspot.com/)‘s last book titled “[Investigating Windows Systems](https://www.amazon.com/Investigating-Windows-Systems-Harlan-Carvey/dp/0128114150/)” which I should have wrote a long time ago (Sorry Harlan)!

If you have been reading for Harlan over the years (like I have), then this book is totally different than those. It is not about a specific Windows version and it is also definitely not about Windows Registry. You might be asking “Then why should I be interested and why is the title about Windows?” This is what I will explain in this post. A couple days ago, Harlan wrote a post about “[Improving Your DFIR Skills](http://windowsir.blogspot.com/2019/12/improving-dfir-skills.html)” adding to another great post by Brett Shaver’s post titled “[Want to improve in #DFIR? Study someone else’s case work.](https://www.dfir.training/dfir-training-blog/want-to-improve-in-dfir-study-someone-else-s-case-work)” discussing the same concept. I’m not going to repeat what they discuss in their posts, because I’m sure they are well written and share great ideas, I’m just going to explain how this is true from my experience as an instructor and how Harlan’s book is a good choice for you.

One of the important facts that I enter every single class I teach with; is I am going to learn something new at the end of this class, and I honestly do! There is always something that I take away from a class. Sometimes it could be technical, others could be related to logistics, but there is something I take away. OS Forensics is one of the courses I teach at the college and it is a course I enjoy a lot, because there is always something new there that me and my students find. Many of the assignments in this course and others require writing analysis reports to a small case, plus most of our courses actually end with a final project (bigger case), that the students have to write a thorough analysis of a given case. Yes, this post is not about how good the college I work at or how excellent our students are (that’s a fact :D), but as an instructor, ***I get to read all of that***! YES, the whole idea is in that last sentence! If you’re an instructor then you will be reading about so many different approaches that your excellent students are using and documenting, which means you will also learn something from there. If anyone says otherwise as if they know every approach or method a case could be taken and solved, then that is not true and I do not believe in it. This is where Harlan’s book comes into the play! This book is about different Windows systems being investigated by Harlan. You will not only learn about the different system artifacts that are on those systems, but the approaches and methods he took to solve each case. You will learn how others think about a case and how other investigators might approach it. Think of Harlan solving those cases as different investigators solving a case and you’re reading how they approached the case. Most problems or cases have so many ways of being solved and therefore seeing how others solve the same case will help you enhance your investigation skills and also see the gaps of things you probably did not even think about! Yes, no one is perfect and we do not know everything. You might know a lot of things but not EVERYTHING and this is where also reading how others solve a case is helpful. Maybe there is an artifact that you didn’t know about or didn’t consider, while others did. Even Harlan in his book explains in one of the chapters, that there was an artifact that he did not know about and found while doing that investigation. The book goes over a range of different cases were a Windows operating system of different versions was involved. Harlan shows how he approached each case and why he took that investigation path, why he chose to focus on this artifact and what he is getting out of it, it is not about tools and how to use them. But even with that said, you will learn how to use some tools for sure. So does this mean that this book is not good for instructors, since we already see different approaches and methods used by our students? The answer is definitely NO, you will learn from a person who has been doing Windows Forensics for a very long time and I also advise you to check the other pros about this book, which are explained below. I personally have learned a lot from Harlan over the years, from his blog and all of his books, and I definitely learned from this one too!

Now other pros could be categorized as following:

**1. Analysis Process, Planning, and Case Documentation**

You will learn how Harlan approaches a case and what are the process steps he takes from the beginning until the end, what decisions he did and why. Harlan explains why you must start with a plan and build on that if needed. There is a process that should be involved with every investigation and it is not about “getting the forensic image and running some tools” then paste the results to a report and hand it over to your client! The book also explains why documentation is important and what to write in your document/report. In one of the chapters, Harlan also explains why he didn’t answer some of the questions in a case he used for the book, because those should be normal case documentation. Yes, do not be surprised if you read a report with such info missing, so good that Harlan reminds us about that.

**2. Diversity of Artifacts**

Yes, through the different cases and Windows versions he goes over, you will learn about different artifacts on those systems and what information could you extract from them. The cases covered are so diverse which leads to analyzing different data and learning about them.

**3. Micro-Timelines and Pivot Points**

While both Micro-timelines and Pivot Points are not something totally new to this book, especially if you have read Harlan’s previous books, but in this book you get to see them in action and how they were used with different cases! Yes, you get to see how those timelines helped build indicators or “pivot points” that guided him how to steer the investigation or chose a certain path to follow. You will understand why this type of timeline could be better sometimes than running super timelines!

**4. Goals and Policies**

Why it is important to have a goal for your investigation and what are you trying to answer. An investigation should not be a run over a checklist of artifacts, because simply you might neither have time (urgent case) or are paid for that amount of time (low payment). Also, in one of the cases he explains why understanding policies are important and will help you with finding answers to questions. I do not want to go more deeper here since it will be a spoiler (hope I haven’t already!!!), but you will understand what I mean once you read that case ;)

**5. Data Interpretation**

Interpreting the data is very important (just like anything in life), without correct interpretation, you will get wrong answers. Harlan in the book explains why some findings are not enough and need to chase other artifacts for supporting information.

**6. DFIR Analysts are not Perfect**

In one of the cases as I mentioned at the beginning of this post, Harlan explains how he learned about a new interesting artifact that he has not encountered before. This does not take away anything from Harlan, but just proves that we all do not know everything and that Sherlock Holmes’s quote “**Education never ends, Watson. It is a series of lessons, with the greatest for the last.**” is totally true :)

**Details that were removed, since they might be spoilers:**

1. The case that Harlan skipped normal case info and did not answer them in his book. Read the book and you will know what they are.

2. What artifacts were covered. I can say they are a lot, yes “a lot”.

3. What cases were covered during the whole book.

4. The example he used to explain why reading policies is important.

5. What was the artifact that Harlan learned in his book.

Note: sorry if there was any spoilers in my post, I did my best to make sure I do not spoil anything for new readers!

So finally, “*If you want to improve your DFIR skills*“, whether you’re a professional practitioner, student, instructor, someone with curiosity to learn, then I would highly recommend this book to you. It is a unique book in the approach that was written in and I have never read a book written this way, especially for DFIR.

Thank you [Harlan](https://twitter.com/keydet89) not just for writing this book, but for all the things I have learned from you over the years.

If you made it this far, then I wish you a happy and healthy 2020 :)

EOF
