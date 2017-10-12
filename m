Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:49843 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752665AbdJLJYE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 05:24:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: do not call cc-option before KBUILD_CFLAGS initialization
Date: Thu, 12 Oct 2017 18:22:25 +0900
Message-Id: <1507800145-29563-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Some $(call cc-option,...) are invoked very early, even before
KBUILD_CFLAGS, etc. are initialized.

The returned string from $(call cc-option,...) depends on
KBUILD_CPPFLAGS, KBUILD_CFLAGS, and GCC_PLUGINS_CFLAGS.

Since they are exported, they are not empty when the top Makefile
is recursively invoked.

The recursion occurs in several places.  For example, the top
Makefile invokes itself for silentoldconfig.  "make tinyconfig",
"make rpm-pkg" are the cases, too.

In those cases, the second call of cc-option from the same line
runs a different shell command due to non-pristine KBUILD_CFLAGS.

To get the same result all the time, KBUILD_* and GCC_PLUGINS_CFLAGS
must be initialized before any call of cc-option.  This avoids
garbage data in the .cache.mk file.

Move all calls of cc-option below the config targets because target
compiler flags are unnecessary for Kconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index e5c20ee..2c4a238 100644
--- a/Makefile
+++ b/Makefile
@@ -392,9 +392,6 @@ LDFLAGS_MODULE  =
 CFLAGS_KERNEL	=
 AFLAGS_KERNEL	=
 LDFLAGS_vmlinux =
-CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
-CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
-
 
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
@@ -413,21 +410,19 @@ LINUXINCLUDE    := \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
-KBUILD_CPPFLAGS := -D__KERNEL__
-
+KBUILD_AFLAGS   := -D__ASSEMBLY__
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
-		   -std=gnu89 $(call cc-option,-fno-PIE)
-
-
+		   -std=gnu89
+KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
-KBUILD_AFLAGS   := -D__ASSEMBLY__ $(call cc-option,-fno-PIE)
 KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
 KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
+GCC_PLUGINS_CFLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
@@ -435,7 +430,7 @@ export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
-export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE CFLAGS_GCOV CFLAGS_KCOV CFLAGS_KASAN CFLAGS_UBSAN
+export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE CFLAGS_KASAN CFLAGS_UBSAN
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
@@ -607,6 +602,12 @@ endif
 # Defaults to vmlinux, but the arch makefile usually adds further targets
 all: vmlinux
 
+KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
+KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
+CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
+CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
+export CFLAGS_GCOV CFLAGS_KCOV
+
 # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
 # values of the respective KBUILD_* variables
 ARCH_CPPFLAGS :=
-- 
2.7.4

