Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:45189 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753068AbdK2AAZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Nov 2017 19:00:25 -0500
Received: by mail-io0-f194.google.com with SMTP id e204so1803631iof.12
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2017 16:00:24 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH 2/3] kbuild: add cc-if-name-version and compiler-specific variants
Date: Tue, 28 Nov 2017 16:00:10 -0800
Message-Id: <20171129000011.55235-3-samitolvanen@google.com>
In-Reply-To: <20171129000011.55235-1-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

This change adds macros for testing both compiler name and
version. Current cc-version, cc-ifversion etc. macros that test
gcc version are left unchanged to prevent compatibility issues
with existing tests.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Kbuild.include | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 065324a8046f..b6d7d347b203 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -215,6 +215,37 @@ cc-disable-warning = $(call try-run-cached,\
 # Expands to either gcc or clang
 cc-name = $(call shell-cached,$(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
 
+# __cc-version
+# Returns compiler version
+__cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/$(cc-name)-version.sh $(CC))
+
+# __cc-fullversion
+# Returns full compiler version
+__cc-fullversion = $(shell $(CONFIG_SHELL) \
+	$(srctree)/scripts/$(cc-name)-version.sh -p $(CC))
+
+# cc-if-name-version
+# Matches compiler name and version
+# Usage:  EXTRA_CFLAGS += $(call cc-if-name-version, gcc, -lt, 0402, -O1)
+cc-if-name-version = $(shell [ $(cc-name) == $(1) ] && [ $(__cc-version) $(2) $(3) ] && echo $(4) || echo $(5))
+
+# cc-if-name-fullversion
+# Matches compiler name and full version
+# Usage:  EXTRA_CFLAGS += $(call cc-if-name-fullversion, gcc, -lt, 040502, -O1)
+cc-if-name-fullversion = $(shell [ $(cc-name) == $(1) ] && [ $(__cc-fullversion) $(2) $(3) ] && echo $(4) || echo $(5))
+
+# gcc-ifversion
+gcc-ifversion = $(call cc-if-name-version, gcc, $(1), $(2), $(3), $(4))
+
+# gcc-if-fullversion
+gcc-if-fullversion = (call cc-if-name-fullversion, gcc, $(1), $(2), $(3), $(4))
+
+# clang-ifversion
+clang-ifversion =  $(call cc-if-name-version, clang, $(1), $(2), $(3), $(4))
+
+# clang-if-fullversion
+clang-if-fullversion = (call cc-if-name-fullversion, clang, $(1), $(2), $(3), $(4))
+
 # cc-version
 cc-version = $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
 
-- 
2.15.0.417.g466bffb3ac-goog

