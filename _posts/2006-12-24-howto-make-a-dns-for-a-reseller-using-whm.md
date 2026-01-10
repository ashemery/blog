---
title: "كيفية عمل DNS خاص بالريسلر من خلال WHM"
date: 2006-12-24 22:55:54 -0500
categories: ["Linux Services"]
permalink: "/2006/12/24/howto-make-a-dns-for-a-reseller-using-whm/"
reading_time: 2
---

**السلام عليكم ورحمة الله وبركاته …**

موضوعي اليوم سيكون الأول على مواضيع الإستضافة وطرق التعامل مع ال cpanel وال whm … وسيكون أول موضوع على كيفية عمل DNS خاص بالريسلر الي عندك في الإستضافة يعني يصبح لهم ns1.reseller-name.com وهكذا … لكي يحصل الريسلر على خصوصيته في البيع والتعامل مع زبائنه ولكي يكون أكثر ثقة في نظرهم :)

الآن عليك الدخول الى حساب الــ WHM من خلال المتصفح وبإستعمال المستخدم root أو أي مستخدم له صلاحيات على الــ WHM … بعد ذلك أضغط على Reseller Center … الآن أضعط على Edit Reseller Privileges/Nameservers وقم بإختيار الريسلر الذي تريد أن تزوده بــ DNS خاص أو ما يسمى nameserver خاص … الحين أنزل الى أسفل الصفحة وستجد Primary Nameserver كما في الصورة التالية:

![](/assets/img/posts/2006/whm_reseller_dns.jpg)

الآن في حقلPrimary Nameserver ضع  ns1.reseller-name.com وأضغط على Assign IP Address وبعد ذلك أضغط علىAdd an A Entry for this nameserver وهكذا نكون أضفنا أول nameserver … الآن أضف الثاني في الحقل الي اسفل منه … فقط ضع فيه  ns2.reseller-name.com وأيضا أضغط على Assign IP Address وبعد ذلك أضغط علىAdd an A Entry for this nameserver وهكذا نكون أضفنا DNS خاص بالريسلر الموجود لدينا … ﻻ تنسى تضغط على save ليقوم بحفظ ما قمت به …

باقي مسألة أخيرة وهي تغيير الــ DNS الخاص بالريسلر ليقوم بالتأشير على ns1.reseller-name.com و ns2.reseller-name.com بدل من كونه يؤشر على موقع الشركة الأم …

الى هنا أراكم على خير …

أخوكم B!n@ry …
