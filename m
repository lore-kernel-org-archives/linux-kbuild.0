Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:41768 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758988AbdKOVeq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:34:46 -0500
Received: by mail-io0-f195.google.com with SMTP id g73so3073622ioj.8
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:34:46 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 03/18] kbuild: move gcc-version.sh to cc-version.sh and add clang support
Date: Wed, 15 Nov 2017 13:34:13 -0800
Message-Id: <20171115213428.22559-4-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Kbuild.include |  4 ++--
 scripts/cc-version.sh  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/gcc-version.sh | 33 ---------------------------------
 3 files changed, 47 insertions(+), 35 deletions(-)
 create mode 100755 scripts/cc-version.sh
 delete mode 100755 scripts/gcc-version.sh

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 584d6cecd7c0..de41ab74121e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -143,11 +143,11 @@ cc-disable-warning = $(call try-run,\
 cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
 
 # cc-version
-cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
+cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/cc-version.sh $(CC))
 
 # cc-fullversion
 cc-fullversion = $(shell $(CONFIG_SHELL) \
-	$(srctree)/scripts/gcc-version.sh -p $(CC))
+	$(srctree)/scripts/cc-version.sh -p $(CC))
 
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
new file mode 100755
index 000000000000..6d085a8a07e8
--- /dev/null
+++ b/scripts/cc-version.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# cc-version [-p] cc-command
+#
+# Prints the compiler version of `command' in a canonical 4-digit form
+# such as `0295' for gcc-2.95, `0303' for gcc-3.3, etc.
+#
+# With the -p option, prints the patchlevel as well, for example `029503' for
+# gcc-2.95.3, `030301' for gcc-3.3.1, etc.
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
+	printf "Usage:\n\t$0 <cc-command>\n"
+	exit 1
+fi
+
+clang=$(echo __clang__ | $compiler -E -x c - | tail -n1)
+
+if [ "$clang" == "1" ]; then
+	major_macro="__clang_major__"
+	minor_macro="__clang_minor__"
+	patchlevel_macro="__clang_patchlevel__"
+else
+	major_macro="__GNUC__"
+	minor_macro="__GNUC_MINOR__"
+	patchlevel_macro="__GNUC_PATCHLEVEL__"
+fi
+
+MAJOR=$(echo $major_macro | $compiler -E -x c - | tail -n 1)
+MINOR=$(echo $minor_macro | $compiler -E -x c - | tail -n 1)
+if [ "x$with_patchlevel" != "x" ] ; then
+	PATCHLEVEL=$(echo $patchlevel_macro | $compiler -E -x c - | tail -n 1)
+	printf "%02d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
+else
+	printf "%02d%02d\\n" $MAJOR $MINOR
+fi
diff --git a/scripts/gcc-version.sh b/scripts/gcc-version.sh
deleted file mode 100755
index 11bb909845e7..000000000000
--- a/scripts/gcc-version.sh
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# gcc-version [-p] gcc-command
-#
-# Prints the gcc version of `gcc-command' in a canonical 4-digit form
-# such as `0295' for gcc-2.95, `0303' for gcc-3.3, etc.
-#
-# With the -p option, prints the patchlevel as well, for example `029503' for
-# gcc-2.95.3, `030301' for gcc-3.3.1, etc.
-#
-
-if [ "$1" = "-p" ] ; then
-	with_patchlevel=1;
-	shift;
-fi
-
-compiler="$*"
-
-if [ ${#compiler} -eq 0 ]; then
-	echo "Error: No compiler specified."
-	printf "Usage:\n\t$0 <gcc-command>\n"
-	exit 1
-fi
-
-MAJOR=$(echo __GNUC__ | $compiler -E -x c - | tail -n 1)
-MINOR=$(echo __GNUC_MINOR__ | $compiler -E -x c - | tail -n 1)
-if [ "x$with_patchlevel" != "x" ] ; then
-	PATCHLEVEL=$(echo __GNUC_PATCHLEVEL__ | $compiler -E -x c - | tail -n 1)
-	printf "%02d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-else
-	printf "%02d%02d\\n" $MAJOR $MINOR
-fi
-- 
2.15.0.448.gf294e3d99a-goog

