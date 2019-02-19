Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:52939 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfBSJdf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 04:33:35 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/5] scripts/gdb: refactor rules for symlink creation
Date: Tue, 19 Feb 2019 18:33:06 +0900
Message-Id: <1550568787-18710-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Kiszka <jan.kiszka@siemens.com>, linux-kernel@vger.kernel.org

gdb-scripts is not a real object, but (ab)used like a phony target.

Rewrite the code in a more Kbuild-ish way. Add symlinks to extra-y
and use if_changed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/gdb/linux/Makefile | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
index 7545806..3df395a 100644
--- a/scripts/gdb/linux/Makefile
+++ b/scripts/gdb/linux/Makefile
@@ -1,13 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
-always := gdb-scripts
 
-SRCTREE := $(abspath $(srctree))
-
-$(obj)/gdb-scripts:
 ifneq ($(KBUILD_SRC),)
-	$(Q)ln -fsn $(SRCTREE)/$(obj)/*.py $(objtree)/$(obj)
+
+symlinks := $(patsubst $(srctree)/$(src)/%,%,$(wildcard $(srctree)/$(src)/*.py))
+
+quiet_cmd_symlink = SYMLINK $@
+      cmd_symlink = ln -fsn $(patsubst $(obj)/%,$(abspath $(srctree))/$(src)/%,$@) $@
+
+extra-y += $(symlinks)
+$(addprefix $(obj)/, $(symlinks)): FORCE
+	$(call if_changed,symlink)
+
 endif
-	@:
 
 quiet_cmd_gen_constants_py = GEN     $@
       cmd_gen_constants_py = \
@@ -18,4 +22,4 @@ extra-y += constants.py
 $(obj)/constants.py: $(src)/constants.py.in FORCE
 	$(call if_changed_dep,gen_constants_py)
 
-clean-files := *.pyc *.pyo $(if $(KBUILD_SRC),*.py)
+clean-files := *.pyc *.pyo
-- 
2.7.4
