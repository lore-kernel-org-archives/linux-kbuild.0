Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:64384 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394268AbfBNDGG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Feb 2019 22:06:06 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 7/8] kbuild: remove empty rules for makefiles
Date: Thu, 14 Feb 2019 12:05:20 +0900
Message-Id: <1550113521-23577-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The previous commit made 'MAKEFLAGS += -rR' effective in the top
Makefile regardless of O= option, GNU Make versions.

The top Makefile does not need to cancel implicit rules for makefiles.

There is still one place where an empty rule is useful. Since -rR is
effective only after sub-make, GNU Make would try implicit rules to
update the top Makefile. Although it is not a big overhead, cancel
it just in case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 25d7d46..f7f1aa1 100644
--- a/Makefile
+++ b/Makefile
@@ -37,6 +37,10 @@ ifndef KBUILD_SUBMAKE
 # (this increases performance and avoids hard-to-debug behaviour)
 MAKEFLAGS += -rR
 
+# 'MAKEFLAGS += -rR' does not become immediately effective for old
+# GNU Make versions. Cancel implicit rules for this Makefile.
+$(lastword $(MAKEFILE_LIST)): ;
+
 # Avoid funny character set dependencies
 unexport LC_ALL
 LC_COLLATE=C
@@ -120,9 +124,6 @@ ifeq ("$(origin O)", "command line")
   KBUILD_OUTPUT := $(O)
 endif
 
-# Cancel implicit rules on top Makefile
-$(CURDIR)/Makefile Makefile: ;
-
 ifneq ($(words $(subst :, ,$(CURDIR))), 1)
   $(error main directory cannot contain spaces nor colons)
 endif
@@ -303,8 +304,6 @@ __build_one_by_one:
 
 else
 
-# We need some generic definitions (do not try to remake the file).
-scripts/Kbuild.include: ;
 include scripts/Kbuild.include
 
 # Read KERNELRELEASE from include/config/kernel.release (if it exists)
@@ -627,9 +626,6 @@ ifeq ($(may-sync-config),1)
 # because some architectures define CROSS_COMPILE there.
 -include include/config/auto.conf.cmd
 
-# To avoid any implicit rule to kick in, define an empty command
-$(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
-
 # The actual configuration files used during the build are stored in
 # include/generated/ and include/config/. Update them if .config is newer than
 # include/config/auto.conf (which mirrors .config).
@@ -1750,9 +1746,7 @@ cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
 # read saved command lines for existing targets
 existing-targets := $(wildcard $(sort $(targets)))
 
-cmd_files := $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
-$(cmd_files): ;	# Do not try to update included dependency files
--include $(cmd_files)
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
 endif   # ifeq ($(config-targets),1)
 endif   # ifeq ($(mixed-targets),1)
-- 
2.7.4
