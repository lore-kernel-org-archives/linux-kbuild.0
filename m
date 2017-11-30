Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:45815 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752025AbdK3XjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:39:19 -0500
Received: by mail-it0-f67.google.com with SMTP id z6so507852iti.4
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:39:19 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 6/7] arm64: explicitly pass --no-fix-cortex-a53-843419 to GNU gold
Date: Thu, 30 Nov 2017 15:39:04 -0800
Message-Id: <20171130233905.130602-7-samitolvanen@google.com>
In-Reply-To: <20171130233905.130602-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171130233905.130602-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

Some versions of GNU gold are known to produce broken code with
--fix-cortex-a53-843419 as explained in this bug:

  https://sourceware.org/bugzilla/show_bug.cgi?id=21491

If ARM64_ERRATUM_843419 is disabled and we're using GNU gold, pass
--no-fix-cortex-a53-843419 to the linker to ensure the erratum
fix is not used even if the linker is configured to enable it by
default.

This change also adds a warning if the erratum fix is enabled and
gold version <1.14 is used.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 82a0df6e865e..68eed687e468 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -26,8 +26,17 @@ ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
   ifeq ($(call ld-option, --fix-cortex-a53-843419),)
 $(warning ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum)
   else
+    ifeq ($(call gold-ifversion, -lt, 114000000, y), y)
+$(warning This version of GNU gold may generate incorrect code with --fix-cortex-a53-843419;\
+	see https://sourceware.org/bugzilla/show_bug.cgi?id=21491)
+    endif
 LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
   endif
+else
+  ifeq ($(ld-name),gold)
+# Pass --no-fix-cortex-a53-843419 to ensure the erratum fix is disabled
+LDFLAGS	+= --no-fix-cortex-a53-843419
+  endif
 endif
 
 KBUILD_DEFCONFIG := defconfig
-- 
2.15.0.531.g2ccb3012c9-goog

