Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:34985 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfG2Uap (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 16:30:45 -0400
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH v2] Makefile: rules for printing kernel architecture and localversion
Date: Mon, 29 Jul 2019 22:30:35 +0200
Message-Id: <1564432235-31100-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com

trivial rule to print out the kernel arch and localversion, so
external tools, like distro packagers, can easily get it.

v2: add help text

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index fa0fbe7..32c8f2a 100644
--- a/Makefile
+++ b/Makefile
@@ -1517,6 +1517,10 @@ help:
 	@echo  'Kernel packaging:'
 	@$(MAKE) $(build)=$(package-dir) help
 	@echo  ''
+	@echo  'Build configuration retrieval:'
+	@echo  '  kernellocalversion  - Print kernel local version (CONFIG_LOCALVERSION)'
+	@echo  '  kernelarch          - Print kernel architecture'
+	@echo  ''
 	@echo  'Documentation targets:'
 	@$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
 	@echo  ''
@@ -1728,6 +1732,12 @@ kernelrelease:
 kernelversion:
 	@echo $(KERNELVERSION)
 
+kernellocalversion:
+	@$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree) | sed -e 's~^\-~~'
+
+kernelarch:
+	@echo $(ARCH)
+
 image_name:
 	@echo $(KBUILD_IMAGE)
 
-- 
1.9.1
