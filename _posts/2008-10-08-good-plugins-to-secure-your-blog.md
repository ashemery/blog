---
title: "إضافات جيدة لحماية مدونتك"
date: 2008-10-08 12:05:23 -0500
categories: ["Security"]
permalink: "/2008/10/08/good-plugins-to-secure-your-blog/"
reading_time: 2
---

السلام عليكم ورحمة الله وبركاته

في العامين الماضيين ما شاء الله تزايد عدد المدونات بشكل كبير وكبير جداً … ومع تزايد عدد هذه المدونات بدون شك زادت عدد المشاكل التي يواجهها هؤلاء … فالكثير إن لم يكن جل المدونين هم على إستضافات مشتركة وأي إختراق للخادم الذي عليه المدونة هذه سيعرض مدونتك للإختراق أيضاً … طبعاً هذه قضية لا يمكن تجاوزها، لان الي وصل للـ BOX خلاص وصل الى كل شيء عليه … ولكن هذا لا يعني أن نقوم بحماية مدوناتنا ولو بطرق بسيطة … خاصة وإنه في هذه الأيام أنتشرت طرق الإختراق مثل XSS و SQL Injection وغيرها من الطرق …

الآن لنأتي الى الإضافات هذه، وهي:

[WPIDS – WordPress Intruder Detection System](http://blogsecurity.net/wordpress/wpids-wordpress-intruder-detection-system/)

هي نسخة من PHPIDS الذي ذكرته في تدوينة سابقة، ولكن مخصص للـ Word Press …  سوف يحميك من الكثير من أنواع الإختراقات والمحاولات الخبيثة …

[bs-wp-encrypt plugin: Encrypt Logins](http://blogsecurity.net/wordpress/bs-wp-encrypt-plugin/)

هذه الإضافة تقوم بتحويل جميع الاتصالات على wp-login.php والمجلد wp-admin/* الى HTTPS … وبالتالي سيكون كل شيء يخص هذا الملف والمجلد مشفر بينك وبين مدونتك … ولكن تأكد بإن مدونتك تدعم هذه الميزة بالأول، إن لم تكن قم بطلبها من المستضيف لديك (مكلفة نوعاً ما) …

[bs-wp-noversion plugin: Removes WordPress Version](http://blogsecurity.net/wordpress/bs-wp-noversion/)

صحيح ربما البعض يقول هي ليست بتلك الإضافة، نعم لن أخالفهم ولكنها مفيدة خاصة في التصدي لمن يملكون برامج تعمل بشكل تلقائي، ومعرفة نسخة الورد بريس التي عندك ستسهل عملهم بدون شك … ولهذا مو غلط تقوم بإخفاءها من خلال هذه الإضافة …

[WordPress Scanner](http://blogsecurity.net/wordpress/tools/wp-scanner/)

هي عبارة عن إضافة تقوم بإضافتها الى مدونتك، ومن ثم تقوم بعمل فحص من خلال طلب الفحص لمدونتك بواسطة هذه الأداة من الموقع الرسمي لها —> [أضغط هنا](http://blogsecurity.net/cgi-bin/wp-scanner.cgi)

وسوف تعطيك تقرير كامل عن الأمور التي تحتاج الى معالجة في مدونتك … إضافة رائعة للغاية …

طبعاً جميع هذه الطرق وطرق أخرى ممكن تتعرف عليها في حالة قرائتك للملف التالي: [Secure WP Whitepaper](http://blogsecurity.net/wordpress/wordpress-security-whitepaper/) أو حملها من هنا [DOWNLOAD](http://blogsecurity.net/projects/WordPress_Whitepaper_rev12.pdf)

ولا أريد أن أنسى بأن تقوم بمتابعة عمل الأشخاص في [BlogSecurity](http://blogsecurity.net) … شغلهم رائع وراقي جداً …

وأتمنى للجميع إستمرارية في التدوين، وحماية أفضل …

ودمتم بود …
