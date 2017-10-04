Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:20491 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbdJDE3K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 00:29:10 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix dependency of dtbs targets
Date: Wed,  4 Oct 2017 13:27:20 +0900
Message-Id: <1507091240-12756-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ley Foon Tan <lftan@altera.com>, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, nios2-dev@lists.rocketboards.org, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org

The target "dtbs" should depend on "scripts" because it needs to
build dtc.  The "prepare" target is unneeded here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/Makefile   | 2 +-
 arch/arm64/Makefile | 2 +-
 arch/nios2/Makefile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 47d3a1a..cdb5b55 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -342,7 +342,7 @@ $(INSTALL_TARGETS):
 
 PHONY += dtbs dtbs_install
 
-dtbs: prepare scripts
+dtbs: scripts
 	$(Q)$(MAKE) $(build)=$(boot)/dts
 
 dtbs_install:
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 939b310..fd56fbc 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -133,7 +133,7 @@ zinstall install:
 
 PHONY += dtbs dtbs_install
 
-dtbs: prepare scripts
+dtbs: scripts
 	$(Q)$(MAKE) $(build)=$(boot)/dts
 
 dtbs_install:
diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index 8673a79..abc3f5b 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -61,7 +61,7 @@ archclean:
 %.dtb: | scripts
 	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
 
-dtbs:
+dtbs: scripts
 	$(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
 
 $(BOOT_TARGETS): vmlinux
-- 
2.7.4

