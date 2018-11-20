Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34062 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732133AbeKTLdO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Nov 2018 06:33:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 9/9] kbuild: remove redundant 'set -e' from cmd_* defines
Date: Tue, 20 Nov 2018 10:05:30 +0900
Message-Id: <1542675930-21114-10-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

These three cmd_* are invoked in the $(call cmd,*) form.

Now that 'set -e' moved to the 'cmd' macro, they do not need to
explicitly give 'set -e'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.build   | 2 --
 scripts/package/Makefile | 1 -
 2 files changed, 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3bad2aa..d589d57 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -134,7 +134,6 @@ cmd_gensymtypes_c =                                                         \
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
 cmd_cc_symtypes_c =                                                         \
-    set -e;                                                                 \
     $(call cmd_gensymtypes_c,true,$@) >/dev/null;                           \
     test -s $@ || rm -f $@
 
@@ -337,7 +336,6 @@ cmd_gensymtypes_S =                                                         \
 
 quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
 cmd_cc_symtypes_S =                                                         \
-    set -e;                                                                 \
     $(call cmd_gensymtypes_S,true,$@) >/dev/null;                           \
     test -s $@ || rm -f $@
 
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 73503eb..453fece 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -33,7 +33,6 @@ MKSPEC     := $(srctree)/scripts/package/mkspec
 
 quiet_cmd_src_tar = TAR     $(2).tar.gz
       cmd_src_tar = \
-set -e; \
 if test "$(objtree)" != "$(srctree)"; then \
 	echo >&2; \
 	echo >&2 "  ERROR:"; \
-- 
2.7.4
