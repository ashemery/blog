---
title: "PCI Compliance Standards"
date: 2009-07-08 01:15:49 -0500
categories: ["Patch Management", "PCI Compliance", "PenTest", "Security", "Vulnerability"]
tags: ["Approved Scanning Vendor", "ASV", "Audit", "LanGaurd", "Nessus", "nmap", "Patch Management", "PCI Compliance", "PenTest", "Security Auditors", "Vulnerability Assessment"]
permalink: "/2009/07/08/pci-compliance-standards/"
reading_time: 5
---

السلام عليكم ورحمة الله وبركاته

أعرف بإن لي فترة طويلة غائب عن الكتابة سواءاً في المدونة، أو في مجتمع لينوكس العربي ولكن السبب هو إنشغالي بالعمل بشكل كبير جداً … حالياً يجب أن أقوم بتسليم التقارير الأمنية سواءاً الخاصة بالـ Vulnerability Assessment أو الخاصة بالـ PenTest أو غيرها … كل ذلك مطلوب من أجل الـ [PCI Compliance](https://www.pcisecuritystandards.org/) التي سأتحدث عنه …

طيب **ما هو هذا الـ PCI Compliance؟**

هي عبارة عن مجموعة من القواعد والقوانين الدولية المختصة في أمن المعلومات، أنشأتها Payment Card Industry Security Standards Council أو بإختصار PCI SSC. هذه القوانين تم عملها لمساعدة المنظمات/الشركات التي تقوم بمعالجة عمليات الدفع بواسطة البطاقات المصرفية ومنع حصول عمليات الإحتيال عليها من خلال زيادة السيطرة على البيانات ومنعها من التعرض للمساومة … هذه القوانين تنطبق على جميع المنظمات/الشركات التي تحمل، تعالج، أو تمرر بيانات صاحب البطاقة التي عليها علامة Visa أو MasterCard أو American Express أو Discover وأخيراً JCB والذين هم حسب ما فهمت الشركات التي قامت بتأسيس هذه المنظمة …

*(تم وضع هذا التعريف من خلال ترجمة ما هو موجود في الويكيبيديا) …*

هذه القوانين تتظمن التالي:

**Build and Maintain a Secure Network**

Requirement **1**: Install and maintain a firewall configuration to protect cardholder data

Requirement **2**: Do not use vendor-supplied defaults for system passwords and other security parameters

**Protect Cardholder Data**

Requirement **3**: Protect stored cardholder data

Requirement **4**: Encrypt transmission of cardholder data across open, public networks

**Maintain a Vulnerability Management Program**

Requirement **5**: Use and regularly update anti-virus software

Requirement **6**: Develop and maintain secure systems and applications

**Implement Strong Access Control Measures**

Requirement **7**: Restrict access to cardholder data by business need-to-know

Requirement **8**: Assign a unique ID to each person with computer access

Requirement **9**: Restrict physical access to cardholder data

**Regularly Monitor and Test Networks**

Requirement **10**: Track and monitor all access to network resources and cardholder data

Requirement **11**: Regularly test security systems and processes

**Maintain an Information Security Policy**

Requirement **12**: Maintain a policy that addresses information security

لتحقيق هذه القوانين المطلوبة صدقوني ليس بالعمل البسيط ولا الهيين … صحيح هناك بعض الامور التي ربما تراها بسيطة وما الى ذلك، ولكنها أصعب على أرض الواقع عند تطبيقها … يعني لأعطيكم مثال بسيط جداً عن مشكلة أكيد ستحدث في عالمنا العربي (حدثت معي بالطبع) … حين تقوم بوضع Policy على كلمات السر ويجب ان يكون طولها 12 رمز، وتكون كلمة السر مخلوطة بالحروف والإشارات والأرقام وفوق كل هذا يجب تغيير كلمة السر كل شهر، ويجب أن لا تكون الكلمة السرية الجديدة ذات علاقة بالكلمة السرية القديمة … هنا صدقوني ستحصل مشاكل مع الموظفين الذي أعتاد على admin123 أو ربما root123 أو ربما إسمه كما هو، أو غيرها من الكلمات السرية البسيطة … مثال آخر، حين تقوم بمراقبة الشبكة وكل ما يدخل ويخرج، وتراقب البرمجيات وما هي البرمجيات المنصبة على جهاز X أو Y أو Z … كل هذه ستجلب لك مشاكل مع الموظفين … وسيبدأ البعض يظن بإن وجودك هنا هو لمراقبته فقط :) هذه أمثلة عن واقع حال ولم أجلبها من خيالي … مثل هذه المشاكل صدقوني أصعب من تنصيب وتشغيل مثلا نظام حماية ما وإستعماله بشكل دوري !!!

