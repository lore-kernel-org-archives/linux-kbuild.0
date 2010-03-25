Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:42218 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751868Ab0CYWEQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Mar 2010 18:04:16 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 25 Mar 2010 15:04:13 -0700
Message-ID: <4BABDDD3.4040803@xenotime.net>
Date: Thu, 25 Mar 2010 15:04:03 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net> <20100318084012.0cca4b6a.rdunlap@xenotime.net> <4BAB9D7F.8020506@xenotime.net> <4BAB9F75.3000004@example.com> <4BABA027.6080900@xenotime.net> <4BABA206.9040205@example.com> <4BABA33D.1080903@xenotime.net> <4BABACE9.8000405@example.com>
In-Reply-To: <4BABACE9.8000405@example.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On 03/25/10 11:35, Piotr Hosowicz wrote:

>>>>>>> One thing that you could do that no one focuses on is building
>>>>>>> with some kconfig symbols disabled (ones that are typically
>>>>>>> enabled),
>>>>>>> such as CONFIG_SMP=n, CONFIG_SYSFS=n, CONFIG_PROC_FS=n, CONFIG_PM=n,
>>>>>>> CONFIG_PCI=n, CONFIG_BLOCK=n, CONFIG_NET=n, CONFIG_INET=n (but
>>>>>>> latter
>>>>>>> with CONFIG_NET=y), CONFIG_HOTPLUG=n.  Not all of these at the same
>>>>>>> time,
>>>>>>> just various/random combinations of them.
>>>>>> and CONFIG_SYSRQ=n  (just found some errors due to this one)
>>>>> You mean CONFIG_SYSRQ=n exactly and mandatory in every config or this
>>>>> was just an example?
>>>> Sorry about that.  Just make it random (sometimes disabled).

The config symbol above should be CONFIG_MAGIC_SYSRQ.


> Ok, but at present is not working properly, as expected. The scripts now
> are like this, I returned to randomizing with bash:
> 
> --- try-build.sh
> 
> #!/bin/bash
> 
> RCPT=phz@localhost
> CPUCNT=$(cat /proc/cpuinfo | grep ^processor | wc -l)
> 
> function tidy(){
>   rm ../results/.config 2>/dev/null
>   rm ../results/build.log 2>/dev/null
>   rm ../BUILDING-NOW 2>/dev/null
> }
> 
> cd ~/kernel/linux
> if test -f ../BUILDING-NOW ; then
>   exit 0
> else
>   touch ../BUILDING-NOW
>   make mrproper
>   cat ../config.all | ../randomize-conf2.sh > ./.config
>   make oldconfig

I am using:
    yes '' | make oldconfig

>   cp .config ../results/
>   DT=$(date +%y%m%d-%H%M%S)   
>   make -j $CPUCNT vmlinux 2>&1 | tee ../results/build.log
>   if test $? -ne 0 ; then
>     (cat ../results/.config && cat ../results/build.log) | mail -s
> 'Build failed at kernel phase' $RCPT
>     mv ../results/.config ../results/.config.kf.$DT
>     mv ../results/build.log ../results/build.log.$DT
>     tidy
>     exit 0
>   fi
>   make -j $CPUCNT modules 2>&1 | tee -a ../results/build.log
>   if test $? -ne 0 ; then
>     (cat ../results/.config && cat ../results/build.log) | mail -s
> 'Build failed at modules phase' $RCPT
>     mv ../results/.config ../results/.config.mf.$DT
>     mv ../results/build.log ../results/build.log.$DT
>     tidy
>     exit 0
>   fi
>   cp ../results/build.log ./
>   rm BUILDING-NOW
>   echo OK | mail -s 'ok' $RCPT
>   tidy
> 
> fi
> 
> 
> --- randomize-conf2.sh:
> 
> #!/bin/bash
> 
> NETENABLED=0
> function enable_or_not(){
>   if test $RANDOM -lt 16383 ; then
>     if test $1=CONFIG_NET ; then
>       NETENABLED=1
>       echo $1=y
>       return
>     fi
>     if test $1=CONFIG_INET && test $NETENABLED -eq 1 ; then
>       if test $RANDOM -lt 16383 ; then
>         echo $1=y
>       else
>         echo '# '$1' is not set'
>       fi
>       return
>     fi
>   else
>     echo '# '$1' is not set'
>   fi
> }
> 
> cat ../config.all | grep -v CONFIG_SMP | grep -v CONFIG_SYSFS | grep -v
> CONFIG_PROC_FS | grep -v CONFIG_PM | grep -v CONFIG_PCI | grep -v
> CONFIG_BLOCK | grep -v CONFIG_NET | grep -v CONFIG_INET | grep -v
> CONFIG_HOTPLUG > ./cfg.tmp

Note that these grep -v's drop any config that contains CONFIG_whatever,
such as CONFIG_PCI_QUIRKS.  If you just want to drop those config
symbols and no others, I guess you would add "-w" to the grep command.

> 
> (
> enable_or_not CONFIG_SMP
> enable_or_not CONFIG_SYSFS
> enable_or_not CONFIG_PROC_FS
> enable_or_not CONFIG_PM
> enable_or_not CONFIG_PCI
> enable_or_not CONFIG_BLOCK
> enable_or_not CONFIG_NET
> enable_or_not CONFIG_INET
> enable_or_not CONFIG_HOTPLUG
> )
> cat ./cfg.tmp
> 
> I launch try-build.sh, but it still asks me about unspecified options,
> my config.all is produced by make defconfig or make oldconfig, dosen't
> matter still.
> 
> Do you see what the problem is?

It's working for me just be using
  yes '' | make oldconfig


-- 
~Randy
