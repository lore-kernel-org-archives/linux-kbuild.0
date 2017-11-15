Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35208 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759030AbdKOVes (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:34:48 -0500
Received: by mail-io0-f196.google.com with SMTP id i38so3094426iod.2
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:34:48 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 04/18] arm64: use -mno-implicit-float instead of -mgeneral-regs-only
Date: Wed, 15 Nov 2017 13:34:14 -0800
Message-Id: <20171115213428.22559-5-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

From: Greg Hackmann <ghackmann@google.com>

LLVM bug 30792 causes clang's AArch64 backend to crash compiling
arch/arm64/crypto/aes-ce-cipher.c.  Replacing -mgeneral-regs-only with
-mno-implicit-float is the suggested workaround.

Signed-off-by: Greg Hackmann <ghackmann@google.com>
Cc: Matthias Kaehlcke <mka@chromium.org>
[added cc-ifversion to enable the workaround only for clang <6.0]
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b35788c909f1..ecd5ed11c764 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -49,7 +49,13 @@ $(warning Detected assembler with broken .inst; disassembly will be unreliable)
   endif
 endif
 
-KBUILD_CFLAGS	+= -mgeneral-regs-only $(lseinstr) $(brokengasinst)
+ifeq ($(cc-name),clang)
+# This is a workaround for https://bugs.llvm.org/show_bug.cgi?id=30792.
+KBUILD_CFLAGS	+= $(call cc-ifversion, -lt, 0600, -mno-implicit-float, -mgeneral-regs-only)
+else
+KBUILD_CFLAGS	+= -mgeneral-regs-only
+endif
+KBUILD_CFLAGS	+= $(lseinstr) $(brokengasinst)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(call cc-option, -mpc-relative-literal-loads)
 KBUILD_AFLAGS	+= $(lseinstr) $(brokengasinst)
-- 
2.15.0.448.gf294e3d99a-goog

