Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:32689 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgFSEtY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 00:49:24 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] Revert "Makefile: install modules.builtin even if CONFIG_MODULES=n"
Date: Fri, 19 Jun 2020 13:48:23 +0900
Message-Id: <20200619044823.863461-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This reverts commit e0b250b57dcf403529081e5898a9de717f96b76b.

Now that "make install" copies modules.builtin to $(INSTALL_MOD_PATH),
it breaks systems that do not set INSTALL_MOD_PATH for "make install".

While modules.builtin is useful for CONFIG_MODULES=n, this way gives
unexpected impact to existing systems. Maybe "make modules_install"
can install modules.builtin irrespective of CONFIG_MODULES as Jonas
originally suggested. Anyway, this commit should be reverted ASAP.

Reported-by: Douglas Anderson <dianders@chromium.org>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Cc: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 29abe44ada91..9880e911afe3 100644
--- a/Makefile
+++ b/Makefile
@@ -1336,16 +1336,6 @@ dt_binding_check: scripts_dtc
 # ---------------------------------------------------------------------------
 # Modules
 
-# install modules.builtin regardless of CONFIG_MODULES
-PHONY += _builtin_inst_
-_builtin_inst_:
-	@mkdir -p $(MODLIB)/
-	@cp -f modules.builtin $(MODLIB)/
-	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
-
-PHONY += install
-install: _builtin_inst_
-
 ifdef CONFIG_MODULES
 
 # By default, build modules as well
@@ -1389,7 +1379,7 @@ PHONY += modules_install
 modules_install: _modinst_ _modinst_post
 
 PHONY += _modinst_
-_modinst_: _builtin_inst_
+_modinst_:
 	@rm -rf $(MODLIB)/kernel
 	@rm -f $(MODLIB)/source
 	@mkdir -p $(MODLIB)/kernel
@@ -1399,6 +1389,8 @@ _modinst_: _builtin_inst_
 		ln -s $(CURDIR) $(MODLIB)/build ; \
 	fi
 	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
+	@cp -f modules.builtin $(MODLIB)/
+	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
 # This depmod is only for convenience to give the initial
-- 
2.25.1
