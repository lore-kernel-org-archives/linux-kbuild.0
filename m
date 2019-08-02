Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:16789 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731757AbfHBKYn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Aug 2019 06:24:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: revive single target %.ko
Date: Fri,  2 Aug 2019 19:23:58 +0900
Message-Id: <20190802102358.28408-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Don Brace <don.brace@microsemi.com>, Arend Van Spriel <arend.vanspriel@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

I removed the single target %.ko in commit ff9b45c55b26 ("kbuild:
modpost: read modules.order instead of $(MODVERDIR)/*.mod") because
the modpost stage does not work reliably. For instance, the module
dependency, modversion, etc. do not work if we lack symbol information
from the other modules.

Yet, some people still want to build only one module in their interest,
and it may be still useful if it is used within those limitations.

Fixes: ff9b45c55b26 ("kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod")
Reported-by: Don Brace <don.brace@microsemi.com>
Reported-by: Arend Van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 571cf862d7a4..e4c7211f5a3b 100644
--- a/Makefile
+++ b/Makefile
@@ -997,6 +997,8 @@ endif
 
 PHONY += prepare0
 
+export MODORDER := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
+
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
@@ -1766,6 +1768,10 @@ build-dir = $(patsubst %/,%,$(dir $(build-target)))
 	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
 %.symtypes: prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.ko: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
+	$(Q)echo $(build-target) > $(MODORDER)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost || { rm -f $(MODORDER); false; }
 
 # Modules
 PHONY += /
-- 
2.17.1
