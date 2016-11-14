Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:59564 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933275AbcKNSvd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Nov 2016 13:51:33 -0500
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] kbuild: Steal gcc's pie from the very beginning
Date: Mon, 14 Nov 2016 19:51:30 +0100
Message-Id: <20161114185130.30641-1-bp@alien8.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

From: Borislav Petkov <bp@suse.de>

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

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 3ff1fb26d8b2..5558cc5b1505 100644
--- a/Makefile
+++ b/Makefile
@@ -399,11 +399,12 @@ KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
-		   -std=gnu89
+		   -std=gnu89 -fno-PIE
+
 
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
-KBUILD_AFLAGS   := -D__ASSEMBLY__
+KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
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

