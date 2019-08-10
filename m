Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34527 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfHJPyo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:44 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 04/11] kbuild: remove 'make /' support
Date: Sun, 11 Aug 2019 00:53:00 +0900
Message-Id: <20190810155307.29322-5-yamada.masahiro@socionext.com>
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

'make /' is just an alias for 'make ./'; this builds all objects of an
external module, but skips the modpost stage.

I am not a big fan of 'make /' since it looks as if it were touching
the root directory of the system. I like 'make ./' better.

I do not know how many people are using it, but let's show a hint if
it is used. Also, move it close to the external module rules since
this only makes sense for external modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 24c9ed272b5f..86afce391582 100644
--- a/Makefile
+++ b/Makefile
@@ -1648,6 +1648,10 @@ $(clean-dirs):
 
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
 
+PHONY += /
+/:
+	@echo >&2 '"$(MAKE) /" is no longer supported. Please use "$(MAKE) ./" instead.'
+
 PHONY += help
 help:
 	@echo  '  Building external modules.'
@@ -1783,11 +1787,6 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
 	$(Q)echo $(build-target) > $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-
-# Modules
-PHONY += /
-/: ./
-
 %/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1
 
-- 
2.17.1
