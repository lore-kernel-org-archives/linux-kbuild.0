Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25229 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751692AbdJDD5c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 23:57:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 4/4] kbuild: evaluate cc-option and friends only when building kernel
Date: Wed,  4 Oct 2017 12:56:07 +0900
Message-Id: <1507089367-10402-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

$(call cc-option,...) is costly because it invokes the C compiler.

Given that only some targets need compiler flags, it is pointless
to compute them all the time.

The variable no-dot-config-targets lists the targets we can run
without the .config file, such as "make clean", "make help", etc.

My idea is similar here.  We can add no-compiler-targets to list the
targets we can run without the target compiler information.  This
includes no-dot-config-targets + config targets + misc.

When we run only targets listed in the no-compiler-targets, we can
set cc-option and friends to no-op.  The hostcc-option is an exception
since the host compiler is needed for building fixdep, kconfig, etc.

I did not add "dtbs" and "%.dtb" to no-compiler-targets.  This is
intentional.  Theoretically, we can build device tree blobs without
the C compiler.  It it true that in-kernel DT files are pre-processed
by CPP before DTC, but KBUILD_CPPFLAGS is unused.  However, for the
reason of scripts/dtc/ location, Kbuild descends into scripts/mod/
before the DT build.  I do not want to trigger the unrelated re-build
of modpost when building DT.  Perhaps, we can fix this with further
refactoring, but not now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile               | 10 ++++++++++
 scripts/Kbuild.include | 14 +++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index a4fd682..80e1a38 100644
--- a/Makefile
+++ b/Makefile
@@ -224,9 +224,13 @@ no-dot-config-targets := clean mrproper distclean \
 			 $(version_h) headers_% archheaders archscripts \
 			 kernelversion %src-pkg
 
+no-compiler-targets := $(no-dot-config-targets) config %config \
+		       kernelrelease image_name
+
 config-targets := 0
 mixed-targets  := 0
 dot-config     := 1
+need-compiler  := 1
 
 ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
 	ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
@@ -234,6 +238,12 @@ ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
 	endif
 endif
 
+ifneq ($(filter $(no-compiler-targets), $(MAKECMDGOALS)),)
+	ifeq ($(filter-out $(no-compiler-targets), $(MAKECMDGOALS)),)
+		need-compiler := 0
+	endif
+endif
+
 ifeq ($(KBUILD_EXTMOD),)
         ifneq ($(filter config %config,$(MAKECMDGOALS)),)
                 config-targets := 1
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 9ffd3dd..222d0a2 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -96,6 +96,13 @@ try-run = $(shell set -e;		\
 	fi;				\
 	rm -f "$$TMP" "$$TMPO")
 
+# hostcc-option
+# Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
+hostcc-option = $(call __cc-option, $(HOSTCC),\
+	$(HOSTCFLAGS) $(HOST_EXTRACFLAGS),$(1),$(2))
+
+ifeq ($(need-compiler),1)
+
 # as-option
 # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
@@ -123,11 +130,6 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 cc-option = $(call __cc-option, $(CC),\
 	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
 
-# hostcc-option
-# Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
-hostcc-option = $(call __cc-option, $(HOSTCC),\
-	$(HOSTCFLAGS) $(HOST_EXTRACFLAGS),$(1),$(2))
-
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
@@ -180,6 +182,8 @@ ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
 ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
 
+endif
+
 ######
 
 ###
-- 
2.7.4

