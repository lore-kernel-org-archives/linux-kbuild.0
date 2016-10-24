Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:65469 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932235AbcJXHjQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2016 03:39:16 -0400
From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
References: <20161021111600.9417-1-bigeasy@linutronix.de>
        <20161021212127.GA32611@angband.pl> <87eg37niky.fsf@turtle.gmx.de>
        <1477250598.3561.4.camel@perches.com>
Date: Mon, 24 Oct 2016 09:38:49 +0200
In-Reply-To: <1477250598.3561.4.camel@perches.com> (Joe Perches's message of
        "Sun, 23 Oct 2016 12:23:18 -0700")
Message-ID: <8760oinqly.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Adam Borowski <kilobyte@angband.pl>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On 2016-10-23 12:23 -0700, Joe Perches wrote:

> On Sun, 2016-10-23 at 18:19 +0200, Sven Joachim wrote:
>> On 2016-10-21 23:21 +0200, Adam Borowski wrote:
>> > On Fri, Oct 21, 2016 at 01:16:00PM +0200, Sebastian Andrzej Siewior wrote:
>> > > Debian started to build the gcc with --enable-default-pie by default
> []
>> > > diff --git a/Makefile b/Makefile
> []
>> > > @@ -398,7 +398,7 @@ KBUILD_CPPFLAGS := -D__KERNEL__
>> > >  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>> > >  		   -fno-strict-aliasing -fno-common \
>> > >  		   -Werror-implicit-function-declaration \
>> > > -		   -Wno-format-security \
>> > > +		   -Wno-format-security -fno-PIE \
>> > >  		   -std=gnu89
>
> I've used this here instead:
>
> KBUILD_CFLAGS  += $(call cc-option,-fno-pie)

Where exactly do you set that?  I tried this patch:

--8<---------------cut here---------------start------------->8---
diff --git a/Makefile b/Makefile
index 93beca4..fde1e21 100644
--- a/Makefile
+++ b/Makefile
@@ -619,6 +619,7 @@ ARCH_AFLAGS :=
 ARCH_CFLAGS :=
 include arch/$(SRCARCH)/Makefile
 
+KBUILD_CFLAGS	+= $(call cc-option,-fno-pie,)
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
--8<---------------cut here---------------end--------------->8---

But make still fails with it. :-(

,----
| $ LANG=C make      
| scripts/kconfig/conf  --silentoldconfig Kconfig
|   SYSTBL  arch/x86/entry/syscalls/../../include/generated/asm/syscalls_32.h
|   SYSHDR  arch/x86/entry/syscalls/../../include/generated/asm/unistd_32_ia32.h
|   SYSHDR  arch/x86/entry/syscalls/../../include/generated/asm/unistd_64_x32.h
|   SYSTBL  arch/x86/entry/syscalls/../../include/generated/asm/syscalls_64.h
|   SYSHDR  arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_32.h
|   SYSHDR  arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_64.h
|   SYSHDR  arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_x32.h
|   HOSTCC  arch/x86/tools/relocs_32.o
|   HOSTCC  arch/x86/tools/relocs_64.o
|   HOSTCC  arch/x86/tools/relocs_common.o
|   HOSTLD  arch/x86/tools/relocs
|   CHK     include/config/kernel.release
|   UPD     include/config/kernel.release
| Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong available but compiler is broken
| Makefile:1066: recipe for target 'prepare-compiler-check' failed
| make: *** [prepare-compiler-check] Error 1
`----

Cheers,
       Sven
