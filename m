Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44794 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752048AbeC0FcE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 02/21] kbuild: remove CONFIG_CROSS_COMPILE support
Date: Tue, 27 Mar 2018 14:29:16 +0900
Message-Id: <1522128575-5326-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Kbuild provides a couple of ways to specify CROSS_COMPILE:

[1] Command line
[2] Environment
[3] arch/*/Makefile (only some architectures)
[4] CONFIG_CROSS_COMPILE

[4] is problematic for the compiler capability tests in Kconfig.
CONFIG_CROSS_COMPILE allows users to change the compiler prefix from
'make menuconfig', etc.  It means, the compiler options would have
to be all re-calculated everytime CONFIG_CROSS_COMPILE is changed.

To avoid complexity and performance issues, I'd like to evaluate
the shell commands statically, i.e. only parsing Kconfig files.

I guess the majority is [1] or [2].  Currently, there are only
4 defconfig files that specify CONFIG_CROSS_COMPILE.
  arch/arm/configs/lpc18xx_defconfig
  arch/hexagon/configs/comet_defconfig
  arch/openrisc/configs/or1ksim_defconfig
  arch/openrisc/configs/simple_smp_defconfig

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Makefile     | 3 ---
 init/Kconfig | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/Makefile b/Makefile
index c55cf95..5c395ed 100644
--- a/Makefile
+++ b/Makefile
@@ -316,12 +316,9 @@ SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
 # CROSS_COMPILE can be set on the command line
 # make CROSS_COMPILE=ia64-linux-
 # Alternatively CROSS_COMPILE can be set in the environment.
-# A third alternative is to store a setting in .config so that plain
-# "make" in the configured kernel build directory always uses that.
 # Default value for CROSS_COMPILE is not to prefix executables
 # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
 ARCH		?= $(SUBARCH)
-CROSS_COMPILE	?= $(CONFIG_CROSS_COMPILE:"%"=%)
 
 # Architecture as present in compile.h
 UTS_MACHINE 	:= $(ARCH)
diff --git a/init/Kconfig b/init/Kconfig
index e37f4b2..df18492 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -54,15 +54,6 @@ config INIT_ENV_ARG_LIMIT
 	  Maximum of each of the number of arguments and environment
 	  variables passed to init from the kernel command line.
 
-
-config CROSS_COMPILE
-	string "Cross-compiler tool prefix"
-	help
-	  Same as running 'make CROSS_COMPILE=prefix-' but stored for
-	  default make runs in this kernel build directory.  You don't
-	  need to set this unless you want the configured kernel build
-	  directory to select the cross-compiler automatically.
-
 config COMPILE_TEST
 	bool "Compile also drivers which will not load"
 	depends on !UML
-- 
2.7.4

