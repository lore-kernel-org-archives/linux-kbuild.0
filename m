Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:64383 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393468AbfBNDGF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Feb 2019 22:06:05 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/8] kbuild: set KBUILD_MODULES=1 all the time for single target %/
Date: Thu, 14 Feb 2019 12:05:16 +0900
Message-Id: <1550113521-23577-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

It is fine to set KBUILD_MODULES=1 when CONFIG_MODULES is disabled.
It is actually how "make allnoconfig all" works.

On the other hand, KBUILD_MODULES=1 is unneeded for the %.ko pattern.
It is just a matter of whether modules.order is generated or not.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 3cf253d..fe62de3 100644
--- a/Makefile
+++ b/Makefile
@@ -1710,16 +1710,13 @@ endif
 
 # Modules
 /: prepare FORCE
-	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
-	$(build)=$(build-dir)
+	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
 # Make sure the latest headers are built for Documentation
 Documentation/ samples/: headers_install
 %/: prepare FORCE
-	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
-	$(build)=$(build-dir)
+	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
 %.ko: prepare FORCE
-	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)   \
-	$(build)=$(build-dir) $(@:.ko=.o)
+	$(Q)$(MAKE) $(build)=$(build-dir) $(@:.ko=.o)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 # FIXME Should go into a make.lib or something
-- 
2.7.4
