Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:59325 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfBGQlU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 11:41:20 -0500
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 1/4] Makefile: add kernelarch rule that prints the kernel architecture and localversion
Date: Thu,  7 Feb 2019 17:40:56 +0100
Message-Id: <1549557659-19137-2-git-send-email-info@metux.net>
In-Reply-To: <1549557659-19137-1-git-send-email-info@metux.net>
References: <1549557659-19137-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

trivial rule to print out the kernel arch and localversion, so external tools,
like distro packagers, can easily get it.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 3142e67..2719907 100644
--- a/Makefile
+++ b/Makefile
@@ -1664,6 +1664,12 @@ kernelrelease:
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
