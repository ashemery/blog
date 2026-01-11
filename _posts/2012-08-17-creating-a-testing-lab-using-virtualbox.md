---
title: عمل مختبر للتجارب بإستعمال VirtualBox
date: 2012-08-17 03:03:14 -0500
categories:
- Firewalls
- GNU/Linux
- Linux Services
- Virtualization
tags:
- centos
- chkconfig
- extension-pack
- groupinstall
- iptables
- ram
- rdp
- remote-rdp
- rpmfogre
- usermod
- virtualbox
- virtualization
- vmware
- vmware-server
- yum
- kvm
permalink: /2012/08/17/creating-a-testing-lab-using-virtualbox/
reading_time: 13
---
السلام عليكم ورحمة الله وبركاته

الكثير منا يتسائل كيف أقوم بعمل مختبر للتجارب … وأقصد هنا مختبر لتجربة الخدمات، تجربة البرامج، تجربة الشبكات، وكذلك تجربة الأمور الأمنية … الطرق عدة وكثيرة … سأوضح في هذا الموضوع الطريقة البسيطة التي أتبعها في عمل مختبري الخاص … أن تعمل مختبر خاص بك للتجارب سوف يسهل عليك فهم الكثير من الأمور التي ذكرتها … وذلك لأنه اليوم أفضل طرق التعليم، هي الطرق التي تقوم بتجربتها بنفسك … ولهذا لكي تجرب تحتاج الى بيئة عمل … إن كنت من ميسوري الحال، فيمكنك شراء خادم لكل نظام او أمر تود تجربته … ولكن لما الإسراف وهناك حلول رائعة اليوم تسهل عليك حتى عملية إدارة هذا الخادم والخدمات وأقصد هنا بالطرق التخيلية Virtualization … الكثير منا يملك اليوم أجهزة فاخرة وحديثة وذو إمكانيات أكبر من حاجياتنا الفعلية عليه … ولهذا إستغلال الجهاز بعمل مختبر تجارب عليه شيء رائع وسترى كم ستستفيد بعد ذلك في رحلة تعلمك … طبعاً إستعمالك للتخيلية Virtualization فوائد كثيرة ولكن لأكون صادق معكم لديها جوانب سلبية كذلك … كما هو حال أي شيء في حياتنا، لا يوجد شيء كامل (الكمال لله وحده) ولهذا أنت عليك أن تختار هل نذهب مع هذه الطريقة في بناء بيئة للتجربة أم نذهب للبحث عن طرق آخرى … على كل حال هذا الأمر والإختيار عائد لك، كل ما اتمناه هو إنك تُحسن الإختيار …

**الأمور التي سوف تحتاجها هو:**

1- جهاز حاسوب (يفضل مستقل وذلك لكي يكون مخصص للأنظمة التخيلية) ويفضل يكون ذو إمكانيات عالية وذاكرة RAM كبيرة.

2- نظام التشغيل جنو/لينُكس (أنا أستعمل نظام التشغيل CentOS ولهذا الشرح سيكون عليه).

3- برنامج Virtualbox (هناك برمجيات أخرى مثل VMware وKVM ولكنني بعد أن قامت شركة VMware بشبه هجرة لبرمجيتها VMware Server ولم تعد تهتم به كأول ما خرج، تركته … وKVM بعد تجارب عدة لم يعجبني صراحة وأراه ثقيل على الجهاز خاصى حين نقوم بتشغيل أكثر من نظام وهمي … بينما مع Virtualbox فأنا على اقل تقدير أقوم بتشغيل 5 أنظمة وهمية ولا أعاني من مشاكل ولا بطيء لا على النظام الوهمي ولا على النظام المستضيف CentOS ولله الحمد، ولهذا هو المفضل لدي).

**الأمور التي سوف نقوم بعملها:**

1- إعداد الشبكة على CentOS والجدار الناري Iptables

2- تنصيب أهم المستودعات الخاصة بنظام CentOS

3- تنصيب برنامج VirtualBox من المستودع

