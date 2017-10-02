Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36179 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdJBKuW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2017 06:50:22 -0400
From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH] kbuild: allow making undefined symbols fatal for external modules
Date: Mon,  2 Oct 2017 12:50:04 +0200
Message-Id: <20171002105004.32426-1-jonas.gorski@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>

By passing appropriate values in KBUILD_EXTRA_SYMBOLS it is possible to
make modpost be able to resolve all symbols for external modules, even
between to other external modules.

Because of this, it might be desirable to make unresolved symbols an
error on external module builds as well, to catch missing exports there
as well.

So add a new flag KBUILD_MODPOST_ERROR which can be set to enable this
behaviour. It has no effect on non external module builds.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
The main target is to allow distributions (like LEDE) that make use of
kernel backports and other out of tree drivers to be able to catch
errors like missing EXPORT_SYMBOLs in the kernel early.

 scripts/Makefile.modpost | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 16923ba4b5b1..29f787bf8c3a 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -34,6 +34,8 @@
 
 # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
 # symbols in the final module linking stage
+# KBUILD_MODPOST_ERROR can be set to error out in case of undefined
+# symbols in the final module linking stage for external modules
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely useful to speed up test compiles
 PHONY := _modpost
@@ -49,6 +51,8 @@ ifneq ($(KBUILD_EXTMOD),)
 obj := $(KBUILD_EXTMOD)
 src := $(obj)
 
+KBUILD_MODPOST_WARN = $(if $(KBUILD_MODPOST_ERROR),,1)
+
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
@@ -78,7 +82,7 @@ modpost = scripts/mod/modpost                    \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
- $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
+ $(if $(KBUILD_MODPOST_WARN),-w)
 
 MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
-- 
2.13.2

