Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:14694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752708AbdK0Veb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:31 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 18/21] lto, crypto: Disable LTO for camelia glue
Date: Mon, 27 Nov 2017 13:34:20 -0800
Message-Id: <20171127213423.27218-19-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

The camelia assembler glue functions don't like LTO
and cause missing symbols. Just disable LTO for them.
I tried to add some visibles, but it's good enough
and this works fine.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/crypto/Makefile | 1 +
 crypto/Makefile          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 5f07333bb224..9dd30dd062f1 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -64,6 +64,7 @@ serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
 
 aes-x86_64-y := aes-x86_64-asm_64.o aes_glue.o
 des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
+CFLAGS_camellia_glue.o += $(DISABLE_LTO)
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
 blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
diff --git a/crypto/Makefile b/crypto/Makefile
index d674884b2d51..86ae10bb468b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -101,6 +101,7 @@ CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gn
 obj-$(CONFIG_CRYPTO_AES) += aes_generic.o
 obj-$(CONFIG_CRYPTO_AES_TI) += aes_ti.o
 obj-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
+CFLAGS_cast_common.o += $(DISABLE_LTO)
 obj-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
 obj-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
 obj-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
-- 
2.13.6

