Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:34369 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbfDLDKc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 23:10:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] memory: ti-emif-sram: move driver-specific asm-offset.h to drivers/memory/
Date: Fri, 12 Apr 2019 12:09:41 +0900
Message-Id: <20190412030941.11373-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <treding@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, Dmitry Osipenko <digetx@gmail.com>

<generated/ti-emif-asm-offsets.h> is only generated and included
by drivers/memory/, so it does not need to reside in the globally
visible include/generated/.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will apply this to linux-kbuild since this depends on
another patch there.


 drivers/memory/.gitignore        | 1 +
 drivers/memory/Makefile          | 5 +++--
 drivers/memory/ti-emif-sram-pm.S | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 drivers/memory/.gitignore

diff --git a/drivers/memory/.gitignore b/drivers/memory/.gitignore
new file mode 100644
index 000000000000..cbca8b028437
--- /dev/null
+++ b/drivers/memory/.gitignore
@@ -0,0 +1 @@
+ti-emif-asm-offsets.h
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 91ae4eb0e913..2eb0a5b44bb9 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -28,9 +28,10 @@ ti-emif-sram-objs		:= ti-emif-pm.o ti-emif-sram-pm.o
 
 AFLAGS_ti-emif-sram-pm.o	:=-Wa,-march=armv7-a
 
-drivers/memory/ti-emif-sram-pm.o: include/generated/ti-emif-asm-offsets.h
+$(obj)/ti-emif-sram-pm.o: $(obj)/ti-emif-asm-offsets.h
 
-include/generated/ti-emif-asm-offsets.h: drivers/memory/emif-asm-offsets.s FORCE
+$(obj)/ti-emif-asm-offsets.h: $(obj)/emif-asm-offsets.s FORCE
 	$(call filechk,offsets,__TI_EMIF_ASM_OFFSETS_H__)
 
 targets += emif-asm-offsets.s
+clean-files += ti-emif-asm-offsets.h
diff --git a/drivers/memory/ti-emif-sram-pm.S b/drivers/memory/ti-emif-sram-pm.S
index a5369181e5c2..615cd6247739 100644
--- a/drivers/memory/ti-emif-sram-pm.S
+++ b/drivers/memory/ti-emif-sram-pm.S
@@ -14,12 +14,12 @@
  * GNU General Public License for more details.
  */
 
-#include <generated/ti-emif-asm-offsets.h>
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/memory.h>
 
 #include "emif.h"
+#include "ti-emif-asm-offsets.h"
 
 #define EMIF_POWER_MGMT_WAIT_SELF_REFRESH_8192_CYCLES	0x00a0
 #define EMIF_POWER_MGMT_SR_TIMER_MASK			0x00f0
-- 
2.17.1
