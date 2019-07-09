Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:36681 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfGIJc5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:57 -0400
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 1/4] Makefile: rules for printing kernel architecture and localversion
Date: Tue,  9 Jul 2019 11:32:36 +0200
Message-Id: <1562664759-16009-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, info@metux.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com

trivial rule to print out the kernel arch and localversion, so
external tools, like distro packagers, can easily get it.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 3e4868a..5afc3de 100644
--- a/Makefile
+++ b/Makefile
@@ -1706,6 +1706,12 @@ kernelrelease:
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
