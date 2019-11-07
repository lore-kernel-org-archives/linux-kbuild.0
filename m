Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:31178 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbfKGHPO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 02:15:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: move headers_check rule to usr/include/Makefile
Date: Thu,  7 Nov 2019 16:14:41 +0900
Message-Id: <20191107071441.1067-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191107071441.1067-1-yamada.masahiro@socionext.com>
References: <20191107071441.1067-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

Currently, some sanity checks for uapi headers are done by
scripts/headers_check.pl, which is wired up to the 'headers_check'
target in the top Makefile.

It is true compiling headers has better test coverage, but there
are still several headers excluded from the compile test. I like
to keep headers_check.pl for a while, but we can delete a lot of
code by moving the build rule to usr/include/Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                     | 11 +++--------
 lib/Kconfig.debug            | 11 -----------
 scripts/Makefile.headersinst | 18 ------------------
 usr/include/Makefile         |  9 ++++++---
 4 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/Makefile b/Makefile
index 225884bd0d86..778f92e58020 100644
--- a/Makefile
+++ b/Makefile
@@ -1192,19 +1192,15 @@ headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi
 	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi
 
+# Deprecated. It is no-op now.
 PHONY += headers_check
-headers_check: headers
-	$(Q)$(MAKE) $(hdr-inst)=include/uapi HDRCHECK=1
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi HDRCHECK=1
+headers_check:
+	@:
 
 ifdef CONFIG_HEADERS_INSTALL
 prepare: headers
 endif
 
-ifdef CONFIG_HEADERS_CHECK
-all: headers_check
-endif
-
 PHONY += scripts_unifdef
 scripts_unifdef: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
@@ -1472,7 +1468,6 @@ help:
 	@echo  '  versioncheck    - Sanity check on version.h usage'
 	@echo  '  includecheck    - Check for duplicate included header files'
 	@echo  '  export_report   - List the usages of all exported symbols'
-	@echo  '  headers_check   - Sanity check on exported headers'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
 	@echo  ''
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 93d97f9b0157..f61d834e02fe 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -299,17 +299,6 @@ config HEADERS_INSTALL
 	  user-space program samples. It is also needed by some features such
 	  as uapi header sanity checks.
 
-config HEADERS_CHECK
-	bool "Run sanity checks on uapi headers when building 'all'"
-	depends on HEADERS_INSTALL
-	help
-	  This option will run basic sanity checks on uapi headers when
-	  building the 'all' target, for example, ensure that they do not
-	  attempt to include files which were not exported, etc.
-
-	  If you're making modifications to header files which are
-	  relevant for userspace, say 'Y'.
-
 config OPTIMIZE_INLINING
 	def_bool y
 	help
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 1b405a7ed14f..708fbd08a2c5 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -56,9 +56,6 @@ new-dirs      := $(filter-out $(existing-dirs), $(wanted-dirs))
 $(if $(new-dirs), $(shell mkdir -p $(new-dirs)))
 
 # Rules
-
-ifndef HDRCHECK
-
 quiet_cmd_install = HDRINST $@
       cmd_install = $(CONFIG_SHELL) $(srctree)/scripts/headers_install.sh $< $@
 
@@ -81,21 +78,6 @@ existing-headers := $(filter $(old-headers), $(all-headers))
 
 -include $(foreach f,$(existing-headers),$(dir $(f)).$(notdir $(f)).cmd)
 
-else
-
-quiet_cmd_check = HDRCHK  $<
-      cmd_check = $(PERL) $(srctree)/scripts/headers_check.pl $(dst) $(SRCARCH) $<; touch $@
-
-check-files := $(addsuffix .chk, $(all-headers))
-
-$(check-files): $(dst)/%.chk : $(dst)/% $(srctree)/scripts/headers_check.pl
-	$(call cmd,check)
-
-__headers: $(check-files)
-	@:
-
-endif
-
 PHONY += FORCE
 FORCE:
 
diff --git a/usr/include/Makefile b/usr/include/Makefile
index a7c3e2f81680..604dfdcd6d3c 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -92,11 +92,14 @@ endif
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 header-test- += asm-generic/%
 
-extra-y := $(patsubst %.h,%.hdrtest, $(filter-out $(header-test-), \
-		$(patsubst $(obj)/%,%, $(shell find $(obj) -name '*.h'))))
+extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h'))
 
 quiet_cmd_hdrtest = HDRTEST $<
-      cmd_hdrtest = $(CC) $(c_flags) -S -o /dev/null -x c /dev/null -include $<; touch $@
+      cmd_hdrtest = \
+		$(CC) $(c_flags) -S -o /dev/null -x c /dev/null \
+			$(if $(filter-out $(header-test-), $*.h), -include $<); \
+		$(PERL) $(srctree)/scripts/headers_check.pl $(obj) $(SRCARCH) $<; \
+		touch $@
 
 $(obj)/%.hdrtest: $(obj)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
-- 
2.17.1
