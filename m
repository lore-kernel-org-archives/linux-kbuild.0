Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f201.google.com ([209.85.215.201]:55359 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbfEIUTa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 16:19:30 -0400
Received: by mail-pg1-f201.google.com with SMTP id a8so2351628pgq.22
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 13:19:30 -0700 (PDT)
Date: Thu,  9 May 2019 13:19:21 -0700
Message-Id: <20190509201925.189615-1-ndesaulniers@google.com>
Mime-Version: 1.0
Subject: [PATCH] kbuild: add script check for cross compilation utilities
From: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When cross compiling via setting CROSS_COMPILE, if the prefixed tools
are not found, then the host utilities are often instead invoked, and
produce often difficult to understand errors.  This is most commonly the
case for developers new to cross compiling the kernel that have yet to
install the proper cross compilation toolchain. Rather than charge
headlong into a build that will fail obscurely, check that the tools
exist before starting to compile, and fail with a friendly error
message.

Before:
$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
...
/usr/bin/as: unrecognized option '-EL'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[2]: *** [../scripts/Makefile.build:279: scripts/mod/empty.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/linux/Makefile:1118:
prepare0] Error 2
make: *** [Makefile:179: sub-make] Error 2

After:
$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
$CROSS_COMPILE set to arm-linux-gnueabihf-, but unable to find
arm-linux-gnueabihf-as.
Makefile:522: recipe for target 'outputmakefile' failed
make: *** [outputmakefile] Error 1

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Note: this is probably more generally useful, but after a few minutes
wrestling with Make errors related to "recipe commences before first
target" and "missing separator," I came to understand my hatred of GNU
Make. Open to sugguestions for where better to invoke this from the top
level Makefile.

 Makefile                      |  1 +
 scripts/check_crosscompile.sh | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100755 scripts/check_crosscompile.sh

diff --git a/Makefile b/Makefile
index a61a95b6b38f..774339674b59 100644
--- a/Makefile
+++ b/Makefile
@@ -519,6 +519,7 @@ endif
 
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/check_crosscompile.sh
 CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
diff --git a/scripts/check_crosscompile.sh b/scripts/check_crosscompile.sh
new file mode 100755
index 000000000000..f4586fbfee18
--- /dev/null
+++ b/scripts/check_crosscompile.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# (c) 2019, Nick Desaulniers <ndesaulniers@google.com>
+function check () {
+  # Remove trailing commands, for example arch/arm/Makefile may add `-EL`.
+  utility=$(echo ${1} | awk '{print $1;}')
+  command -v "${utility}" &> /dev/null
+  if [[ $? != 0 ]]; then
+    echo "\$CROSS_COMPILE set to ${CROSS_COMPILE}," \
+      "but unable to find ${utility}."
+    exit 1
+  fi
+}
+utilities=("${AS}" "${LD}" "${CC}" "${AR}" "${NM}" "${STRIP}" "${OBJCOPY}"
+  "${OBJDUMP}")
+for utility in "${utilities[@]}"; do
+  check "${utility}"
+done
-- 
2.21.0.1020.gf2820cf01a-goog