4- إعداد VirtualBox والنظام لكي يقوم بتشغيل بيئة العمل الخاصة بي بشكل تلقائي (خاصة بعد إعادة تشغيل النظام، أو بداية تشغيله)

5- إعداد الأنظمة الوهمية لكي يتمكن المستخدم من الوصول أليها من خلال بروتوكول RDP وعمل إختبار للإتصال

**ملاحظة:** تنصيب نظام CentOS خارج نطاق هذا الموضوع، وذلك لأن الشروحات عليه كثيرة وكذلك ليس بذلك الصعوبة تنصيبه.

………………….. لنبدأ العمل…………………..

**أولا: إعداد الشبكة على CentOS والجدار الناري Iptables**

كون المطلوب عمله هو خادم لإدارة باقي الخوادم الوهمية أو الأنظمة الوهمية فإنه يفضل أن يكون الخادم نفسه لديه IP Address ثابت وليس متغيير … لعمل ذلك ببساطة قم بعمل التالي:

```
[root@centos ~]# vi /etc/sysconfig/network-scripts/ifcfg-eth0
```

```
DEVICE=eth0
HWADDR=00:AA:BB:CC:DD:EE
ONBOOT=yes
BOOTPROTO=none
IPADDR=192.168.1.254
NETMASK=255.255.255.0
TYPE=Ethernet
GATEWAY=192.168.1.1
DNS1=192.168.1.1
IPV6INIT=no
USERCTL=no
```

لا تنسى تقوم بتغيير هذه المتغييرات حسب إعدادات شبكتك:

IPADDR, NETMASK, GATEWAY, DNS1

وكذلك السطر HWADDR قم بتغييره الى رقم الـ MAC Address الخاص ببطاقة الشبكة التي لديك

بعد ذلك لنقوم بإعادة تشغيل الشبكة والإعدادات الجديدة:

```
[root@centos ~]# /etc/rc.d/init.d/network restart
```

لنتأكد من تفعيلها بعد عملية إعادة التشغيل:

```
[root@centos ~]# chkconfig network on
```

لنتأكد من الإعدادات:

```
[root@centos ~]# ifconfig
```

الآن لنقوم بإعداد الجدار الناري وفتح المنافذ المطلوبة. قم بتحرير الملف التالي:

```
[root@centos ~]# vi /etc/sysconfig/iptables
```

وقم بإضافة التالي:

```
# SSH Access
-A INPUT -s 192.168.1.10 -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
# Virtualbox remote display (4 Ports)
-A INPUT -s 192.168.1.10 -m state --state NEW -m tcp -p tcp --dport 4000 -j ACCEPT
-A INPUT -s 192.168.1.10 -m state --state NEW -m tcp -p tcp --dport 4001 -j ACCEPT
-A INPUT -s 192.168.1.10 -m state --state NEW -m tcp -p tcp --dport 4002 -j ACCEPT
-A INPUT -s 192.168.1.10 -m state --state NEW -m tcp -p tcp --dport 4003 -j ACCEPT
```

هكذا فتحنا المنافذ الخاصة بالإتصال بخدمة SSH وكذلك المنافذ الخاصة التي سوف نستخدمها للإتصال بأنظمتنا التخيلية التي سوف نشغلها على الخادم … سوف نقوم بإعداد ذلك لاحقاً في هذا الموضوع، الآن فقط تجهيز المنافذ … طبعاً لو تريد تشغيل أنظمة تخيلية أكثر؟ كل ما عليك هو إضافة منفذ جديد وإعداد النظام التخيلي للعمل على ذلك المنفذ (سنأتي لها لاحقاً) … لنذهب الآن الى الخطوة الثانية …

**ثانياً: تنصيب أهم المستودعات الخاصة بنظام CentOS**

هناك بعض المستودعات التي سوف تفيدك أود أن أضيفها، وهي مستودع RPMFogre وكذلك مستودع VirtualBox … لإضافة الأول نقوم بالتالي:

```
[root@centos ~]# rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
```

بعد ذلك:

```
[root@centos ~]# rpm -ivh http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
```

بعد ذلك قم بتركيب مجموعة أدوات التطوير، وذلك لأنك ستحتاجها، ويمكن عمل ذلك ببساطة من خلال الأمر التالي:

