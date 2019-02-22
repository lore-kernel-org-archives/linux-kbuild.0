Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:53327 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfBVHkW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Feb 2019 02:40:22 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/6] kbuild: remove empty rules for makefiles
Date: Fri, 22 Feb 2019 16:40:08 +0900
Message-Id: <1550821211-30324-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The previous commit made 'MAKEFLAGS += -rR' effective in the top
Makefile regardless of O= option, GNU Make versions.

The top Makefile does not need to cancel implicit rules for makefiles.

There is still one place where an empty rule is useful. Since -rR is
effective only after sub-make, GNU Make would try implicit rules to
update the top Makefile. Although it is not a big overhead, cancel it
just in case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Revive  empty rule for
    $(KCONFIG_CONFIG) include/config/auto.conf.cmd

 Makefile | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index f0bc078..538a4f1 100644
--- a/Makefile
+++ b/Makefile
@@ -37,6 +37,10 @@ ifneq ($(sub-make-done),1)
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
@@ -1764,9 +1763,7 @@ cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
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
