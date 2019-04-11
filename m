Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:35824 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDKOdQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 10:33:16 -0400
From: Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V1 3/3] kbuild: remove stale modules from install area
Date: Thu, 11 Apr 2019 07:20:15 -0700
Message-Id: <1554992415-292288-4-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
References: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: Steve Sistare <steven.sistare@oracle.com>

During install_modules, remove modules from the install/kernel area that are
not present in modules.order.  This can occur after changing config options.
Also remove any unrecognized files.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 Makefile | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8f58e27..7d64cab 100644
--- a/Makefile
+++ b/Makefile
@@ -1297,11 +1297,26 @@ _modinst_:
 	@cp -f $(objtree)/modules.builtin $(MODLIB)/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
+# Remove any files in the install area which are not listed in modules.order.
+# This can occur after changing config options.
+
+PHONY += _modinst_remove
+_modinst_remove: _modinst_
+	@declare -A mods; \
+	while read buf ; do \
+		mods[$$buf]=1; \
+	done < $(objtree)/modules.order; \
+	cd $(MODLIB); \
+	find kernel -not -type d | \
+	while read x ; do \
+		[[ -z "$${mods[$$x]}" ]] && rm $$x; \
+	done || true
+
 # This depmod is only for convenience to give the initial
 # boot a modules.dep even before / is mounted read-write.  However the
 # boot script depmod is the master version.
 PHONY += _modinst_post
-_modinst_post: _modinst_
+_modinst_post: _modinst_remove
 	$(call cmd,depmod)
 
 ifeq ($(CONFIG_MODULE_SIG), y)
-- 
1.8.3.1
