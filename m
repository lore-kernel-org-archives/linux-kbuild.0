Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:52670 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfBSJdZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 04:33:25 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/5] kbuild: create symlink to vmlinux-gdb.py in scripts_gdb target
Date: Tue, 19 Feb 2019 18:33:05 +0900
Message-Id: <1550568787-18710-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

It is weird to create gdb stuff as a side-effect of vmlinux.

Move it to a more relevant place.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index a5762c6..0459260 100644
--- a/Makefile
+++ b/Makefile
@@ -1015,9 +1015,6 @@ cmd_link-vmlinux =                                                 \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
-ifdef CONFIG_GDB_SCRIPTS
-	$(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)
-endif
 	+$(call if_changed,link-vmlinux)
 
 targets := vmlinux
@@ -1519,6 +1516,7 @@ $(DOC_TARGETS): scripts_basic FORCE
 PHONY += scripts_gdb
 scripts_gdb: prepare
 	$(Q)$(MAKE) $(build)=scripts/gdb
+	$(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)
 
 ifdef CONFIG_GDB_SCRIPTS
 all: scripts_gdb
-- 
2.7.4
