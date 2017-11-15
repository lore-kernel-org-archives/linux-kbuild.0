Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34359 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759448AbdKOVfL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:35:11 -0500
Received: by mail-it0-f66.google.com with SMTP id m191so13353409itg.1
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:35:11 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 16/18] arm64: crypto: disable LTO for aes-ce-cipher.c
Date: Wed, 15 Nov 2017 13:34:26 -0800
Message-Id: <20171115213428.22559-17-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

CONFIG_LTO_CLANG requires the use of clang's integrated assembler, which
doesn't understand the inline assembly in aes-ce-cipher.c. Disable LTO for
the file to work around the issue.

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/crypto/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index b5edc5918c28..af08508521a3 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_CRYPTO_CRC32_ARM64_CE) += crc32-ce.o
 crc32-ce-y:= crc32-ce-core.o crc32-ce-glue.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE) += aes-ce-cipher.o
-CFLAGS_aes-ce-cipher.o += -march=armv8-a+crypto
+CFLAGS_aes-ce-cipher.o += -march=armv8-a+crypto $(DISABLE_LTO_CLANG)
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
 aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
-- 
2.15.0.448.gf294e3d99a-goog

