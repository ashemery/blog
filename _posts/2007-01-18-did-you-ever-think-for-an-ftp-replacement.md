---
title: "عمرك فكرت تجد بديل للـ ftp ؟؟؟"
date: 2007-01-18 22:06:22 -0500
categories: ["Linux Security"]
permalink: "/2007/01/18/did-you-ever-think-for-an-ftp-replacement/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته …

أغلب مستخدمي اللينوكس ومدراء هذه الأنظمة Admin’s منذ الوهلة الأولى لسؤالي سيجاوبني ssh … صح ؟؟؟ طبعا الجواب صراحة مع إحترامي لكل من جاوبه خطأ … أحا … مالذي تقوله يا B!n@ry ؟؟؟ نعم ما أقوله صح والكتب والمراجع تثبت ذلك … الـ ssh هو بديل للـ rlogin خاصة وإنه لو عرفنا إنه الـ ssh المسمى الثاني له هو slogin أي Secure Login … والـ ssh هو Secure Shell … يا B!n@ry خلاص عاد خبرنه الى ماذا ترمي …

أها هنا أجاوب على سؤالي وأوضحه للجميع … بديل الـ ftp حقيقتا هو: sftp … نعم إنه Secure FTP … والذي يأتي مع حزمة الـ [OpenSSH](http://www.openssh.com/) … هذا هو البديل الحقيقي للـ ftp وليس الـ ssh … نعم ممكن من خلال الـ ssh أعمل الأمور التي كنت أعملها من خلال الـ ftp وأكثر من ذلك بعد بكثير … لكن ما هو بديل فعلي للـ ftp هو sftp … وهو البرنامج ألي يعطيك كل الإمكانيات التي يقدمها لك الـ ftp بالضبط … ولكن بشكل Secure وليس من خلال Plain Text … أي يتم إرسال الباسوورد في الـ sftp بشكل مشفر Encrypted وهذا ما يجعله أفضل من ftp من ناحية الحماية … وأيضا يستعمل المنفذ port الخاص بالـ ssh والي هو 22 …

لو فرضنا عندنا الموقع ftp.example.com … أليكم بعض الطرق لإستعماله للإتصال به:

sftp ftp.example.com

هذا إن كان السيرفر يستعمل نفس البورت والي هو 22 … أما لو كان البورت المستعمل للـ ssh هو مثلا 8083 نعمل التالي:

sftp -oPort=8083 ftp.example.com

لمعرفة المزيد عن هذا الأمر والموضوع بإمكانك قراءة الـ man sftp أو من هذا الموقع أضغط [هنا](http://en.wikipedia.org/wiki/SSH_file_transfer_protocol) وأيضا [هنا](http://winscp.net/eng/docs/protocols#protocol_comparison) مقارنة بينه وبين الـ scp … و[هنا](http://en.wikipedia.org/wiki/List_of_SFTP_clients) البرامج التي تستعمل sftp …

أخوكم B!n@ry …
