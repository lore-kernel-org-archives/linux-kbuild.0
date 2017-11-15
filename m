Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:25523 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbdKOJUw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 04:20:52 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: rpm: prompt to use "rpm-pkg" if "rpm" target is used
Date: Wed, 15 Nov 2017 18:19:20 +0900
Message-Id: <1510737560-12643-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The "rpm" has been kept for backward compatibility since pre-git era.
I am planning to remove it after the Linux 4.18 release.  Annouce the
end of the support, prompting to use "rpm-pkg" instead.

If you use "rpm", it will work like "rpm-pkg", but warning messages
will be displayed as follows:

  WARNING: "rpm" target will be removed after Linux 4.18
           Please use "rpm-pkg" instead.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                 | 5 +++--
 scripts/package/Makefile | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 37aafbd..c01763e 100644
--- a/Makefile
+++ b/Makefile
@@ -1336,8 +1336,9 @@ package-dir	:= scripts/package
 	$(Q)$(MAKE) $(build)=$(package-dir) $@
 %pkg: include/config/kernel.release FORCE
 	$(Q)$(MAKE) $(build)=$(package-dir) $@
-rpm: include/config/kernel.release FORCE
-	$(Q)$(MAKE) $(build)=$(package-dir) $@
+rpm: rpm-pkg
+	@echo "  WARNING: \"rpm\" target will be removed after Linux 4.18"
+	@echo "           Please use \"rpm-pkg\" instead."
 
 
 # Brief documentation of the typical targets used
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index c30bcf8..c235349 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -45,7 +45,7 @@ rm -f $(objtree)/.scmversion
 
 # rpm-pkg
 # ---------------------------------------------------------------------------
-rpm-pkg rpm: FORCE
+rpm-pkg: FORCE
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
-- 
2.7.4

