Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:37864 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751513AbdK3Xii (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:38:38 -0500
Received: by mail-io0-f194.google.com with SMTP id d16so9415808iob.4
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:38:38 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 2/2] kbuild: add __cc-ifversion and compiler-specific variants
Date: Thu, 30 Nov 2017 15:38:27 -0800
Message-Id: <20171130233827.130069-3-samitolvanen@google.com>
In-Reply-To: <20171130233827.130069-1-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
 <20171130233827.130069-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

This change adds macros for testing both compiler name and
version. Current cc-version, cc-ifversion etc. macros that test
gcc version are left unchanged to prevent compatibility issues
with existing tests.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Kbuild.include | 41 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 065324a8046f..eb2cf2780f6e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -215,6 +215,37 @@ cc-disable-warning = $(call try-run-cached,\
 # Expands to either gcc or clang
 cc-name = $(call shell-cached,$(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
 
+# __cc-version
+# Returns compiler version
+__cc-version = $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/$(cc-name)-version.sh $(CC))
+
+# __cc-fullversion
+# Returns full compiler version
+__cc-fullversion = $(call shell-cached,$(CONFIG_SHELL) \
+	$(srctree)/scripts/$(cc-name)-version.sh -p $(CC))
+
+# __cc-ifversion
+# Matches compiler name and version
+# Usage:  EXTRA_CFLAGS += $(call cc-if-name-version, gcc, -lt, 0402, -O1)
+__cc-ifversion = $(shell [ $(cc-name) = $(1) ] && [ $(__cc-version) $(2) $(3) ] && echo $(4) || echo $(5))
+
+# __cc-if-fullversion
+# Matches compiler name and full version
+# Usage:  EXTRA_CFLAGS += $(call cc-if-name-fullversion, gcc, -lt, 040502, -O1)
+__cc-if-fullversion = $(shell [ $(cc-name) = $(1) ] && [ $(__cc-fullversion) $(2) $(3) ] && echo $(4) || echo $(5))
+
+# gcc-ifversion
+gcc-ifversion = $(call __cc-ifversion, gcc, $(1), $(2), $(3), $(4))
+
+# gcc-if-fullversion
+gcc-if-fullversion = (call __cc-if-fullversion, gcc, $(1), $(2), $(3), $(4))
+
+# clang-ifversion
+clang-ifversion =  $(call __cc-ifversion, clang, $(1), $(2), $(3), $(4))
+
+# clang-if-fullversion
+clang-if-fullversion = (call __cc-if-fullversion, clang, $(1), $(2), $(3), $(4))
+
 # cc-version
 cc-version = $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
 
@@ -222,13 +253,9 @@ cc-version = $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.
 cc-fullversion = $(call shell-cached,$(CONFIG_SHELL) \
 	$(srctree)/scripts/gcc-version.sh -p $(CC))
 
-# cc-ifversion
-# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(cc-version) $(1) $(2) ] && echo $(3) || echo $(4))
-
-# cc-if-fullversion
-# Usage:  EXTRA_CFLAGS += $(call cc-if-fullversion, -lt, 040502, -O1)
-cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo $(4))
+# backward compatibility
+cc-ifversion = $(gcc-ifversion)
+cc-if-fullversion = $(gcc-if-fullversion)
 
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-- 
2.15.0.531.g2ccb3012c9-goog

