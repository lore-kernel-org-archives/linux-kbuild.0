Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:46446 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbeC0Fc7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:59 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 21/21] arm64: move GCC version check for ARCH_SUPPORTS_INT128 to Kconfig
Date: Tue, 27 Mar 2018 14:29:35 +0900
Message-Id: <1522128575-5326-22-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This becomes much neater in Kconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 arch/arm64/Kconfig  | 1 +
 arch/arm64/Makefile | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7381eeb..0c97f40 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -43,6 +43,7 @@ config ARM64
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 50000
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b481b4a..7318165 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -57,8 +57,6 @@ KBUILD_AFLAGS	+= $(lseinstr) $(brokengasinst)
 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 
-KBUILD_CFLAGS	+= $(call cc-ifversion, -ge, 0500, -DCONFIG_ARCH_SUPPORTS_INT128)
-
 ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
 KBUILD_CPPFLAGS	+= -mbig-endian
 CHECKFLAGS	+= -D__AARCH64EB__
-- 
2.7.4