```
[root@centos ~]# yum groupinstall "Development Tools"
```

بعض الأحيان تحتاج الى تركيب ملفات تطوير النظام بشكل منفصل:

```
[root@centos ~]# yum install kernel-devel
```

**ثالثاً: تنصيب برنامج VirtualBox من المستودع**

الآن لنقوم بإضافة مستودع VirtualBox من خلال إضافة المستودعات الخاصة به ومن ثم تنصيبه من هناك … لنقم بإضافة المستودعات بالبداية:

```
[root@centos ~]# cd /etc/yum.repos.d
```

```
[root@centos ~]# wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
```

أخيراً لنقوم بتنصيب البرنامج:

```
[root@centos ~]# yum install VirtualBox-4.1
```

وأخيراً لكي تستطيع التحكم ببرنامج VirtualBox من خلال المستخدم الخاص بك، قم بإضفته الى مجموعة برنامج VirtualBox من خلال:

```
[root@centos ~]# usermod -a -G vboxusers username
```

غيير username الى إسم المستخدم الخاص بك … وهكذا قمنا بتثبيت برنامج VirtualBox لنذهب الى الخطوة اللاحقة …

**رابعاً: إعداد VirtualBox والنظام لكي يقوم بتشغيل بيئة العمل الخاصة بي بشكل تلقائي (خاصة بعد إعادة تشغيل النظام، أو بداية تشغيله)**

هذه كانت أكثر الأسباب التي جعلتني سابقاً أستخدم برامج تخيلية أخرى وذلك لأني أفضل أن تعمل الأنظمة التخيلية لدي تلقائياً حين أقوم بتشغيل الجهاز (في المنطقة التي أسكن فيها تقطع التيار الكهربائي بشكل متكرر ولهذا كثيراً أحتاج الى تشغيل الجهاز بعد عودة التيار … طبعاً هناك حلول الـ UPS لكنه مكلف مادياً وكذلك أنا ربما كسول في البحث عن واحد ههه) … في آخر دورة لينُكس أعطيتها أحد الطلاب قال لي هناك سطر أوامر لبرنامج VirtualBox قلت له نعم أعلم بذلك لكني كسول أن أقرأ المستندات لعمل مثل هذه الأمور … ولكن صراحة بعد تلك المحاظرة عدت للمنزل وبدأت بالقراءة وعرفت الطريقة … أحتجت الى سكربت قلت أكيد هناك آخرين أحتاجوا الى ما اريده اليوم ولهذا أكيد أحدهم عمل سكربت جاهز … والحمد لله وجدت واحدة والتي سوف أضمنها ضمن هذا الموضوع (مع حفظ حقوق صاحبها) …

لنقم بالبداية بعمل مجلد وملف الإعدادات الخاصة ببرنامج VirtualBox:

```
[root@centos ~]# mkdir /etc/virtualbox
```

```
[root@centos ~]# touch /etc/virtualbox/machines_enabled
```

الملف machines_enabled سوف نضع فيه أسماء الأنظمة التخيلية التي نريدها ان تعمل بشكل تلقائي … طبعا سوف نحتاج الى أسماء هذه الأنظمة لكي نضعها فيه … لمعرفة أسماء الأنظمة التخيلية قم بتنفيذ الأمر التالي:

```
[ali@centos ~]$ VBoxManage list vms
```

**أنتبه هنا الى أمرين:**

1- يجب ان يكون الأنظمة التخيلية قد تم إضافتهم أو عملهم في برنامج VirtualBox وذلك لكي تقوم بإستعراضهم …

2- يجب ان تقوم بتنفيذ الأمر السابق بنفس اسم المستخدم الذي عمل هذه الأنظمة التخيلية … ولهذا لا تنسى تحول الى المستخدم الذي تستعمله وتنفذ الأمر السابق …

طبعاً ناتج هذا الأمر سوف يعرض لك أسماء الأنظمة التخيلية الموجودة لديك كل واحد حسب الإسم الذي أستعملته له في البرنامج … مثلا سيكون الناتج شيء مثل هذا:

