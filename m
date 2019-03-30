Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:36854 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730384AbfC3MFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Mar 2019 08:05:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/6] memory: squash drivers/memory/Makefile.asm-offsets
Date: Sat, 30 Mar 2019 21:04:18 +0900
Message-Id: <1553947458-8311-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
References: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <treding@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>

drivers/memory/Makefile.asm-offsets is small enough, and included
from a single place.

Squash it into drivers/memory/Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/memory/Makefile             | 5 ++++-
 drivers/memory/Makefile.asm-offsets | 4 ----
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 drivers/memory/Makefile.asm-offsets

diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 90161de..aaf6771 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -28,6 +28,9 @@ ti-emif-sram-objs		:= ti-emif-pm.o ti-emif-sram-pm.o
 
 AFLAGS_ti-emif-sram-pm.o	:=-Wa,-march=armv7-a
 
-include drivers/memory/Makefile.asm-offsets
+include/generated/ti-emif-asm-offsets.h: drivers/memory/emif-asm-offsets.s FORCE
+	$(call filechk,offsets,__TI_EMIF_ASM_OFFSETS_H__)
+
+targets += emif-asm-offsets.s
 
 drivers/memory/ti-emif-sram-pm.o: include/generated/ti-emif-asm-offsets.h
diff --git a/drivers/memory/Makefile.asm-offsets b/drivers/memory/Makefile.asm-offsets
deleted file mode 100644
index 0447e17..0000000
--- a/drivers/memory/Makefile.asm-offsets
+++ /dev/null
@@ -1,4 +0,0 @@
-include/generated/ti-emif-asm-offsets.h: drivers/memory/emif-asm-offsets.s FORCE
-	$(call filechk,offsets,__TI_EMIF_ASM_OFFSETS_H__)
-
-targets += emif-asm-offsets.s
-- 
2.7.4
