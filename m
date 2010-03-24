Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:36790 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752033Ab0CXVnJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Mar 2010 17:43:09 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 24 Mar 2010 14:43:06 -0700
Message-ID: <4BAA8769.3080907@xenotime.net>
Date: Wed, 24 Mar 2010 14:43:05 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net> <20100318084012.0cca4b6a.rdunlap@xenotime.net> <4BA6E49F.3070008@example.com> <4BA6E87D.2030405@xenotime.net> <4BA765B8.5010808@example.com> <4BA76852.8000506@example.com> <4BA966FF.2080903@example.com>
In-Reply-To: <4BA966FF.2080903@example.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On 03/23/10 18:12, Piotr Hosowicz wrote:
> Piotr Hosowicz wrote:
> 
>> But it seems that it works, but I do not understand why. Needs rewrite,
>> better config template line parsing.
> 
> I made it with Python, the scripts follow:

Thanks for sharing them.

> --- main try-build.sh
> 
> #!/bin/bash
> 
> RCPT=phz@localhost
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
>   cat ../config.all | ../randomize-conf.py > ./.config
>   make prepare
>   cp .config ../results/
>   make -j 10 2>&1 > ../results/build.log

'make' with no target also builds modules, so the 'make modules'
below isn't needed (it's extra work).

>   if test $? -ne 0 ; then
>     (cat ../results/.config && cat ../results/build.log) | mail -s
> 'Build failed at kernel phase' $RCPT
>     mv ../results/.config ../results/.config.kf.$(date +%y%m%d-%H%M%S)
>     tidy
>     exit 0
>   fi
>   make -j 10 modules 2>&1 >> ../results/build.log
>   if test $? -ne 0 ; then
>     (cat ../results/.config && cat ../results/build.log) | mail -s
> 'Build failed at modules phase' $RCPT
>     mv ../results/.config ../results/.config.mf.$(date +%y%m%d-%H%M%S)
>     tidy
>     exit 0
>   fi
>   echo OK | mail -s 'ok' $RCPT
>   tidy
> fi
> 
> --- the randomizer:
> 
> #!/usr/bin/python
> 
> import sys
> import re
> import random
> 
> netenabled = 0
> token = ""
> 
> def yesno():
>     if random.random()>0.5:
>         return 1
>     else:
>         return 0
> 
> 
> def enable_or_not(atoken):
>     if yesno():
>         if atoken=="CONFIG_NET":
>             netenabled = 1
>             print atoken+"=y"
>         else:
>             if atoken=="CONFIG_INET":
>                 if yesno():
>                     print atoken+"=y"
>                 else:
>                     print "# "+atoken+" is not set" ;
>             else:
>                 print atoken+"=y"
>     else:
>         print "# "+atoken+" is not set" ;
> 
> switch = {
>     "CONFIG_SMP": enable_or_not("CONFIG_SMP"),
>     "CONFIG_SYSFS": enable_or_not("CONFIG_SYSFS"),
>     "CONFIG_PROC_FS": enable_or_not("CONFIG_PROC_FS"),
>     "CONFIG_PM": enable_or_not("CONFIG_PM"),
>     "CONFIG_PCI": enable_or_not("CONFIG_PCI"),
>     "CONFIG_BLOCK": enable_or_not("CONFIG_BLOCK"),
>     "CONFIG_NET": enable_or_not("CONFIG_NET"),
>     "CONFIG_INET": enable_or_not("CONFIG_INET"),
>     "CONFIG_HOTPLUG": enable_or_not("CONFIG_HOTPLUG")
>     }
> 
> for line in sys.stdin:
>     mo = re.match("(\w+)=(.*)", line)
>     if mo:
>         token = mo.group(1)
>     else:
>         mo = re.match("# (\w+) is not set", line)
>         if mo:
>             token = mo.group(1)
>     if token!="CONFIG_MODULES":
>         switch.get(token, enable_or_not(token))
>     else:
>         sys.stdout.write("CONFIG_MODULES=y\n")
> 
> 


-- 
~Randy
