Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:30575 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgBPPUO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 10:20:14 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: remove cc-option switch from -Wframe-larger-than=
Date: Mon, 17 Feb 2020 00:19:36 +0900
Message-Id: <20200216151936.23778-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com

This CONFIG option was added by commit 35bb5b1e0e84 ("Add option to
enable -Wframe-larger-than= on gcc 4.4"). At that time, the cc-option
check was needed.

According to Documentation/process/changes.rst, the current minimal
supported version of GCC is 4.6, so you can assume GCC supports it.
Clang supports it as well.

Remove the cc-option switch and redundant comments.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile          | 2 +-
 lib/Kconfig.debug | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 84b71845c43f..8f15926b83bb 100644
--- a/Makefile
+++ b/Makefile
@@ -728,7 +728,7 @@ KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
 endif
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
+KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
 endif
 
 stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 69def4a9df00..fb6b93ffdf77 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -266,7 +266,7 @@ config ENABLE_MUST_CHECK
 	  attribute warn_unused_result" messages.
 
 config FRAME_WARN
-	int "Warn for stack frames larger than (needs gcc 4.4)"
+	int "Warn for stack frames larger than"
 	range 0 8192
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
 	default 1280 if (!64BIT && PARISC)
@@ -276,7 +276,6 @@ config FRAME_WARN
 	  Tell gcc to warn at build time for stack frames larger than this.
 	  Setting this too low will cause a lot of warnings.
 	  Setting it to 0 disables the warning.
-	  Requires gcc 4.4
 
 config STRIP_ASM_SYMS
 	bool "Strip assembler-generated symbols during link"
-- 
2.17.1
