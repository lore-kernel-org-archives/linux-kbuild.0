Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:51524 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750747AbcJXRdX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2016 13:33:23 -0400
From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
References: <20161021111600.9417-1-bigeasy@linutronix.de>
        <20161021212127.GA32611@angband.pl> <87eg37niky.fsf@turtle.gmx.de>
        <1477250598.3561.4.camel@perches.com> <8760oinqly.fsf@turtle.gmx.de>
        <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
Date: Mon, 24 Oct 2016 19:32:30 +0200
In-Reply-To: <20161024074332.uomcxyhqo6aq7vxk@linutronix.de> (Sebastian
        Andrzej Siewior's message of "Mon, 24 Oct 2016 09:43:32 +0200")
Message-ID: <874m41mz4h.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

--=-=-=
Content-Type: text/plain

On 2016-10-24 09:43 +0200, Sebastian Andrzej Siewior wrote:

> On 2016-10-24 09:38:49 [+0200], Sven Joachim wrote:
>> 
>> But make still fails with it. :-(
>
> try setting CONFIG_CC_STACKPROTECTOR_NONE=y and please let me know if
> the resulting kernel built with v3.2 gcc boots & works.

Sorry, I don't have gcc 3.2 around, and my gcc 3.3 environment produces
assembler errors in arch/x86/entry/entry_32.S.  Maybe binutils 2.15 is
not recent enough anymore?

Anyway, with CONFIG_CC_STACKPROTECTOR=y it is necessary to add -fno-pie
in scripts/gcc-x86_64-has-stack-protector.sh as well, because that
script invokes the compiler without KBUILD_CFLAGS.  That's probably not
a problem since -fstack-protector is newer than -fno-pie.  The attached
patch works for me with Debian's gcc-6 package.

Cheers,
       Sven


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0001-kbuild-add-fno-pie-to-KBUILD_CFLAGS.patch

From 2c72542688476168920c027cdc28c6764387ecac Mon Sep 17 00:00:00 2001
From: Sven Joachim <svenjoac@gmx.de>
Date: Mon, 24 Oct 2016 18:17:26 +0200
Subject: [PATCH] kbuild: add -fno-pie to KBUILD_CFLAGS

If GCC is configured with --enable-default-pie, the build fails early
because this default is incompatible with -mcmodel=kernel.

kernel/bounds.c:1:0: error: code model kernel does not support PIC mode

Avoid that by adding -fno-pie to KBUILD_CFLAGS, if supported by the
compiler.  This flag is also needed in the x86_64 stack-protector test
script which otherwise errors out.

Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: -fstack-protector-strong available but compiler is broken

See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=841420 and
https://bugs.launchpad.net/ubuntu/+source/gcc-defaults/+bug/1574982.

Signed-off-by: Sven Joachim <svenjoac@gmx.de>
---
 Makefile                                  | 1 +
 scripts/gcc-x86_64-has-stack-protector.sh | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 93beca4..81ef816 100644
--- a/Makefile
+++ b/Makefile
@@ -619,6 +619,7 @@ ARCH_AFLAGS :=
 ARCH_CFLAGS :=
 include arch/$(SRCARCH)/Makefile
 
+KBUILD_CFLAGS	+= $(call cc-option,-fno-pie,)
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
diff --git a/scripts/gcc-x86_64-has-stack-protector.sh b/scripts/gcc-x86_64-has-stack-protector.sh
index 973e8c1..274cba1 100755
--- a/scripts/gcc-x86_64-has-stack-protector.sh
+++ b/scripts/gcc-x86_64-has-stack-protector.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -O0 -mcmodel=kernel -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
+echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -O0 -mcmodel=kernel -fno-pie -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
 if [ "$?" -eq "0" ] ; then
 	echo y
 else
-- 
2.10.1


--=-=-=--
