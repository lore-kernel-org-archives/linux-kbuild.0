Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:37642 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAGCO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 02:02:14 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: invoke syncconfig if autoconf.h is missing
Date: Fri,  1 May 2020 15:01:41 +0900
Message-Id: <20200501060141.1924489-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

If include/generated/autoconf.h is accidentally lost somehow,
there is no clear way to fix it. Make it self-healing.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9ff00bfe0575..f0b6f9fd5d25 100644
--- a/Makefile
+++ b/Makefile
@@ -698,7 +698,7 @@ $(KCONFIG_CONFIG):
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
-%/auto.conf %/auto.conf.cmd: $(KCONFIG_CONFIG)
+%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
 else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
@@ -1141,7 +1141,8 @@ scripts: scripts_basic scripts_dtc
 PHONY += prepare archprepare
 
 archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
-	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
+	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
+	include/generated/autoconf.h
 
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
-- 
2.25.1
