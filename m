Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:41822 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfE0OiN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:38:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/5] kconfig: remove always false ifeq ($(KBUILD_DEFCONFIG,) conditional
Date: Mon, 27 May 2019 23:37:21 +0900
Message-Id: <20190527143725.12542-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

With the following two commits applied, all the arch Makefiles
define KBUILD_DEFCONFIG.

- Commit f3e20ad67b4c ("s390: move arch/s390/defconfig to
  arch/s390/configs/defconfig")

- Commit 986a13769c4b ("alpha: move arch/alpha/defconfig to
  arch/alpha/configs/defconfig")

The first conditional in the defconfig rule is always false.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 3f327e21f60e..059642bd6584 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -74,9 +74,7 @@ savedefconfig: $(obj)/conf
 	$< $(silent) --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
-ifeq ($(KBUILD_DEFCONFIG),)
-	$< $(silent) --defconfig $(Kconfig)
-else ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
+ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 else
-- 
2.17.1
