Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:48887 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfAPC5O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jan 2019 21:57:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: skip 'addtree' and 'flags' magic for external module build
Date: Wed, 16 Jan 2019 11:56:40 +0900
Message-Id: <1547607401-20118-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When building an external module, $(obj) is the absolute path to it.

The header search paths from ccflags-y etc. should not be tweaked.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.host |  6 ++++--
 scripts/Makefile.lib  | 11 ++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 0393f75..a115259 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -67,13 +67,15 @@ _hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
 _hostcxx_flags = $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(basetarget).o)
 
-ifeq ($(KBUILD_SRC),)
 __hostc_flags	= $(_hostc_flags)
 __hostcxx_flags	= $(_hostcxx_flags)
-else
+
+ifeq ($(KBUILD_EXTMOD),)
+ifneq ($(KBUILD_SRC),)
 __hostc_flags	= -I$(obj) $(call flags,_hostc_flags)
 __hostcxx_flags	= -I$(obj) $(call flags,_hostcxx_flags)
 endif
+endif
 
 hostc_flags    = -Wp,-MD,$(depfile) $(__hostc_flags)
 hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 12b88d0..ecad15b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -137,14 +137,14 @@ _c_flags += $(if $(patsubst n%,, \
 	$(CFLAGS_KCOV))
 endif
 
-# If building the kernel in a separate objtree expand all occurrences
-# of -Idir to -I$(srctree)/dir except for absolute paths (starting with '/').
-
-ifeq ($(KBUILD_SRC),)
 __c_flags	= $(_c_flags)
 __a_flags	= $(_a_flags)
 __cpp_flags     = $(_cpp_flags)
-else
+
+# If building the kernel in a separate objtree expand all occurrences
+# of -Idir to -I$(srctree)/dir except for absolute paths (starting with '/').
+ifeq ($(KBUILD_EXTMOD),)
+ifneq ($(KBUILD_SRC),)
 
 # -I$(obj) locates generated .h files
 # $(call addtree,-I$(obj)) locates .h files in srctree, from generated .c files
@@ -155,6 +155,7 @@ __c_flags	= $(if $(obj),$(call addtree,-I$(src)) -I$(obj)) \
 __a_flags	= $(call flags,_a_flags)
 __cpp_flags     = $(call flags,_cpp_flags)
 endif
+endif
 
 c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
-- 
2.7.4
