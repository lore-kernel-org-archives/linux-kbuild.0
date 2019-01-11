Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:56672 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbfAKDZy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jan 2019 22:25:54 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] powerpc: remove redundant header search path additions
Date: Fri, 11 Jan 2019 12:22:32 +0900
Message-Id: <1547176954-17739-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
References: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org

The same path -Iarch/$(ARCH) is passed to KBUILD_CPPFLAGS,
KBUILD_AFLAGS, and KBUILD_CFLAGS.

As you see in scripts/Makefile.lib, KBUILD_CPPFLAGS is passed
to c_flags and a_flags as well.

Passing it to KBUILD_CPPFLAGS is enough.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/powerpc/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 488c9ed..ac03334 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -213,9 +213,9 @@ endif
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
 KBUILD_CPPFLAGS	+= -Iarch/$(ARCH) $(asinstr)
-KBUILD_AFLAGS	+= -Iarch/$(ARCH) $(AFLAGS-y)
+KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
-KBUILD_CFLAGS	+= -pipe -Iarch/$(ARCH) $(CFLAGS-y)
+KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
 CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
-- 
2.7.4
