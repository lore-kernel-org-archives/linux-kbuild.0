Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:56399 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbeGLILp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 04:11:45 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/6] ARM: vfp: clean-up arch/arm/vfp/Makefile
Date: Thu, 12 Jul 2018 17:01:32 +0900
Message-Id: <1531382496-3719-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
References: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, x86@kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Jeff Dike <jdike@addtoit.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Masahiro Yamada <yamada.masahiro@socionext.com>

Since commit 799c43415442 ("kbuild: thin archives make default for
all archs"), $(AR) is used instead of $(LD) to combine object files.

  LDFLAGS         +=--no-warn-mismatch

... is unused code now.

arch/arm/Makefile already guards arch/arm/vfp/ by a boolean symbol,
CONFIG_VFP, like this:

  core-$(CONFIG_VFP)              += arch/arm/vfp/

..., so $(CONFIG_VFP) is always evaluated to y in arch/arm/vfp/Makefile.

Also, there is no point to use pseudo object, vfp.o, which never becomes
a module.  Add all objects directly to obj-y.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/vfp/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/vfp/Makefile b/arch/arm/vfp/Makefile
index a81404c..94516c4 100644
--- a/arch/arm/vfp/Makefile
+++ b/arch/arm/vfp/Makefile
@@ -8,8 +8,5 @@
 # asflags-y := -DDEBUG
 
 KBUILD_AFLAGS	:=$(KBUILD_AFLAGS:-msoft-float=-Wa,-mfpu=softvfp+vfp -mfloat-abi=soft)
-LDFLAGS		+=--no-warn-mismatch
 
-obj-y			+= vfp.o
-
-vfp-$(CONFIG_VFP)	+= vfpmodule.o entry.o vfphw.o vfpsingle.o vfpdouble.o
+obj-y		+= vfpmodule.o entry.o vfphw.o vfpsingle.o vfpdouble.o
-- 
2.7.4