```
"WinXSP2" {8f000e55-8a20-4ab0-b5af-2ab22c2d22ef}
"WinXPSP3" {8f000e55-f526-4113-bd2d-2ab22c2d22ef}
"WinSRV2003" {8f000e55-f526-4113-bd2d-2ab22c2d22ef}
"WinSRV2008" {8f000e55-f526-4113-bd2d-2ab22c2d22ef}
"CentOS6.3-PXE" {8f000e55-e78b-4103-b853-2ab22c2d22ef}
"BackTrack5R3_64" {8f000e55-588a-411f-8d78-2ab22c2d22ef}
"Exam_0712" {8f000e55-c1a7-47c0-afdb-2ab22c2d22ef}
"CentOSExam" {8f000e55-e8b2-47e3-a67f-2ab22c2d22ef}
```

الآن لنفرض تريد تشغيل النظام الوهمي الذي إسمه WinXSP2 وWinSRV2003 وكذلك BackTrack5R3_64 … كل ما عليك فعله هو إضافة أسمائهم الى الملف الذي عملناه:

```
[root@centos ~]# vi /etc/virtualbox/machines_enabled
```

وقم بكتابة السطور التالية فيه:

```
WinXSP2
WinSRV2003
BackTrack5R3_64
```

أحفظ الملف وقم بغلقه … والآن لنقوم بعمل الخدمة التي سوف تقوم بإدارة هذه الأمور من خلال عمل سكربت خاص بذلك. لنعمل ملف الخدمة وإعطاءه صلاحيات التشغيل:

```
[root@centos ~]# touch /etc/init.d/vboxcontrol
```

```
[root@centos ~]# chmod 755 /etc/init.d/vboxcontrol
```

قم بتسميتها كما يحلو لك، عني تركتها بنفس إسم الشخص الذي طور السكربت … الآن قم بتحرير الملف لنضع فيه السكربت المعني:

```
#! /bin/sh
# vboxcontrol   Startup script for VirtualBox Virtual Machines
#
# chkconfig: 345 98 02
# description: Manages VirtualBox VMs
# processname: vboxcontrol
#
# pidfile: /var/run/vboxcontrol/vboxcontrol.pid
#
### BEGIN INIT INFO
#
### END INIT INFO
#
# Version 20090301 by Kevin Swanson  based on:
# Version 2008051100 by Jochem Kossen 
# http://farfewertoes.com
#
# Released in the public domain
#
# This file came with a README file containing the instructions on how
# to use this script.
#

# Source function library.
if [ -f /etc/init.d/functions ] ; then
. /etc/init.d/functions
elif [ -f /etc/rc.d/init.d/functions ] ; then
. /etc/rc.d/init.d/functions
else
exit 1
fi

################################################################################
# INITIAL CONFIGURATION
VBOXDIR="/etc/virtualbox"
VM_USER="ali"
USE_NAT="no"

export PATH="${PATH:+$PATH:}/bin:/usr/bin:/usr/sbin:/sbin"

if [ -f $VBOXDIR/config ]; then
. $VBOXDIR/config
fi

SU="su $VM_USER -c"
VBOXMANAGE="VBoxManage -nologo"

################################################################################
# FUNCTIONS

# Determine if USE_NAT is set to "yes"
use_nat() {
if [ "$USE_NAT" = "yes" ]; then
return `true`
else
return `false`
fi
}

log_failure_msg() {
echo $1
}

log_action_msg() {
echo $1
}

# Check for running machines every few seconds; return when all machines are
# down
wait_for_closing_machines() {
RUNNING_MACHINES=`$SU "$VBOXMANAGE list runningvms" | wc -l`
if [ $RUNNING_MACHINES != 0 ]; then
sleep 5
wait_for_closing_machines
fi
}

################################################################################
# RUN
case "$1" in
start)
if [ -f /etc/virtualbox/machines_enabled ]; then

cat /etc/virtualbox/machines_enabled | while read VM; do
log_action_msg "Starting VM: $VM ..."
$SU "$VBOXMANAGE startvm "$VM" -type vrdp"
RETVAL=$?
done
touch /var/lock/subsys/vboxcontrol
fi
;;
stop)
# NOTE: this stops all running VM's. Not just the ones listed in the
# config
$SU "$VBOXMANAGE list runningvms" | while read VM; do
log_action_msg "Shutting down VM: $VM ..."
$SU "$VBOXMANAGE controlvm "$VM" acpipowerbutton"
done
rm -f /var/lock/subsys/vboxcontrol
wait_for_closing_machines

;;
start-vm)
log_action_msg "Starting VM: $2 ..."
$SU "$VBOXMANAGE startvm "$2" -type vrdp"
;;
stop-vm)
log_action_msg "Stopping VM: $2 ..."
$SU "$VBOXMANAGE controlvm "$2" acpipowerbutton"
;;
poweroff-vm)
log_action_msg "Powering off VM: $2 ..."
$SU "$VBOXMANAGE controlvm "$2" poweroff"
;;
status)
echo "The following virtual machines are currently running:"
$SU "$VBOXMANAGE list runningvms" | while read VM; do
echo -n "$VM ("
echo -n `$SU "VBoxManage showvminfo ${VM%% *}|grep Name:|sed -e 's/^Name:s*//g'"`
echo ')'
done
;;
*)
echo "Usage: $0 {start|stop|status|start-vm |stop-vm |poweroff-vm }"
exit 3
esac

exit 0
```

