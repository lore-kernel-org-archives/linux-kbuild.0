Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57779 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752696AbeBPSlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:19 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 19/23] kcov: imply GCC_PLUGINS and GCC_PLUGIN_SANCOV instead of select'ing them
Date: Sat, 17 Feb 2018 03:38:47 +0900
Message-Id: <1518806331-7101-20-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

As Documentation/kbuild/kconfig-language.txt notes, 'select' should be
used with care - it forces a lower limit of another symbol, ignoring
the dependency.  In this case, KCOV can select GCC_PLUGINS even if
'depends on HAVE_GCC_PLUGINS' is unmet.

'imply' is modest enough to observe the dependency, and this makes
sense.  If you enable KCOV, you will probably want to enable
GCC_PLUGIN_SANCOV, but it should not break the dependency.

I also remove unneeded code, I just happened to notice.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/Kconfig.debug | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6088408..1216ce6 100644
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

