Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:54141 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751651AbeBBQQ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:16:59 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/7] [HACK] lto: make config.gz symbol visible
Date: Fri,  2 Feb 2018 17:15:39 +0100
Message-Id: <20180202161550.2106846-2-arnd@arndb.de>
In-Reply-To: <20180202161550.2106846-1-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Nicolas Pitre <nico@linaro.org>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

building with LTO enabled, I often get warnings about kernel/configs.c
being empty when CONFIG_IKCONFIG is disabled:

x86_64-linux/bin/nm: kernel/configs.o: no symbols

Making the symbol visible is probably not the right solution, but
it does get rid of the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/Makefile b/kernel/Makefile
index 7666ee88e237..40b48e3e87a2 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -120,7 +120,7 @@ targets += config_data.gz
 $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
 	$(call if_changed,gzip)
 
-      filechk_ikconfiggz = (echo "static const char kernel_config_data[] __used = MAGIC_START"; cat $< | scripts/basic/bin2c; echo "MAGIC_END;")
+      filechk_ikconfiggz = (echo "const char kernel_config_data[] __used __visible = MAGIC_START"; cat $< | scripts/basic/bin2c; echo "MAGIC_END;")
 targets += config_data.h
 $(obj)/config_data.h: $(obj)/config_data.gz FORCE
 	$(call filechk,ikconfiggz)
-- 
2.9.0