قك بتغيير المتغيير VM_USER الى إسم المستخدم الذي تستعمله … الآن لنقوم بإضافة وتفعيل عملها بعد عمل إعادة التشغيل للجهاز:

```
[root@centos ~]# chkconfig --add vboxcontrol
```

```
[root@centos ~]# chkconfig vboxcontrol on
```

هذه الطريقة سوف تظمن لك عملية تشغيل وغلق الأنظمة التخيلية بالشكل السليم وليس غلقها أو إيقاف عملها بشكل فجائي كما يحصل حين ينقطع التيار الكهربائي عن جهازك … أي إنها ستظمن عدم حصول مشاكل للأنظمة التي تستخدمها وإنها سوف تعمل وتتوقف حسب الأصول … الآن لنقوم بإستعراض بعض الخيارات التي لدينا في هذه السكربت …

إذا كنت تريد تشغيل جميع الأنظمة التخيلية الموجودة في ملف machines_enable كل ما عليك فعله هو:

```
[ali@centos ~]$ service vboxcontrol start
```

ولإيقاف عملهم جميعاً، أكيد سوف يكون كالتالي:

```
[ali@centos ~]$ service vboxcontrol stop
```

ولمعرفة حالة الأنظمة التخيلية التي تعمل حالياً:

```
[ali@centos ~]$ service vboxcontrol status
```

بعض الأحيان تود تشغيل نظام تخييلي منفصل، وتعلم ما هو إسم النظام … كل ما عليك فعله هو:

```
[ali@centos ~]$ service vboxcontrol start-vm
```

كذلك بعض الأحيان تود ان توقف نظام تخيلي معيين من خلال إرسال إشارة ACPI Power Button والتي تخبر النظام بإغلاق نفسه بشكل آمن وسليم (وكأنك ضغطت على زر إطفاء وتشغيل الجهاز لمرة واحدة، وليس إبقاء الضغط على الزر لحين غلق الجهاز) … لعمل ذلك تقوم بالتالي:

```
[ali@centos ~]$ service vboxcontrol stop-vm
```

وأخيراً لو أستعصت الأمور وتريد غلق النظام التخيلي بشكل لحظي وفوري، أي وكأنك تضغط على زر تشغيل النظام لأكثر من 5 ثواني، قم بالتالي:

```
[ali@centos ~]$ service vboxcontrol poweroff-vm
```

**ملاحظات مهمة:**

1- لا تنسى تستبدل  بإسم النظام التخيلي الموجود في برنامج VirtualBox …

2- قم بتنفيذ الأوامر السابقة كما هو واضح لك بالأعلى بإستعمال إسم المستخدم الذي عملت به الأنظمة التخيلية …

