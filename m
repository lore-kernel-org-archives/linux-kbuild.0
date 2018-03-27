Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44827 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751185AbeC0FcF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:05 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 14/21] kconfig: add CC_IS_CLANG and CLANG_VERSION
Date: Tue, 27 Mar 2018 14:29:28 +0900
Message-Id: <1522128575-5326-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This will be useful to describe the clang version dependency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 init/Kconfig             |  7 +++++++
 scripts/clang-version.sh | 24 +++++++++++-------------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 923cab5..5998034 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -22,6 +22,13 @@ config GCC_VERSION
 	default $(shell $srctree/scripts/gcc-version.sh -p $CC | sed 's/^0*//') if CC_IS_GCC
 	default 0
 
+config CC_IS_CLANG
+	def_bool $(success $CC --version | grep -q clang)
+
+config CLANG_VERSION
+	int
+	default $(shell $srctree/scripts/clang-version.sh $CC)
+
 config CONSTRUCTORS
 	bool
 	depends on !UML
diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
index 9780efa..d8002d2 100755
--- a/scripts/clang-version.sh
+++ b/scripts/clang-version.sh
@@ -10,24 +10,22 @@
 # clang-5.0.1 etc.
 #
 
-if [ "$1" = "-p" ] ; then
-	with_patchlevel=1;
-	shift;
-fi
-
 compiler="$*"
 
 if [ ${#compiler} -eq 0 ]; then
-	echo "Error: No compiler specified."
-	printf "Usage:\n\t$0 <clang-command>\n"
+	echo "Error: No compiler specified." >&2
+	printf "Usage:\n\t$0 <clang-command>\n" >&2
+	echo 0
+	exit 1
+fi
+
+if !( $compiler --version | grep -q clang) ; then
+	echo "This is not clang." >&2
+	echo 0
 	exit 1
 fi
 
 MAJOR=$(echo __clang_major__ | $compiler -E -x c - | tail -n 1)
 MINOR=$(echo __clang_minor__ | $compiler -E -x c - | tail -n 1)
-if [ "x$with_patchlevel" != "x" ] ; then
-	PATCHLEVEL=$(echo __clang_patchlevel__ | $compiler -E -x c - | tail -n 1)
-	printf "%02d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-else
-	printf "%02d%02d\\n" $MAJOR $MINOR
-fi
+PATCHLEVEL=$(echo __clang_patchlevel__ | $compiler -E -x c - | tail -n 1)
+printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-- 
2.7.4

