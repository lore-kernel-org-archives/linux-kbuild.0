Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44829 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752090AbeC0FcF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:05 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 16/21] kcov: imply GCC_PLUGINS and GCC_PLUGIN_SANCOV instead of select'ing them
Date: Tue, 27 Mar 2018 14:29:30 +0900
Message-Id: <1522128575-5326-17-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

As Documentation/kbuild/kconfig-language.txt notes, 'select' should be
used with care - it forces a lower limit of another symbol, ignoring
the dependency.  In this case, KCOV can select GCC_PLUGINS even if
'depends on HAVE_GCC_PLUGINS' is unmet.

'imply' is modest enough to observe the dependency, and this makes
sense.  If you enable KCOV, you will probably want to enable
GCC_PLUGIN_SANCOV, but it should not break the dependency.

I also remove unneeded code, I just happened to notice.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
  - Drop depends on GCC_VERSION

---

Changes in v2: None

 lib/Kconfig.debug | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5be22e4..8243c9d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -743,8 +743,8 @@ config KCOV
 	bool "Code coverage for fuzzing"
 	depends on ARCH_HAS_KCOV
 	select DEBUG_FS
-	select GCC_PLUGINS if !COMPILE_TEST
-	select GCC_PLUGIN_SANCOV if !COMPILE_TEST
+	imply GCC_PLUGINS
+	imply GCC_PLUGIN_SANCOV
 	help
 	  KCOV exposes kernel code coverage information in a form suitable
 	  for coverage-guided fuzzing (randomized testing).
@@ -758,7 +758,6 @@ config KCOV
 config KCOV_ENABLE_COMPARISONS
 	bool "Enable comparison operands collection by KCOV"
 	depends on KCOV
-	default n
 	help
 	  KCOV also exposes operands of every comparison in the instrumented
 	  code along with operand sizes and PCs of the comparison instructions.
@@ -768,7 +767,7 @@ config KCOV_ENABLE_COMPARISONS
 config KCOV_INSTRUMENT_ALL
 	bool "Instrument all code by default"
 	depends on KCOV
-	default y if KCOV
+	default y
 	help
 	  If you are doing generic system call fuzzing (like e.g. syzkaller),
 	  then you will want to instrument the whole kernel and you should
-- 
2.7.4

