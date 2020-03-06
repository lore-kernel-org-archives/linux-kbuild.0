Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:31048 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgCFRJB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 12:09:01 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kbuild: compute the dtbs_install destination more simply
Date: Sat,  7 Mar 2020 02:08:51 +0900
Message-Id: <20200306170852.17798-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

The 'dtbinst_root' is used to remember the root of the in-kernel dts
directory (e.g. arch/*/boot/dts), but it looks clumsy.

I prefer using two variables 'obj' and 'dst' to track the in-kernel
directory and the install destination, respectively.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 2 +-
 scripts/Makefile.dtbinst | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index f68d05ee2900..be237edd2c7f 100644
--- a/Makefile
+++ b/Makefile
@@ -1253,7 +1253,7 @@ dtbs_check: export CHECK_DTBS=1
 dtbs_check: dt_binding_check
 
 dtbs_install:
-	$(Q)$(MAKE) $(dtbinst)=$(dtstree)
+	$(Q)$(MAKE) $(dtbinst)=$(dtstree) dst=$(INSTALL_DTBS_PATH)
 
 ifdef CONFIG_OF_EARLY_FLATTREE
 all: dtbs
diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 7301ab5e2e06..fcd5f2eaaad1 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -13,8 +13,6 @@ src := $(obj)
 PHONY := __dtbs_install
 __dtbs_install:
 
-export dtbinst_root ?= $(obj)
-
 include include/config/auto.conf
 include scripts/Kbuild.include
 include $(src)/Makefile
@@ -26,13 +24,11 @@ dtbinst-dirs	:= $(subdir-y) $(subdir-m)
 quiet_cmd_dtb_install =	INSTALL $<
       cmd_dtb_install =	mkdir -p $(2); cp $< $(2)
 
-install-dir = $(patsubst $(dtbinst_root)%,$(INSTALL_DTBS_PATH)%,$(obj))
-
 $(dtbinst-files): %.dtb: $(obj)/%.dtb
-	$(call cmd,dtb_install,$(install-dir))
+	$(call cmd,dtb_install,$(dst))
 
 $(dtbinst-dirs):
-	$(Q)$(MAKE) $(dtbinst)=$(obj)/$@
+	$(Q)$(MAKE) $(dtbinst)=$(obj)/$@ dst=$(dst)/$@
 
 PHONY += $(dtbinst-files) $(dtbinst-dirs)
 __dtbs_install: $(dtbinst-files) $(dtbinst-dirs)
-- 
2.17.1
