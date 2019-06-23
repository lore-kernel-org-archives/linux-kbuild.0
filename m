Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:23057 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfFWQNi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Jun 2019 12:13:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: split modules.order build rule out of 'modules' target
Date: Mon, 24 Jun 2019 01:13:28 +0900
Message-Id: <20190623161328.22461-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190623161328.22461-1-yamada.masahiro@socionext.com>
References: <20190623161328.22461-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Merge the build rules of modules.order and modules.builtin

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 19c33bc69bb1..6bfe22b852f2 100644
--- a/Makefile
+++ b/Makefile
@@ -1283,16 +1283,18 @@ all: modules
 # using awk while concatenating to the final file.
 
 PHONY += modules
-modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
-	$(Q)$(AWK) '!x[$$0]++' $(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
+modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
 	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
-modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
+modules.order modules.builtin:
+	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
+
+modules.order: $(vmlinux-dirs)
 
+modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
 modules.builtin: $(modbuiltin-dirs)
-	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
 
 PHONY += $(modbuiltin-dirs)
 # tristate.conf is not included from this Makefile. Add it as a prerequisite
-- 
2.17.1
