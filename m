Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:46529 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbdK3Xig (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:38:36 -0500
Received: by mail-io0-f194.google.com with SMTP id x129so9381781iod.13
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:38:36 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 1/2] kbuild: add clang-version.sh
Date: Thu, 30 Nov 2017 15:38:26 -0800
Message-Id: <20171130233827.130069-2-samitolvanen@google.com>
In-Reply-To: <20171130233827.130069-1-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
 <20171130233827.130069-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

Based on gcc-version.sh, clang-version.sh prints out the correct
version of clang.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/clang-version.sh | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100755 scripts/clang-version.sh

diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
new file mode 100755
index 000000000000..9780efa56980
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
2.15.0.531.g2ccb3012c9-goog

