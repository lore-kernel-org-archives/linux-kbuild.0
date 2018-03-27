Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44599 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751805AbeC0FcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 12/21] kconfig: show compiler version text in the top comment
Date: Tue, 27 Mar 2018 14:29:26 +0900
Message-Id: <1522128575-5326-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The kernel configuration phase is now tightly coupled with the compiler
in use.  It will be nice to show the compiler information in Kconfig.

The compiler information will be displayed like this:

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- config
  scripts/kconfig/conf  --oldaskconfig Kconfig
  *
  * Linux/arm64 4.16.0-rc1 Kernel Configuration
  *
  *
  * Compiler: aarch64-linux-gnu-gcc (Linaro GCC 7.2-2017.11) 7.2.1 20171011
  *
  *
  * General setup
  *
  Compile also drivers which will not load (COMPILE_TEST) [N/y/?]

If you use GUI methods such as menuconfig, it will be displayed in the
top menu.

This is simply implemented by using 'comment'.  So, it will be saved
into the .config file as well.

This commit has a very important meaning.  If the compiler is upgraded,
Kconfig must be re-run since different compilers have different sets
of supported options.

All referenced environments are written to include/config/auto.conf.cmd
so that any environment change triggers syncconfig, and prompt the user
to input new values if needed.

With this commit, something like follows will be added to
include/config/auto.conf.cmd

  ifneq "$(CC_VERSION_TEXT)" "aarch64-linux-gnu-gcc (Linaro GCC 7.2-2017.11) 7.2.1 20171011"
  include/config/auto.conf: FORCE
  endif

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Kconfig  | 2 ++
 Makefile | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Kconfig b/Kconfig
index e6ece5b..99ed4b8 100644
--- a/Kconfig
+++ b/Kconfig
@@ -5,4 +5,6 @@
 #
 mainmenu "Linux/$ARCH $KERNELVERSION Kernel Configuration"
 
+comment "Compiler: $CC_VERSION_TEXT"
+
 source "arch/$SRCARCH/Kconfig"
diff --git a/Makefile b/Makefile
index 5cadffa..3dc9eb8 100644
--- a/Makefile
+++ b/Makefile
@@ -450,6 +450,8 @@ export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
 export KBUILD_ARFLAGS
 
+export CC_VERSION_TEXT := $(shell $(CC) --version | head -n 1)
+
 # When compiling out-of-tree modules, put MODVERDIR in the module
 # tree rather than in the kernel tree. The kernel tree might
 # even be read-only.
-- 
2.7.4

