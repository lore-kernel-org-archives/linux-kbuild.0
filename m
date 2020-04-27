Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:33302 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgD0AcX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Apr 2020 20:32:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: remove unused AS assignment
Date: Mon, 27 Apr 2020 09:30:19 +0900
Message-Id: <20200427003019.2401592-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, Nathan Huckleberry <nhuck15@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org

$(AS) is not used anywhere, hence commit aa824e0c962b ("kbuild: remove
AS variable") killed it.

Remove the left-over code in arch/{arm,arm64}/Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm/Makefile   | 2 --
 arch/arm64/Makefile | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 7d5cd0f85461..cd28211f1418 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -45,12 +45,10 @@ endif
 ifeq ($(CONFIG_CPU_BIG_ENDIAN),y)
 KBUILD_CPPFLAGS	+= -mbig-endian
 CHECKFLAGS	+= -D__ARMEB__
-AS		+= -EB
 KBUILD_LDFLAGS	+= -EB
 else
 KBUILD_CPPFLAGS	+= -mlittle-endian
 CHECKFLAGS	+= -D__ARMEL__
-AS		+= -EL
 KBUILD_LDFLAGS	+= -EL
 endif
 
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 85e4149cc5d5..d86cc9137539 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -84,7 +84,6 @@ KBUILD_CFLAGS += $(branch-prot-flags-y)
 ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
 KBUILD_CPPFLAGS	+= -mbig-endian
 CHECKFLAGS	+= -D__AARCH64EB__
-AS		+= -EB
 # Prefer the baremetal ELF build target, but not all toolchains include
 # it so fall back to the standard linux version if needed.
 KBUILD_LDFLAGS	+= -EB $(call ld-option, -maarch64elfb, -maarch64linuxb)
@@ -92,7 +91,6 @@ UTS_MACHINE	:= aarch64_be
 else
 KBUILD_CPPFLAGS	+= -mlittle-endian
 CHECKFLAGS	+= -D__AARCH64EL__
-AS		+= -EL
 # Same as above, prefer ELF but fall back to linux target if needed.
 KBUILD_LDFLAGS	+= -EL $(call ld-option, -maarch64elf, -maarch64linux)
 UTS_MACHINE	:= aarch64
-- 
2.25.1
