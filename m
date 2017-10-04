Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25223 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbdJDD5c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 23:57:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] kbuild: replace $(hdr-arch) with $(SRCARCH)
Date: Wed,  4 Oct 2017 12:56:04 +0900
Message-Id: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Since commit 5e53879008b9 ("sparc,sparc64: unify Makefile"), hdr-arch
and SRCARCH always match.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                     | 21 +++++++++------------
 scripts/Makefile.headersinst |  2 +-
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index cf007a3..8d900ba 100644
--- a/Makefile
+++ b/Makefile
@@ -283,9 +283,6 @@ ifeq ($(ARCH),tilegx)
        SRCARCH := tile
 endif
 
-# Where to locate arch specific headers
-hdr-arch  := $(SRCARCH)
-
 KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
 
@@ -378,8 +375,8 @@ CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
-		-I$(srctree)/arch/$(hdr-arch)/include/uapi \
-		-I$(objtree)/arch/$(hdr-arch)/include/generated/uapi \
+		-I$(srctree)/arch/$(SRCARCH)/include/uapi \
+		-I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
 		-I$(srctree)/include/uapi \
 		-I$(objtree)/include/generated/uapi \
                 -include $(srctree)/include/linux/kconfig.h
@@ -387,8 +384,8 @@ USERINCLUDE    := \
 # Use LINUXINCLUDE when you must reference the include/ directory.
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := \
-		-I$(srctree)/arch/$(hdr-arch)/include \
-		-I$(objtree)/arch/$(hdr-arch)/include/generated \
+		-I$(srctree)/arch/$(SRCARCH)/include \
+		-I$(objtree)/arch/$(SRCARCH)/include/generated \
 		$(if $(KBUILD_SRC), -I$(srctree)/include) \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
@@ -1134,8 +1131,8 @@ headerdep:
 #Default location for installed headers
 export INSTALL_HDR_PATH = $(objtree)/usr
 
-# If we do an all arch process set dst to include/arch-$(hdr-arch)
-hdr-dst = $(if $(KBUILD_HEADERS), dst=include/arch-$(hdr-arch), dst=include)
+# If we do an all arch process set dst to include/arch-$(SRCARCH)
+hdr-dst = $(if $(KBUILD_HEADERS), dst=include/arch-$(SRCARCH), dst=include)
 
 PHONY += archheaders
 archheaders:
@@ -1153,10 +1150,10 @@ headers_install_all:
 
 PHONY += headers_install
 headers_install: __headers
-	$(if $(wildcard $(srctree)/arch/$(hdr-arch)/include/uapi/asm/Kbuild),, \
+	$(if $(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/Kbuild),, \
 	  $(error Headers not exportable for the $(SRCARCH) architecture))
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi $(hdr-dst)
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi $(hdr-dst)
 
 PHONY += headers_check_all
 headers_check_all: headers_install_all
@@ -1165,7 +1162,7 @@ headers_check_all: headers_install_all
 PHONY += headers_check
 headers_check: headers_install
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include HDRCHECK=1
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi $(hdr-dst) HDRCHECK=1
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi $(hdr-dst) HDRCHECK=1
 
 # ---------------------------------------------------------------------------
 # Kernel selftest
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 343d586..5692d7a 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -30,7 +30,7 @@ __headers: $(subdirs)
 $(subdirs):
 	$(Q)$(MAKE) $(hdr-inst)=$(obj)/$@ dst=$(dst)/$@
 
-# Skip header install/check for include/uapi and arch/$(hdr-arch)/include/uapi.
+# Skip header install/check for include/uapi and arch/$(SRCARCH)/include/uapi.
 # We have only sub-directories there.
 skip-inst := $(if $(filter %/uapi,$(obj)),1)
 
-- 
2.7.4

