Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39995 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 29/37] modpost: move -d option in scripts/Makefile.modpost
Date: Mon,  1 Jun 2020 14:57:23 +0900
Message-Id: <20200601055731.3006266-29-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

Collect options for modules into a single place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index bc9a03e8208d..b0c3634ff462 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -62,9 +62,6 @@ __modpost: vmlinux.symvers
 
 else
 
-MODPOST += \
-	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
-
 ifeq ($(KBUILD_EXTMOD),)
 
 input-symdump := vmlinux.symvers
@@ -91,6 +88,7 @@ endif
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
 	$(addprefix -i ,$(wildcard $(input-symdump))) \
+	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS)) \
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
 
 ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
-- 
2.25.1
