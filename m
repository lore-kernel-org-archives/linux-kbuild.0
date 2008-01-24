Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42809 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759118AbYAXWEG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:06 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 3FEABE31CA5
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:52 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 67/77] kbuild: introduce new option to enhance section mismatch analysis
Date: Thu, 24 Jan 2008 23:03:48 +0100
Message-Id: <1201212238-4369-67-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

Setting the option DEBUG_SECTION_MISMATCH will
report additional section mismatch'es but this
should in the end makes it possible to get rid of
all of them.

See help text in lib/Kconfig.debug for details.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile               |    5 +++++
 lib/Kconfig.debug      |   30 ++++++++++++++++++++++++++++++
 scripts/Makefile.build |    9 +++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e518ed6..1f22c1f 100644
--- a/Makefile
+++ b/Makefile
@@ -520,6 +520,11 @@ KBUILD_CFLAGS	+= -g
 KBUILD_AFLAGS	+= -gdwarf-2
 endif
 
+# We trigger additional mismatches with less inlining
+ifdef CONFIG_DEBUG_SECTION_MISMATCH
+KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
+endif
+
 # Force gcc to behave correct even for buggy distributions
 KBUILD_CFLAGS         += $(call cc-option, -fno-stack-protector)
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a601093..c1fb0c6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -79,6 +79,36 @@ config HEADERS_CHECK
 	  exported to $(INSTALL_HDR_PATH) (usually 'usr/include' in
 	  your build tree), to make sure they're suitable.
 
+config DEBUG_SECTION_MISMATCH
+	bool "Enable full Section mismatch analysis"
+	default y
+	help
+	  The section mismatch analysis checks if there are illegal
+	  references from one section to another section.
+	  Linux will during link or during runtime drop some sections
+	  and any use of code/data previously in these sections will
+	  most likely result in an oops.
+	  In the code functions and variables are annotated with
+	  __init, __devinit etc. (see full list in include/linux/init.h)
+	  which result in the code/data being placed in specific sections.
+	  The section mismatch anaylsis are always done after a full
+	  kernel build but enabling this options will in addition
+	  do the following:
+	  - Add the option -fno-inline-functions-called-once to gcc
+	    When inlining a function annotated __init in a non-init
+	    function we would loose the section information and thus
+	    the analysis would not catch the illegal reference.
+	    This options tell gcc to inline less but will also
+	    result in a larger kernel.
+	  - Run the section mismatch analysis for each module/built-in.o
+	    When we run the section mismatch analysis on vmlinux.o we
+	    looses valueable information about where the mismatch was
+	    introduced.
+	    Running the analysis for each module/built-in.o file
+	    will tell where the mismatch happens much closer to the
+	    source. The drawback is that we will report the same
+	    mismatch at least twice.
+
 config DEBUG_KERNEL
 	bool "Kernel debugging"
 	help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index db38ef4..67fb453 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -103,6 +103,10 @@ ifneq ($(KBUILD_CHECKSRC),0)
   endif
 endif
 
+# Do section mismatch analysis for each module/built-in.o
+ifdef CONFIG_DEBUG_SECTION_MISMATCH
+  cmd_secanalysis = ; scripts/mod/modpost $@
+endif
 
 # Compile C sources (.c)
 # ---------------------------------------------------------------------------
@@ -268,7 +272,8 @@ ifdef builtin-target
 quiet_cmd_link_o_target = LD      $@
 # If the list of objects to link is empty, just create an empty built-in.o
 cmd_link_o_target = $(if $(strip $(obj-y)),\
-		      $(LD) $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
+		      $(LD) $(ld_flags) -r -o $@ $(filter $(obj-y), $^) \
+		      $(cmd_secanalysis),\
 		      rm -f $@; $(AR) rcs $@)
 
 $(builtin-target): $(obj-y) FORCE
@@ -316,7 +321,7 @@ $($(subst $(obj)/,,$(@:.o=-objs)))    \
 $($(subst $(obj)/,,$(@:.o=-y)))), $^)
  
 quiet_cmd_link_multi-y = LD      $@
-cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps)
+cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
 
 quiet_cmd_link_multi-m = LD [M]  $@
 cmd_link_multi-m = $(cmd_link_multi-y)
-- 
1.5.4.rc3.14.g44397

