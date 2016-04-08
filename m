Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:26300 "EHLO
	conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751495AbcDHCQh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Apr 2016 22:16:37 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: drop redundant "PHONY += FORCE"
Date: Fri,  8 Apr 2016 11:16:10 +0900
Message-Id: <1460081770-29437-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Fenghua Yu <fenghua.yu@intel.com>, linux-arm-kernel@lists.infradead.org

"PHONY += FORCE" is already cared by scripts/Makefile.build,
which these files are included from.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Please apply the following to avoid conflicts.
https://patchwork.kernel.org/patch/8572451/


 arch/arm/boot/bootp/Makefile | 2 +-
 arch/ia64/Makefile           | 2 +-
 arch/unicore32/boot/Makefile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/bootp/Makefile b/arch/arm/boot/bootp/Makefile
index 52a543b..5e4acd2 100644
--- a/arch/arm/boot/bootp/Makefile
+++ b/arch/arm/boot/bootp/Makefile
@@ -25,4 +25,4 @@ $(obj)/kernel.o: arch/arm/boot/zImage FORCE
 
 $(obj)/initrd.o: $(INITRD) FORCE
 
-PHONY += $(INITRD) FORCE
+PHONY += $(INITRD)
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 648f1ce..c100d78 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -96,7 +96,7 @@ define archhelp
 endef
 
 archprepare: make_nr_irqs_h
-PHONY += make_nr_irqs_h FORCE
+PHONY += make_nr_irqs_h
 
 make_nr_irqs_h:
 	$(Q)$(MAKE) $(build)=arch/ia64/kernel include/generated/nr-irqs.h
diff --git a/arch/unicore32/boot/Makefile b/arch/unicore32/boot/Makefile
index ec7fb70..8288550 100644
--- a/arch/unicore32/boot/Makefile
+++ b/arch/unicore32/boot/Makefile
@@ -31,7 +31,7 @@ $(obj)/uImage: $(obj)/zImage FORCE
 	$(call if_changed,uimage)
 	@echo '  Image $@ is ready'
 
-PHONY += initrd FORCE
+PHONY += initrd
 initrd:
 	@test "$(INITRD)" != "" || \
 	(echo You must specify INITRD; exit -1)
-- 
1.9.1

