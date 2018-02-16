Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57776 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752697AbeBPSlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:19 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 17/23] kconfig: add CC_IS_CLANG and CLANG_VERSION
Date: Sat, 17 Feb 2018 03:38:45 +0900
Message-Id: <1518806331-7101-18-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This will be useful to describe the clang version dependency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 init/Kconfig             |  8 ++++++++
 scripts/clang-version.sh | 24 +++++++++++-------------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index f2da5e9..1b751bc 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -21,6 +21,14 @@ config GCC_VERSION
 	default $(shell-stdout $srctree/scripts/gcc-version.sh -p $CC | sed 's/^0*//') if CC_IS_GCC
 	default 0
 
+config CC_IS_CLANG
+	bool
+	default $(shell $CC --version | grep -q clang)
+
+config CLANG_VERSION
+	int
+	default $(shell-stdout $srctree/scripts/clang-version.sh $CC)
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

