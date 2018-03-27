Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:45156 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752171AbeC0FcQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 20/21] gcc-plugins: enable GCC_PLUGINS for COMPILE_TEST
Date: Tue, 27 Mar 2018 14:29:34 +0900
Message-Id: <1522128575-5326-21-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The plugin availability is checked in Kconfig, so all{yes,mod}config
will not be bothered.  Remove 'depends on !COMPILE_TEST'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Remove more 'depends on'

 arch/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 88cc925..b07094c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -414,7 +414,6 @@ menuconfig GCC_PLUGINS
 	bool "GCC plugins"
 	depends on HAVE_GCC_PLUGINS
 	depends on $(success $srctree/scripts/gcc-plugin.sh $HOSTCXX $CC)
-	depends on !COMPILE_TEST
 	help
 	  GCC plugins are loadable modules that provide extra features to the
 	  compiler. They are useful for runtime instrumentation and static analysis.
@@ -424,7 +423,6 @@ menuconfig GCC_PLUGINS
 config GCC_PLUGIN_CYC_COMPLEXITY
 	bool "Compute the cyclomatic complexity of a function" if EXPERT
 	depends on GCC_PLUGINS
-	depends on !COMPILE_TEST
 	help
 	  The complexity M of a function's control flow graph is defined as:
 	   M = E - N + 2P
@@ -487,7 +485,6 @@ config GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
 config GCC_PLUGIN_STRUCTLEAK_VERBOSE
 	bool "Report forcefully initialized variables"
 	depends on GCC_PLUGIN_STRUCTLEAK
-	depends on !COMPILE_TEST
 	help
 	  This option will cause a warning to be printed each time the
 	  structleak plugin finds a variable it thinks needs to be
@@ -527,7 +524,6 @@ config GCC_PLUGIN_RANDSTRUCT
 config GCC_PLUGIN_RANDSTRUCT_PERFORMANCE
 	bool "Use cacheline-aware structure randomization"
 	depends on GCC_PLUGIN_RANDSTRUCT
-	depends on !COMPILE_TEST
 	help
 	  If you say Y here, the RANDSTRUCT randomization will make a
 	  best effort at restricting randomization to cacheline-sized
-- 
2.7.4

