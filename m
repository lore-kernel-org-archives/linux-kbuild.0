Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:59497 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932297AbcKNUpc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Nov 2016 15:45:32 -0500
Date: Mon, 14 Nov 2016 21:45:29 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH -v1.1] kbuild: Steal gcc's pie from the very beginning
Message-ID: <20161114204529.sqn6z2bockmhxpfz@pd.tnic>
References: <20161114185130.30641-1-bp@alien8.de>
 <20161114201457.qsevfvn465otwfvz@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161114201457.qsevfvn465otwfvz@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.com>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>, +@pd.tnic

On Mon, Nov 14, 2016 at 09:14:57PM +0100, Sebastian Andrzej Siewior wrote:
> This also means that all feature tests fail unless the -fno-PIE is
> there.
> 
> Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> This thing gcc v3.4 only but I intend to update the min requirement to
> alteast gcc v3.4 to cover this. As per hpa gcc v3.4 is the lowest
> version should be used for x86…

Ah yes, here's a v1.1.

Let's leave the cc-option check until we sort out the min supported
gcc version.

CC: stable too.

Thanks!

---
From: Borislav Petkov <bp@suse.de>
Date: Mon, 14 Nov 2016 19:41:31 +0100
Subject: [PATCH] kbuild: Steal gcc's pie from the very beginning

So Sebastian turned off the PIE for kernel builds but that was too late
- Kbuild.include already uses KBUILD_CFLAGS and trying to disable gcc
options with, say cc-disable-warning, fails:

  gcc -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
  ...
  -Wno-sign-compare -fno-asynchronous-unwind-tables -Wframe-address -c -x c /dev/null -o .31392.tmp
  /dev/null:1:0: error: code model kernel does not support PIC mode

because that returns an error and we can't disable the warning. For
example in this case:

KBUILD_CFLAGS   += $(call cc-disable-warning,frame-address,)

which leads to gcc issuing all those warnings again.

So let's turn off PIE/PIC at the earliest possible moment, when we
declare KBUILD_CFLAGS so that cc-disable-warning picks it up too.

Also, we need the $(call cc-option ...) because -fno-PIE is supported
since gcc v3.4 and our lowest supported gcc version is 3.2 right now.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: stable@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 3ff1fb26d8b2..9bc877d073d7 100644
--- a/Makefile
+++ b/Makefile
@@ -399,11 +399,12 @@ KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
-		   -std=gnu89
+		   -std=gnu89 $(call cc-option,-fno-PIE)
+
 
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
-KBUILD_AFLAGS   := -D__ASSEMBLY__
+KBUILD_AFLAGS   := -D__ASSEMBLY__ $(call cc-option,-fno-PIE)
 KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
 KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
@@ -621,8 +622,6 @@ include arch/$(SRCARCH)/Makefile
 
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
-KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
-KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
 
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
 KBUILD_CFLAGS	+= $(call cc-option,-ffunction-sections,)
-- 
2.10.0

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
