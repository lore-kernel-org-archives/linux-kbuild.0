Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52060 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932121AbeGHPUH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 11:20:07 -0400
From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/9] um: stop abusing KBUILD_KCONFIG
Date: Sun,  8 Jul 2018 08:19:56 -0700
Message-Id: <20180708152004.21679-2-hch@lst.de>
In-Reply-To: <20180708152004.21679-1-hch@lst.de>
References: <20180708152004.21679-1-hch@lst.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org

Instead create a arch/um/Kconfig file that just includes the actual
per-arch Kconfig file.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/Kconfig     | 3 +++
 arch/um/Makefile    | 2 --
 arch/x86/um/Kconfig | 5 -----
 3 files changed, 3 insertions(+), 7 deletions(-)
 create mode 100644 arch/um/Kconfig

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
new file mode 100644
index 000000000000..24607af202dc
--- /dev/null
+++ b/arch/um/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+source "arch/$(SUBARCH)/um/Kconfig"
diff --git a/arch/um/Makefile b/arch/um/Makefile
index e54dda8a0363..0207f6316d71 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -113,8 +113,6 @@ define archhelp
   echo '		   find in the kernel root.'
 endef
 
-KBUILD_KCONFIG := $(HOST_DIR)/um/Kconfig
-
 archheaders:
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
 	            kbuild-file=$(HOST_DIR)/include/asm/Kbuild \
diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
index 9d529f22fd9d..7e509c83d80d 100644
--- a/arch/x86/um/Kconfig
+++ b/arch/x86/um/Kconfig
@@ -1,9 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-mainmenu "User Mode Linux/$(SUBARCH) $(KERNELVERSION) Kernel Configuration"
-
-comment "Compiler: $(CC_VERSION_TEXT)"
-
-source "scripts/Kconfig.include"
 
 source "arch/um/Kconfig.common"
 
-- 
2.18.0

