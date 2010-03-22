Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 26.mail-out.ovh.net ([91.121.27.225]:54341 "HELO
	26.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754063Ab0CVDi2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 21 Mar 2010 23:38:28 -0400
Message-ID: <4BA6E49F.3070008@example.com>
Date: Mon, 22 Mar 2010 04:31:43 +0100
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net> <20100318084012.0cca4b6a.rdunlap@xenotime.net>
In-Reply-To: <20100318084012.0cca4b6a.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:

> One thing that you could do that no one focuses on is building
> with some kconfig symbols disabled (ones that are typically enabled),
> such as CONFIG_SMP=n, CONFIG_SYSFS=n, CONFIG_PROC_FS=n, CONFIG_PM=n,
> CONFIG_PCI=n, CONFIG_BLOCK=n, CONFIG_NET=n, CONFIG_INET=n (but latter
> with CONFIG_NET=y), CONFIG_HOTPLUG=n.  Not all of these at the same time,
> just various/random combinations of them.

I am glad I can help. At last I sat down to write the scripts, I was so 
excited I couldn't fall asleep ;-). I figured it out in such a way:

- separate system user for building
- in his crontab everyminute a build try starts with randomized options 
you mentioned - this works, I hope

The problem is that it requires my assistance, because it asks a few 
questions like in make oldconfig when there are new options available. I 
do not know how to fix this.

Here are the scripts:

# randomize-conf.sh

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
         echo '# CONFIG_'$1' is not set'
       fi
       return
     fi
   else
     echo '# CONFIG_'$1' is not set'
   fi
}

while read LINE ; do
   FIRST=$(echo $LINE | cut -d '=' -f 1)
   case $FIRST in
     CONFIG_SMP)
       enable_or_not CONFIG_SMP
     ;;
     CONFIG_SYSFS)
       enable_or_not CONFIG_SYSFS
     ;;
     CONFIG_PROC_FS)
       enable_or_not CONFIG_PROC_FS
     ;;
     CONFIG_PM)
       enable_or_not CONFIG_PM
     ;;
     CONFIG_PCI)
       enable_or_not CONFIG_PCI
     ;;
     CONFIG_BLOCK)
       enable_or_not CONFIG_BLOCK
     ;;
     CONFIG_NET)
       enable_or_not CONFIG_NET
     ;;
     CONFIG_INET)
       enable_or_not CONFIG_INET
     ;;
     CONFIG_HOTPLUG)
       enable_or_not CONFIG_HOTPLUG
     ;;
     *)
       echo $LINE
   esac
done

# try-build.sh

#!/bin/bash

RCPT=phz@localhost

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
   cat ../config.all | ../randomize-conf.sh > ./.config
   make prepare
   cp .config ../results/
   make -j 10 2>&1 > ../results/build.log
   if test $? -ne 0 ; then
     (cat ../results/.config && cat ../results/build.log) | mail -s 
'Build failed at kernel phase' $RCPT
     mv ../results/.config ../results/.config.kf.$(date +%y%m%d-%H%M%S)
     tidy
     exit 0
   fi
   make -j 10 modules 2>&1 >> ../results/build.log
   if test $? -ne 0 ; then
     (cat ../results/.config && cat ../results/build.log) | mail -s 
'Build failed at modules phase' $RCPT
     mv ../results/.config ../results/.config.mf.$(date +%y%m%d-%H%M%S)
     tidy
     exit 0
   fi
   echo OK | mail -s 'ok' $RCPT
   tidy
fi



-- 
TV: "Rosjanki osi±gnê³y szczyt w niew³a¶ciwym miejscu, w
niew³a¶ciwym czasie i w³a¶ciwie zupe³nie niepotrzebnie."
NP: Mark Knopfler - Hard Shoulder
NB: 2.6.34-rc1-git9-a
