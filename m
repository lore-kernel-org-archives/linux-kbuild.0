Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:35549 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751073AbdLIQDt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Dec 2017 11:03:49 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: add LEX and YACC variables
Date: Sun, 10 Dec 2017 01:02:28 +0900
Message-Id: <1512835350-8646-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1512835350-8646-1-git-send-email-yamada.masahiro@socionext.com>
References: <1512835350-8646-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Allow users to use their favorite lexer / parser generators.
This is useful for me to test various flex and bison versions.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile             | 4 +++-
 scripts/Makefile.lib | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index c988e46..83209d6 100644
--- a/Makefile
+++ b/Makefile
@@ -377,6 +377,8 @@ NM		= $(CROSS_COMPILE)nm
 STRIP		= $(CROSS_COMPILE)strip
 OBJCOPY		= $(CROSS_COMPILE)objcopy
 OBJDUMP		= $(CROSS_COMPILE)objdump
+LEX		= flex
+YACC		= bison
 AWK		= awk
 GENKSYMS	= scripts/genksyms/genksyms
 INSTALLKERNEL  := installkernel
@@ -428,7 +430,7 @@ GCC_PLUGINS_CFLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
-export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
+export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1ca4dcd..ee528e3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -193,7 +193,7 @@ ifdef REGENERATE_PARSERS
 LEX_PREFIX = $(if $(LEX_PREFIX_${baseprereq}),$(LEX_PREFIX_${baseprereq}),yy)
 
 quiet_cmd_flex = LEX     $@
-      cmd_flex = flex -o$@ -L -P $(LEX_PREFIX) $<
+      cmd_flex = $(LEX) -o$@ -L -P $(LEX_PREFIX) $<
 
 .PRECIOUS: $(src)/%.lex.c_shipped
 $(src)/%.lex.c_shipped: $(src)/%.l
@@ -204,7 +204,7 @@ $(src)/%.lex.c_shipped: $(src)/%.l
 YACC_PREFIX = $(if $(YACC_PREFIX_${baseprereq}),$(YACC_PREFIX_${baseprereq}),yy)
 
 quiet_cmd_bison = YACC    $@
-      cmd_bison = bison -o$@ -t -l -p $(YACC_PREFIX) $<
+      cmd_bison = $(YACC) -o$@ -t -l -p $(YACC_PREFIX) $<
 
 .PRECIOUS: $(src)/%.tab.c_shipped
 $(src)/%.tab.c_shipped: $(src)/%.y
-- 
2.7.4

