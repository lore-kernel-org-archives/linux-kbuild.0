Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 30.mail-out.ovh.net ([213.186.62.213]:33689 "HELO
	30.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753957Ab0CYSf0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Mar 2010 14:35:26 -0400
Message-ID: <4BABACE9.8000405@example.com>
Date: Thu, 25 Mar 2010 19:35:21 +0100
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net> <20100318084012.0cca4b6a.rdunlap@xenotime.net> <4BAB9D7F.8020506@xenotime.net> <4BAB9F75.3000004@example.com> <4BABA027.6080900@xenotime.net> <4BABA206.9040205@example.com> <4BABA33D.1080903@xenotime.net>
In-Reply-To: <4BABA33D.1080903@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:
> On 03/25/10 10:48, Piotr Hosowicz wrote:
>> Randy Dunlap wrote:
>>> On 03/25/10 10:37, Piotr Hosowicz wrote:
>>>> Randy Dunlap wrote:
>>>>> On 03/18/10 08:40, Randy Dunlap wrote:
>>>>>> On Tue, 16 Mar 2010 12:24:35 -0700 Randy Dunlap wrote:
>>>>>>
>>>>>>> On 03/16/10 12:02, Piotr Hosowicz wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> I own quite strong PC, 4 core Pentium. I recently started to
>>>>>>>> build my
>>>>>>>> kernel frequently, whenever I see a new patch on kernel.org I build
>>>>>>>> again. Bothers me that I do it only for doing it. Maybe it could
>>>>>>>> be of
>>>>>>>> some help to the community? And if so, what would be more
>>>>>>>> appreciated -
>>>>>>>> linux-next patched kernel or gitN patched kernel? And how should I
>>>>>>>> configure the kernel for this purpose? I am afraid of putting all
>>>>>>>> the
>>>>>>>> options on, yesterday I tried to put everything on as a module
>>>>>>>> plus I
>>>>>>>> tinkered with some other options that seemed innocent. The kernel
>>>>>>>> was
>>>>>>>> built but could not boot, saying that there was a problem with the
>>>>>>>> root
>>>>>>>> device, it could not recoginze /dev/sda2, which is my correct root
>>>>>>>> device. I did not investigate much and reverted to working kernel.
>>>>>>>>
>>>>>>>> Thanks in advance for your remarks.
>>>>>>> Many linux-next builds are done daily: see
>>>>>>>   http://kisskb.ellerman.id.au/kisskb/branch/9/
>>>>>>>
>>>>>>> and then I do 25 x86_32 randconfigs and 25 x64_64 randconfigs
>>>>>>> daily and fix most build errors that I find in them.
>>>>>>> (I am also using a quad-core PC with a cron job that finds the
>>>>>>> next day's linux-next, downloads it, and does 50 builds.)
>>>>>>>
>>>>>>> You are welcome to do the same or test mainline (with daily
>>>>>>> builds) and/or Andrew Morton's mmotm patchset.
>>>>>> One thing that you could do that no one focuses on is building
>>>>>> with some kconfig symbols disabled (ones that are typically enabled),
>>>>>> such as CONFIG_SMP=n, CONFIG_SYSFS=n, CONFIG_PROC_FS=n, CONFIG_PM=n,
>>>>>> CONFIG_PCI=n, CONFIG_BLOCK=n, CONFIG_NET=n, CONFIG_INET=n (but latter
>>>>>> with CONFIG_NET=y), CONFIG_HOTPLUG=n.  Not all of these at the same
>>>>>> time,
>>>>>> just various/random combinations of them.
>>>>> and CONFIG_SYSRQ=n  (just found some errors due to this one)
>>>> You mean CONFIG_SYSRQ=n exactly and mandatory in every config or this
>>>> was just an example?
>>> Sorry about that.  Just make it random (sometimes disabled).
>> Ok.
>>
>> The problem I face and want to overcome now is that not all options can
>> be random, some options require to be not y or no a tall, but a string
>> or a number. So my plan is that first thing to be done is to do make
>> defconfig and put it as a template to be used by my scripts. Then only
>> the options that you enumerated earlier will be randomized. Is this
>> correct?
> 
> Yes, that's one way to approach it.
> 
> Another way (similar) would be to use a combination of "make randconfig"
> with KCONFIG_ALLCONFIG.  See Documentation/kbuild/kconfig.txt for info
> on KCONFIG_ALLCONFIG.  Basically it allows you to tell kconfig values for
> a subset of config symbols to be used.

Ok, but at present is not working properly, as expected. The scripts now 
are like this, I returned to randomizing with bash:

--- try-build.sh

#!/bin/bash

RCPT=phz@localhost
CPUCNT=$(cat /proc/cpuinfo | grep ^processor | wc -l)

function tidy(){
   rm ../results/.config 2>/dev/null
   rm ../results/build.log 2>/dev/null
   rm ../BUILDING-NOW 2>/dev/null
}

cd ~/kernel/linux
if test -f ../BUILDING-NOW ; then
   exit 0
else
   touch ../BUILDING-NOW
   make mrproper
   cat ../config.all | ../randomize-conf2.sh > ./.config
   make oldconfig
   cp .config ../results/
   DT=$(date +%y%m%d-%H%M%S)	
   make -j $CPUCNT vmlinux 2>&1 | tee ../results/build.log
   if test $? -ne 0 ; then
     (cat ../results/.config && cat ../results/build.log) | mail -s 
'Build failed at kernel phase' $RCPT
     mv ../results/.config ../results/.config.kf.$DT
     mv ../results/build.log ../results/build.log.$DT
     tidy
     exit 0
   fi
   make -j $CPUCNT modules 2>&1 | tee -a ../results/build.log
   if test $? -ne 0 ; then
     (cat ../results/.config && cat ../results/build.log) | mail -s 
'Build failed at modules phase' $RCPT
     mv ../results/.config ../results/.config.mf.$DT
     mv ../results/build.log ../results/build.log.$DT
     tidy
     exit 0
   fi
   cp ../results/build.log ./
   rm BUILDING-NOW
   echo OK | mail -s 'ok' $RCPT
   tidy

fi


--- randomize-conf2.sh:

#!/bin/bash

NETENABLED=0
function enable_or_not(){
   if test $RANDOM -lt 16383 ; then
     if test $1=CONFIG_NET ; then
       NETENABLED=1
       echo $1=y
       return
     fi
     if test $1=CONFIG_INET && test $NETENABLED -eq 1 ; then
       if test $RANDOM -lt 16383 ; then
         echo $1=y
       else
         echo '# '$1' is not set'
       fi
       return
     fi
   else
     echo '# '$1' is not set'
   fi
}

cat ../config.all | grep -v CONFIG_SMP | grep -v CONFIG_SYSFS | grep -v 
CONFIG_PROC_FS | grep -v CONFIG_PM | grep -v CONFIG_PCI | grep -v 
CONFIG_BLOCK | grep -v CONFIG_NET | grep -v CONFIG_INET | grep -v 
CONFIG_HOTPLUG > ./cfg.tmp

(
enable_or_not CONFIG_SMP
enable_or_not CONFIG_SYSFS
enable_or_not CONFIG_PROC_FS
enable_or_not CONFIG_PM
enable_or_not CONFIG_PCI
enable_or_not CONFIG_BLOCK
enable_or_not CONFIG_NET
enable_or_not CONFIG_INET
enable_or_not CONFIG_HOTPLUG
)
cat ./cfg.tmp

I launch try-build.sh, but it still asks me about unspecified options, 
my config.all is produced by make defconfig or make oldconfig, dosen't 
matter still.

Do you see what the problem is?


-- 
Z cyklu "Uroki demokracji", czyli pytania i odpowiedzi w teledurniejach:
- Ile kó³ ma trójko³owiec?
- Dwa.
NP: Miles Davis and John Coltrane - Two Bass Hit
NB: 2.6.34-rc2-nx-20100325-next-20100325+
