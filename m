Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:64073 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbeHDGsX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Aug 2018 02:48:23 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] um: clean up archheaders recipe
Date: Sat,  4 Aug 2018 13:47:03 +0900
Message-Id: <1533358023-5801-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
References: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Now that '%asm-generic' is added to no-dot-config-targets,
'make asm-generic' does not include the kernel configuration.

You can simply do 'make asm-generic' in the recursed top Makefile
without bothering syncconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/um/Makefile | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index de340e4..1a47f9c 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -116,13 +116,7 @@ endef
 KBUILD_KCONFIG := $(HOST_DIR)/um/Kconfig
 
 archheaders:
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
-	            kbuild-file=$(HOST_DIR)/include/asm/Kbuild \
-		    obj=$(HOST_DIR)/include/generated/asm
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
-	            kbuild-file=$(HOST_DIR)/include/uapi/asm/Kbuild \
-		    obj=$(HOST_DIR)/include/generated/uapi/asm
-	$(Q)$(MAKE) -f $(srctree)/Makefile ARCH=$(HEADER_ARCH) archheaders
+	$(Q)$(MAKE) -f $(srctree)/Makefile ARCH=$(HEADER_ARCH) asm-generic archheaders
 
 archprepare: include/generated/user_constants.h
 
-- 
2.7.4

