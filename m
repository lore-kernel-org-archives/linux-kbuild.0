Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:26153 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbeLEHil (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 02:38:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: exploit parallel building for CONFIG_HEADERS_CHECK
Date: Wed,  5 Dec 2018 16:38:35 +0900
Message-Id: <1543995515-25178-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When CONFIG_HEADERS_CHECK is enabled, the headers_check is executed
as a serialized task in the vmlinux recipe.

Make it independent of vmlinux so that parallel building can process
the headers_check and other build targets simultaneously.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 3af0379..2808a7d 100644
--- a/Makefile
+++ b/Makefile
@@ -1035,9 +1035,6 @@ cmd_link-vmlinux =                                                 \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
-ifdef CONFIG_HEADERS_CHECK
-	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
-endif
 ifdef CONFIG_GDB_SCRIPTS
 	$(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)
 endif
@@ -1208,6 +1205,10 @@ headers_check: headers_install
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include HDRCHECK=1
 	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi $(hdr-dst) HDRCHECK=1
 
+ifdef CONFIG_HEADERS_CHECK
+all: headers_check
+endif
+
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
-- 
2.7.4
