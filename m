Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:31050 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgCFRJB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 12:09:01 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kbuild: refactor Makefile.dtbinst more
Date: Sat,  7 Mar 2020 02:08:52 +0900
Message-Id: <20200306170852.17798-2-masahiroy@kernel.org>
In-Reply-To: <20200306170852.17798-1-masahiroy@kernel.org>
References: <20200306170852.17798-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Refactor Makefile.dtbinst so it looks similar to other Makefiles.

*.dtb should not be a phony target. Copy files based on the timestamps.
Print installed dtb paths instead of in-kernel dtb paths.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.dtbinst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index fcd5f2eaaad1..50d580d77ae9 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -17,20 +17,20 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 include $(src)/Makefile
 
-dtbinst-files	:= $(sort $(dtb-y) $(if $(CONFIG_OF_ALL_DTBS), $(dtb-)))
-dtbinst-dirs	:= $(subdir-y) $(subdir-m)
+dtbs    := $(addprefix $(dst)/, $(dtb-y) $(if $(CONFIG_OF_ALL_DTBS),$(dtb-)))
+subdirs := $(addprefix $(obj)/, $(subdir-y) $(subdir-m))
 
-# Helper targets for Installing DTBs into the boot directory
-quiet_cmd_dtb_install =	INSTALL $<
-      cmd_dtb_install =	mkdir -p $(2); cp $< $(2)
+__dtbs_install: $(dtbs) $(subdirs)
+	@:
 
-$(dtbinst-files): %.dtb: $(obj)/%.dtb
-	$(call cmd,dtb_install,$(dst))
+quiet_cmd_dtb_install = INSTALL $@
+      cmd_dtb_install = install -D $< $@
 
-$(dtbinst-dirs):
-	$(Q)$(MAKE) $(dtbinst)=$(obj)/$@ dst=$(dst)/$@
+$(dst)/%.dtb: $(obj)/%.dtb
+	$(call cmd,dtb_install)
 
-PHONY += $(dtbinst-files) $(dtbinst-dirs)
-__dtbs_install: $(dtbinst-files) $(dtbinst-dirs)
+PHONY += $(subdirs)
+$(subdirs):
+	$(Q)$(MAKE) $(dtbinst)=$@ dst=$(patsubst $(obj)/%,$(dst)/%,$@)
 
 .PHONY: $(PHONY)
-- 
2.17.1
