Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm19-vm1.access.bullet.mail.gq1.yahoo.com ([216.39.63.17]:34474
	"EHLO nm19-vm1.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752183Ab3ISWfJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Sep 2013 18:35:09 -0400
Message-ID: <523B7C38.8050609@att.net>
Date: Thu, 19 Sep 2013 17:35:36 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] scripts: Add mkstrerror.sh
References: <1379459317-13046-2-git-send-email-daniel.santos@pobox.com> <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <29168.1379504300@warthog.procyon.org.uk>
In-Reply-To: <29168.1379504300@warthog.procyon.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Daniel Santos <daniel.santos@pobox.com>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On 09/18/2013 06:38 AM, David Howells wrote:
> danielfsantos@att.net wrote:
>
>> This is a simple bash script that parses our errno*.h files and formats
>> them into the error_strings.h header that our strerror and strerror_name
>> functions will use later.
> I presume you haven't tried building with a "make O=foo" build directory?  I
> see:
>
>        /bin/sh: /data/fs/linux-2.6-fscache/include/generated/error_strings.h: No such file or directory
>
> when I try it.

Hmm, I cannot reproduce the error. :( I'm using next-20130919 currently 
(x86_64), and if I try to just "make O=lib" it fails w/o my patches.  
The only file that should depend upon error_strings.h is lib/string.c.

/home/daniel/proj/kernel/git
(daniel@loudmouth)$ make mrproper -j4
/home/daniel/proj/kernel/git
(daniel@loudmouth)$ make defconfig -j4
   HOSTCC  scripts/basic/fixdep
   HOSTCC  scripts/kconfig/conf.o
   SHIPPED scripts/kconfig/zconf.tab.c
   SHIPPED scripts/kconfig/zconf.lex.c
   SHIPPED scripts/kconfig/zconf.hash.c
   HOSTCC  scripts/kconfig/zconf.tab.o
   HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#
/home/daniel/proj/kernel/git
(daniel@loudmouth)$ make O=lib -j4
   HOSTCC  scripts/basic/fixdep
   HOSTCC  scripts/kconfig/conf.o
   HOSTCC  scripts/kconfig/zconf.tab.o
   HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --silentoldconfig Kconfig
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
make[3]: *** [silentoldconfig] Error 1
make[2]: *** [silentoldconfig] Error 2
make[2]: Nothing to be done for `all'.
make[1]: *** No rule to make target `include/config/auto.conf', needed 
by `include/config/kernel.release'.  Stop.
make[1]: *** Waiting for unfinished jobs....
make: *** [sub-make] Error 2

Is this some other subtle bug currently in -next or are you just 
supposed to run "make prepare" first? I injected the generation of 
error_names.h as a dependency of prepare1 (rightly or wrongly).  I'm 
still studying the kbuild process to try to find a better place for it 
or to at least clean up the way it's generated.

Daniel
