Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f164.google.com ([209.85.219.164]:49829 "EHLO
	mail-ew0-f164.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754936AbZCLNnR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2009 09:43:17 -0400
Received: by ewy8 with SMTP id 8so337415ewy.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2009 06:43:14 -0700 (PDT)
From: Remis Lima Baima <remis.developer@googlemail.com>
Subject: [PATCH 1/3] Create the infrastructure for generic headers
Date: Thu, 12 Mar 2009 14:43:06 +0100
Message-Id: <1236865388-31590-2-git-send-email-remis.developer@googlemail.com>
In-Reply-To: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
References: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Remis Lima Baima <remis.developer@googlemail.com>

Create the infrastructure that allow ARCH maintainers to remove all
arch/ARCH/include/asm/XXX.h files or, depending on the architecture,
include/asm-ARCH/XXX.h (e.g. arch/x86/include/asm/errno.h) that only
include the _name equivalent_ include/asm-generic/XXX.h file
(e.g. include/asm-generic/errno.h) with _no_ changes. It was called
generic headers for short. Arnd Bergmann gave the original idea and
asked me to implement it.

To use it just two steps are necessary:

 - Remove all the dummy arch/ARCH/include/asm/XXX.h files
   (e.g. rm arch/x86/include/asm/errno.h)

 - Add the variable generic-y with the names of the removed files
   (e.g. generic-y += errno.h) in the arch/ARCH/include/asm/Kbuild
   (e.g. arch/x86/include/asm/Kbuild)

The removed files will be automatically generated during the build
process by the script scripts/Makefile.genericheaders.

NOTE: the arch/ARCH/include/asm/XXX.h (or include/asm-ARCH/XXX.h)
file can only be removed if it has the _exact same name_ as the
include/asm-generic/XXX.h file and _no_ additional logic.

Signed-off-by: Remis Lima Baima <remis.developer@googlemail.com>
---
 Makefile                        |    4 ++++
 scripts/Makefile.genericheaders |   34 ++++++++++++++++++++++++++++++++++
 scripts/Makefile.headersinst    |    4 ++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 scripts/Makefile.genericheaders

diff --git a/Makefile b/Makefile
index d04ee0a..4bab071 100644
--- a/Makefile
+++ b/Makefile
@@ -952,9 +952,11 @@ endif
 # prepare2 creates a makefile if using a separate output directory
 prepare2: prepare3 outputmakefile
 
+export genericheaders := -C $(srctree) -f $(srctree)/scripts/Makefile.genericheaders gh_arch
 prepare1: prepare2 include/linux/version.h include/linux/utsrelease.h \
                    include/asm include/config/auto.conf
 	$(cmd_crmodverdir)
+	$(Q)$(MAKE) $(genericheaders)=$(SRCARCH) genericheaders_install
 
 archprepare: prepare1 scripts_basic
 
@@ -1218,6 +1220,8 @@ $(mrproper-dirs):
 mrproper: clean archmrproper $(mrproper-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
+	$(Q)$(foreach a, $(subst $(objtree)/include/asm-,,$(wildcard $(objtree)/include/asm-*)),\
+		$(MAKE) $(genericheaders)=$(a) genericheaders_remove;)
 
 # distclean
 #
diff --git a/scripts/Makefile.genericheaders b/scripts/Makefile.genericheaders
new file mode 100644
index 0000000..8c86945
--- /dev/null
+++ b/scripts/Makefile.genericheaders
@@ -0,0 +1,34 @@
+# ==========================================================================
+# Generic headers handling
+# ==========================================================================
+
+PHONY += genericheaders_install genericheaders_remove
+
+ifneq ($(wildcard $(srctree)/arch/$(gh_arch)/include/asm/Kbuild),)
+include $(srctree)/arch/$(gh_arch)/include/asm/Kbuild
+else ifneq ($(wildcard $(srctree)/include/asm-$(gh_arch)/Kbuild),)
+include $(srctree)/include/asm-$(gh_arch)/Kbuild
+endif
+
+gh_dst ?= $(objtree)/include/asm-$(gh_arch)
+gh_files := $(addprefix $(gh_dst)/, $(generic-y))
+gh_existentfiles := $(wildcard $(gh_files))
+
+genericheaders_install:
+ifeq ($(generic-y),)
+	$(Q):
+else
+	$(Q)$(foreach g, $(generic-y), \
+		echo "#include <asm-generic/"$(g)">" > $(gh_dst)/$(g);)
+	$(Q)echo "  GEN     "$(subst $(objtree)/,,$(gh_files))
+endif
+
+genericheaders_remove:
+ifeq ($(gh_existentfiles),)
+	$(Q):
+else
+	$(Q)rm -f $(gh_existentfiles)
+	$(Q)echo "  CLEAN   "$(subst $(objtree)/,,$(gh_existentfiles))
+endif
+
+.PHONY: $(PHONY)
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 612dc13..3028a73 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -21,6 +21,7 @@ install       := $(INSTALL_HDR_PATH)/$(_dst)
 header-y      := $(sort $(header-y) $(unifdef-y))
 subdirs       := $(patsubst %/,%,$(filter %/, $(header-y)))
 header-y      := $(filter-out %/, $(header-y))
+header-y      := $(filter-out $(generic-y), $(header-y))
 
 # files used to track state of install/check
 install-file  := $(install)/.install
@@ -65,6 +66,9 @@ __headersinst: $(subdirs) $(install-file)
 
 targets += $(install-file)
 $(install-file): scripts/headers_install.pl $(input-files) FORCE
+ifneq ($(generic-y),)
+	$(Q)$(MAKE) $(genericheaders)=$(SRCARCH) gh_dst=$(install) genericheaders_install
+endif
 	$(if $(unwanted),$(call cmd,remove),)
 	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
 	$(call if_changed,install)
-- 
1.5.6.3

