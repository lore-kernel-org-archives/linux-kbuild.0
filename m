Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:43049 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752176AbdEDBQR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 21:16:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: dtbinst: remove unnecessary __dtbs_install_prep target
Date: Thu,  4 May 2017 10:14:57 +0900
Message-Id: <1493860497-26311-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Since commit 5399eb9b3908 ("dtbsinstall: don't move target directory
out of the way"), the target __dtbs_install_prep is invoked just for
creating the install directory, but all the necessary directories
are automatically created by:
   cmd_dtb_install = mkdir -p $(2); cp $< $(2)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.dtbinst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index a1be75d..34614a4 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -20,12 +20,6 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 include $(src)/Makefile
 
-PHONY += __dtbs_install_prep
-__dtbs_install_prep:
-ifeq ("$(dtbinst-root)", "$(obj)")
-	$(Q)mkdir -p $(INSTALL_DTBS_PATH)
-endif
-
 dtbinst-files	:= $(dtb-y)
 dtbinst-dirs	:= $(dts-dirs)
 
@@ -35,8 +29,6 @@ quiet_cmd_dtb_install =	INSTALL $<
 
 install-dir = $(patsubst $(dtbinst-root)%,$(INSTALL_DTBS_PATH)%,$(obj))
 
-$(dtbinst-files) $(dtbinst-dirs): | __dtbs_install_prep
-
 $(dtbinst-files): %.dtb: $(obj)/%.dtb
 	$(call cmd,dtb_install,$(install-dir))
 
-- 
2.7.4

