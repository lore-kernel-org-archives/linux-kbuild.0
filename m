Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-05.nifty.com ([202.248.20.70]:63170 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388791AbeLVQyX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Dec 2018 11:54:23 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kbuild: remove $(obj)/ prefixes in ./Kbuild
Date: Sat, 22 Dec 2018 18:50:35 +0900
Message-Id: <1545472235-12782-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545472235-12782-1-git-send-email-yamada.masahiro@socionext.com>
References: <1545472235-12782-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Adding $(obj)/ to file paths relative from the top objtree looks
a bit redundant to me. This commit has no functional change since
$(obj) is '.' in this file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Kbuild | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Kbuild b/Kbuild
index b24210c..03cb8ed 100644
--- a/Kbuild
+++ b/Kbuild
@@ -16,7 +16,7 @@ bounds-file := include/generated/bounds.h
 always  := $(bounds-file)
 targets := kernel/bounds.s
 
-$(obj)/$(bounds-file): kernel/bounds.s FORCE
+$(bounds-file): kernel/bounds.s FORCE
 	$(call filechk,offsets,__LINUX_BOUNDS_H__)
 
 #####
@@ -34,7 +34,7 @@ define filechk_gentimeconst
 	(echo $(CONFIG_HZ) | bc -q $< )
 endef
 
-$(obj)/$(timeconst-file): kernel/time/timeconst.bc FORCE
+$(timeconst-file): kernel/time/timeconst.bc FORCE
 	$(call filechk,gentimeconst)
 
 #####
@@ -46,9 +46,9 @@ offsets-file := include/generated/asm-offsets.h
 always  += $(offsets-file)
 targets += arch/$(SRCARCH)/kernel/asm-offsets.s
 
-arch/$(SRCARCH)/kernel/asm-offsets.s: $(obj)/$(timeconst-file) $(obj)/$(bounds-file)
+arch/$(SRCARCH)/kernel/asm-offsets.s: $(timeconst-file) $(bounds-file)
 
-$(obj)/$(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
+$(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
 	$(call filechk,offsets,__ASM_OFFSETS_H__)
 
 #####
@@ -70,7 +70,7 @@ missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
 
 extra-$(CONFIG_GDB_SCRIPTS) += build_constants_py
 
-build_constants_py: $(obj)/$(timeconst-file) $(obj)/$(bounds-file)
+build_constants_py: $(timeconst-file) $(bounds-file)
 	@$(MAKE) $(build)=scripts/gdb/linux $@
 
 # Keep these three files during make clean
-- 
2.7.4