ولهذا تطبيق هذه القوانين ليس بتلك السهولة التي يتوقعها البعض …

الآن من ظمن العمل الذي يجب ان أقوم به بالإضافة الى الـ Patch Management والتي بأمانة بفضل الله ومن ثم بفضلها تعلمت الكثير من الأمور في ما يخص نظام الويندوز مثلاً وما هي الإعدادات الآمنة التي يجب عملها الى غيرها من الأمور … يجب أن أقوم بعملية Scan على الشبكة والتأكد من كونها تحقق المتطلبات الخاصة بالـ PCI Compliance … الآن بالنسبة للفحص الخارجي يجب أن يتم من خلال شركة مصنفة على إنها Approved Scanning Vendor أو بإختصار ASV … وفي عملي أستعمل [McAfee Secure](http://www.mcafeesecure.com/us/) بالإضافة الى أدوات أخرى والتي هي [Nessus](http://www.tenablesecurity.com/) – ولكن بإستعمال Professional Feed مع حبيب الشعب [Nmap](http://nmap.org/) … كل هذه الأدوات لأقوم بعمل التقارير التي تخص الـ External Scan على الشبكة الخاصة بالشركة …

على مستوى الفحص الداخلي أستعمل بالإضافة الى Nessus و Nmap … أستعمل [LanGaurd](http://www.gfi.com/languard) وهو برنامج رائع جداً ويساعدني في عملية الـ Patch and Service Pack Deployment على الأجهزة التي يعمل عليها نظام Windows … هذه تقريباً أهم الأدوات التي أستعملها بالوقت الحالي بالإضافة الى أدوات أخرى سأذكرها مع كل مشكلة وجدتها وأحتجت الى أداة خاصة أو صغيرة كأن تكون Perl Script أو برنامج exe يعمل على منصة ويندوز بالطبع …

طبعاً الحمد لله أنهيت الفحص الخارجي وحصلت على Pass للمتطلبات، ولم يبقى سوى إنهاء الفحص الداخلي مع إنهاء كتابة باقي التقارير والمتطلبات الأخرى … وبعدها أنتظر قدوم الـ Security Auditors لكي يقوموا بعمل Audit على الشبكة وتدقيق التقارير والمتطلبات … إن كان كل شيء كما هو مكتوب ؟ خلاص نكون أجتزنا متطلبات PCI Compliance وستكون صالحة لمدة 3 شهور وبعدها يعودون للتدقيق مرة أخرى … وإن لم نشتاز المتطلبات؟ يجب أن نقوم بإنهاء ما يقوله لنا الـ Auditors … الله يستر بس ههههههههههه

بعد الإنتهاء من الفحص الخارجي، إكتشفت عدة مشاكل أمنية سأقوم بذكر وشرح كيفية حل التي أذكرها وقمت بتسجيلها (لأني لم اقم بتدوين جميعهم وذلك لأني نسيت عمل ذلك) … إن شاء الله تكون المشاكل التي سيتم ذكرها مع حلولها محل فائدة لكم، وأتمنى أن يكون هذا الموضوع قد وضح ولو بشكل بسيط جداً جداً جداً ما هي هذه القوانين وما هي فائدتها وسيتم ذكر المزيد عنها بالمستقبل إن شاء الله …

روابط مفيدة:

[Payment Card Industry Data Security Standard](http://en.wikipedia.org/wiki/Payment_Card_Industry_Data_Security_Standard) من ويكيبيديا

[About the PCI Data Security Standard (PCI DSS)](https://www.pcisecuritystandards.org/security_standards/pci_dss.shtml)

[Approved Scanning Vendors](https://www.pcisecuritystandards.org/pdfs/asv_report.html)

[PCI Audit Procedures](https://www.pcisecuritystandards.org/pdfs/pci_audit_procedures_v1-1.pdf)

دمتم بود جميعاً …
