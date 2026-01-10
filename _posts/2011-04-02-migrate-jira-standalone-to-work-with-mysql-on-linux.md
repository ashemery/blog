---
title: "Migrate JIRA Standalone to work with MySQL on Linux"
date: 2011-04-02 22:42:50 -0500
categories: ["Apache/Tomcat", "Database", "GNU/Linux"]
tags: ["HSQL", "JIRA", "Linux", "Migrate", "mysql", "Standalone", "Tomcat"]
permalink: "/2011/04/02/migrate-jira-standalone-to-work-with-mysql-on-linux/"
reading_time: 3
---

هذه التدوينة هي لأجل كتابة الخطوات المطلوبة لجعل نظام Ticketing المسمى Jira بالعمل مع قاعدة البيانات MySQL بدلا من العمل على HSQL … وهي تدوينة من بين عدة كتابات قمت بكتابتها باللغة الأنجليزية وحان وقت ترجمتها لمن قد يستفيد منها بدلاً من تركها هكذا في جهازي … طبعا في هذه التدوينة لن أتكلم عن طريقة التنصيب وإنما فقط عملية التحويل أو تركيب نظام MySQL على النظام … ولكن فقط خطوات التحويل … وأرجوا ان تقوم بعمل نسخ إحتياطي لقاعدة الموقع الحالية (XML Export) وذلك لأننا سنحتاجها في نهاية العمل …

الآن قم بعمل قاعدة بيانات لـ Jira وكذلك مستخدم للقاعدة … سوف أسمي القاعدة jiradb والمستخدم jirauser … قم بتغيير التسميات الى ما تشاء إن رغبت في ذلك … لعمل ذلك:

```
$ mysql --user=root -p
```

بعد ذلك لنعمل القاعدة:

```
mysql> create database jiradb character set utf8;
Query OK, 1 row affected (0.02 sec)
```

الآن لنعمل المستخدم ونعطيه الصلاحيات المطلوبة للعمل مع القاعدة:

```
mysql> GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX on jiradb.* TO 'jirauser'@'localhost' IDENTIFIED BY 'mypassword';
Query OK, 0 rows affected (0.00 sec)
```

بغد ذلك أعمل التالي وأخرج من MySQL:

```
mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> quit
```

ملاحظة:

أرجوا ان لا تنسى أن تقوم بتغيير كلمة السر dbuserpassword الى شيء آخر.

الآن لنتأكد من عمل المستخدم على القاعدة:

```
$ mysql -u jirauser -p --database=jiradb
```

وبعدها:

```
mysql> show databases;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| jirauser         | localhost |
+------------------+-----------+
1 rows in set (0.00 sec)
```

ممتاز، كل شيء تمام ويعمل بشكل صحيح … الآن لنقوم بتحميل المشغل MySQL JDBC من خلال الرابط التالي: [أضغط هنا](http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.15.tar.gz/from/http://mysql.saudi.net.sa/)

بعد ذلك لنقوم بفك ملف الأرشيف ومن ثم نسخه الى المجلد المطلوب:

```
$ cp mysql-connector-java-5.1.10-bin.jar /PATH/2/JIRA/HOME/DIR/common/lib/
```

الآن نحتاج الى أن نخبر الخادم والذي هو Tomcat هنا لكي يعمل مع MySQL … نقوم بتحرير ملف conf/server.xml ونعمل التالي:

```
$ vim conf/server.xml
```

أسسفل هذه السطور:

```
Context path="" docBase="${catalina.home}/atlassian-jira" reloadable="false">
Resource name="jdbc/JiraDS" auth="Container" type="javax.sql.DataSource"
```

ستجد هذه السطور:

```
username="sa"
password=""
driverClassName="org.hsqldb.jdbcDriver"
url="jdbc:hsqldb:${catalina.home}/database/jiradb"
minEvictableIdleTimeMillis="4000"
timeBetweenEvictionRunsMillis="5000"
```

أستبدلهم بهذه:

```
username="jirauser"
password="dbuserpassword"
driverClassName="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/jiradb?autoReconnect=true&useUnicode=true&characterEncoding=UTF8"
maxActive="20"
validationQuery="select 1" />
```

والآن قم بتحرير الملف atlassian-jira/WEB-INF/classes/entityengine.xml وقم بعمل التالي:

```
$ vim atlassian-jira/WEB-INF/classes/entityengine.xml
```

أستبدل السطرين هذي:

```
datasource name="defaultDS" field-type-name="hsql"
schema-name="PUBLIC"
```

بهذا السطر فقط:

```
datasource name="defaultDS" field-type-name="mysql"
```

وكذلك تأكد من وجود هذه:

```
helper-class="org.ofbiz.core.entity.GenericHelperDAO"
check-on-start="true"
use-foreign-keys="false"
```

الآن لنقوم بتشغيل JIRA:

```
$ ./bin/startup.sh
```

وأذهب الى رابط الموقع الذي يعمل عليه JIRA وستجدها تسألك عن إدخال معلوماتك وكأنك تقوم بتنصيب JIRA أول مرة … قم بإختيار إستعمال XML قديم وهو الذي يحتوي على قاعدة بيانات موقعك القديم وما فيه من بطاقات وقم بعمل تحويل وأنتظر الى حين ينتهي التحويل … هذه أهم نقطة وكذلك لكي تكمل عملك بدون أن تقوم بإستعمال قاعدة جديدة ولا تحتوي على كل البطاقات التي تم فتحها والمشاريع التي تعملون عليها …

روابط مفيدة: [الأول](http://confluence.atlassian.com/display/JIRA040/Setting+up+JIRA+Standalone+and+MySQL+on+Linux) | [الثاني](http://dev.mysql.com/downloads/mirror.php?id=401351#mirrors) | [الثالث](http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.15.tar.gz/from/http://mysql.saudi.net.sa/)
