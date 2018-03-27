Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44619 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751896AbeC0FcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 08/21] kconfig: replace $UNAME_RELEASE with function call
Date: Tue, 27 Mar 2018 14:29:22 +0900
Message-Id: <1522128575-5326-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Now that 'shell' function is supported, this can be self-contained in
Kconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Makefile     | 3 +--
 init/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 4ae1486..5c395ed 100644
--- a/Makefile
+++ b/Makefile
@@ -284,8 +284,7 @@ include scripts/Kbuild.include
 # Read KERNELRELEASE from include/config/kernel.release (if it exists)
 KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
-UNAME_RELEASE := $(shell uname --release)
-export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION UNAME_RELEASE
+export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
 
 # SUBARCH tells the usermode build what the underlying arch is.  That is set
 # first, and if a usermode build is happening, the "ARCH=um" on the command
diff --git a/init/Kconfig b/init/Kconfig
index b4814e6..0d6fe20 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2,9 +2,9 @@ config DEFCONFIG_LIST
 	string
 	depends on !UML
 	option defconfig_list
-	default "/lib/modules/$UNAME_RELEASE/.config"
+	default "/lib/modules/$(shell uname --release)/.config"
 	default "/etc/kernel-config"
-	default "/boot/config-$UNAME_RELEASE"
+	default "/boot/config-$(shell uname --release)"
 	default ARCH_DEFCONFIG
 	default "arch/$ARCH/defconfig"
 
-- 
2.7.4

