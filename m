Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57780 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752718AbeBPSlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:19 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 16/23] kbuild: add clang-version.sh
Date: Sat, 17 Feb 2018 03:38:44 +0900
Message-Id: <1518806331-7101-17-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

From: Sami Tolvanen <samitolvanen@google.com>

Based on gcc-version.sh, clang-version.sh prints out the correct
version of clang.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/clang-version.sh | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100755 scripts/clang-version.sh

diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
new file mode 100755
index 0000000..9780efa
--- /dev/null
+++ b/scripts/clang-version.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# clang-version [-p] clang-command
+#
+# Prints the compiler version of `clang-command' in a canonical 4-digit form
+# such as `0500' for clang-5.0 etc.
+#
+# With the -p option, prints the patchlevel as well, for example `050001' for
+# clang-5.0.1 etc.
+#
+
+if [ "$1" = "-p" ] ; then
+	with_patchlevel=1;
+	shift;
+fi
+
+compiler="$*"
+
+if [ ${#compiler} -eq 0 ]; then
+	echo "Error: No compiler specified."
+	printf "Usage:\n\t$0 <clang-command>\n"
+	exit 1
+fi
+
+MAJOR=$(echo __clang_major__ | $compiler -E -x c - | tail -n 1)
+MINOR=$(echo __clang_minor__ | $compiler -E -x c - | tail -n 1)
+if [ "x$with_patchlevel" != "x" ] ; then
+	PATCHLEVEL=$(echo __clang_patchlevel__ | $compiler -E -x c - | tail -n 1)
+	printf "%02d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
+else
+	printf "%02d%02d\\n" $MAJOR $MINOR
+fi
-- 
2.7.4