**خامساً: إعداد الأنظمة الوهمية لكي يتمكن المستخدم من الوصول أليها من خلال بروتوكول RDP وعمل إختبار للإتصال**

قبل كل شيء علينا بإضافة Extension Pack الى برنامج VirtualBox وذلك لكي يستطيع تفعيل خدمة Remote RDP على النظام الوهمي … لعمل ذلك علينا بتحميل الإضافة من [هنا](https://www.virtualbox.org/wiki/Downloads) أو رابط مباشر (في وقت كتابة هذا الموضوع) من [هنا](http://download.virtualbox.org/virtualbox/4.1.18/Oracle_VM_VirtualBox_Extension_Pack-4.1.18-78361.vbox-extpack) …

بعد ذلك أذهب الى برنامج VirtualBox ومن ثم أضغط على File ثم Preferences ومن ثم أذهب الى صفحة Extensions وقم بالضغط على ايقونة Add Package وأختر الحزمة التي حملتها للتو وذلك ليقوم البرنامج بتركيبها … هذه سوف تضيف لك خدمة تشغيل الأنظمة من خلال PXE ممكن نأتي لها في موضوع آخر …

![](/assets/img/posts/2012/virtualbox-extensions.png)

الآن كل ما عليك فعله هو الذهاب الى برنامج VirtualBox ومن ثم الضغط على النظام التخيلي الذي تود عمل إعداداته … وتضغط على Settings وبعد ذلك تذهب الى صفحة Display ومن ثم الى الصفحة الداخلية الثانية Remote Display … وفي حقل Server Port ضع المنفذ الذي تريده، مثلا هنا في الموضوع أستخدمنا 4000 (إذا وضعت شيء آخر لا تنسى تقوم بفتح ذلك المنفذ في الجدار الناري) …

![](/assets/img/posts/2012/virtualbox-remotedisplay.png)

الآن لنختبر وصولنا للأنظمة التخيلية، كل ما عليك فعله من خلال نظامك الحالي (إن كان لينُكس طبعاً) هو:

```
[ali@centos ~]$ rdesktop 192.168.1.254:4000 -g 90% -a 16
```

هكذا سوف تكون شبكت على النظام التخيلي من خلال بروتوكول RDP وبشكل مباشر … هو فعلياً نحن شبكنا على خادم CentOS الرئيسي الذي عملناه والذي يفرق بين نظام تخيلي وآخر هو رقم المنفذ … طبعاً بغض النظر عن النظام التخيلي سوف تستطيع إستعمال هذه الطريقة، أي إنك تستطيع إستخدامها لأنظمة ويندوز وكذلك لينُكس … وهذه هي طريقة إستعمالي صراحة لهذه الأنظمة … فهي تسهل علي بشكل كبير عملي …

من قرأ الموضوع من البداية الى هذا السطر، وقام بإستعمال البرنامج التخيلي مثل VMWare Workstation فإنه يعلم بوجود خدمة عمل Groups حيث تستطيع تشغيل أكثر من نظام تخيلي في ضغطة واحدة من خلال جمعهم في مجموعة معينة … هذه الطريقة التي في هذا الموضوع تشبه تلك الطريقة … والفارق بسيط ويؤدي الى حد ما نفس الغرض …

… [للنقاش هنا](https://www.linuxac.org/forum/showthread.php/59883-%D8%B9%D9%85%D9%84-%D9%85%D8%AE%D8%AA%D8%A8%D8%B1-%D9%84%D9%84%D8%AA%D8%AC%D8%A7%D8%B1%D8%A8-%D8%A8%D8%A5%D8%B3%D8%AA%D8%B9%D9%85%D8%A7%D9%84-VirtualBox) …

**المصادر:**

[الأول](http://wiki.centos.org/HowTos/Virtualization/VirtualBox) | [الثاني](http://wiki.centos.org/AdditionalResources/Repositories/RPMForge) | [الثالث](http://www.kernelhardware.org/virtualbox-auto-start-vm-centos-fedora-redhat/) | [الرابع](https://www.virtualbox.org/wiki/Downloads)
