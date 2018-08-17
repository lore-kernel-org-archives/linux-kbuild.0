Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:47223 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbeHQFji (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Aug 2018 01:39:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove "rpm" target, which is alias of "rpm-pkg"
Date: Fri, 17 Aug 2018 11:37:21 +0900
Message-Id: <1534473441-16755-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

As commit ebaad7d36406 ("kbuild: rpm: prompt to use "rpm-pkg" if "rpm"
target is used") noticed, the "rpm" target is now removed.
I assume people have already migrated to "rpm-pkg".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index a0650bf..6833b96 100644
--- a/Makefile
+++ b/Makefile
@@ -1338,16 +1338,12 @@ distclean: mrproper
 
 # Packaging of the kernel to various formats
 # ---------------------------------------------------------------------------
-# rpm target kept for backward compatibility
 package-dir	:= scripts/package
 
 %src-pkg: FORCE
 	$(Q)$(MAKE) $(build)=$(package-dir) $@
 %pkg: include/config/kernel.release FORCE
 	$(Q)$(MAKE) $(build)=$(package-dir) $@
-rpm: rpm-pkg
-	@echo "  WARNING: \"rpm\" target will be removed after Linux 4.18"
-	@echo "           Please use \"rpm-pkg\" instead."
 
 
 # Brief documentation of the typical targets used
-- 
2.7.4
