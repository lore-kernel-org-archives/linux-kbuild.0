Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:17722 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387569AbfGOOCO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 10:02:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove tag files by distclean instead of mrproper
Date: Mon, 15 Jul 2019 23:01:49 +0900
Message-Id: <20190715140149.21330-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

It takes somewhat long time to generate these tag files.
Keep such precious files until we run 'make distclean'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2c5d00ba537e..2d8e45f2a8df 100644
--- a/Makefile
+++ b/Makefile
@@ -1380,11 +1380,15 @@ CLEAN_FILES += modules.builtin.modinfo
 MRPROPER_DIRS  += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .tmp_objdiff
 MRPROPER_FILES += .config .config.old .version \
-		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
+		  Module.symvers \
 		  signing_key.pem signing_key.priv signing_key.x509	\
 		  x509.genkey extra_certificates signing_key.x509.keyid	\
 		  signing_key.x509.signer vmlinux-gdb.py
 
+# Directories & files removed with 'make distclean'
+DISTCLEAN_DIRS  +=
+DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
+
 # clean - Delete most, but leave enough to build external modules
 #
 clean: rm-dirs  := $(CLEAN_DIRS)
@@ -1417,9 +1421,14 @@ mrproper: clean $(mrproper-dirs)
 
 # distclean
 #
+distclean: rm-dirs  := $(wildcard $(DISTCLEAN_DIRS))
+distclean: rm-files := $(wildcard $(DISTCLEAN_FILES))
+
 PHONY += distclean
 
 distclean: mrproper
+	$(call cmd,rmdirs)
+	$(call cmd,rmfiles)
 	@find $(srctree) $(RCS_FIND_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
 		-o -name '*.bak' -o -name '#*#' -o -name '*%' \
-- 
2.17.1
