Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:18758 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgCZIDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:03:54 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 11/16] x86: add comments about the binutils version to support code in as-instr
Date: Thu, 26 Mar 2020 17:00:59 +0900
Message-Id: <20200326080104.27286-12-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, clang-built-linux@googlegroups.com, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org

We raise the minimal supported binutils version from time to time.
The last bump was commit 1fb12b35e5ff ("kbuild: Raise the minimum
required binutils version to 2.21").

We need to keep these as-instr checks because binutils 2.21 does not
support them.

I hope this will be a good hint which one can be dropped when we
bump the minimal binutils version next time.

As for the Clang/LLVM builds, we require very new LLVM version,
so the LLVM integrated assembler supports all of them.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
---

Changes in v2:
  - Change the patch order and rebase

 arch/x86/Kconfig.assembler | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
index 91230bf11a14..a5a1d2766b3a 100644
--- a/arch/x86/Kconfig.assembler
+++ b/arch/x86/Kconfig.assembler
@@ -3,15 +3,25 @@
 
 config AS_AVX2
 	def_bool $(as-instr,vpbroadcastb %xmm0$(comma)%ymm1)
+	help
+	  Supported by binutils >= 2.22 and LLVM integrated assembler
 
 config AS_AVX512
 	def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
+	help
+	  Supported by binutils >= 2.25 and LLVM integrated assembler
 
 config AS_SHA1_NI
 	def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
+	help
+	  Supported by binutils >= 2.24 and LLVM integrated assembler
 
 config AS_SHA256_NI
 	def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
+	help
+	  Supported by binutils >= 2.24 and LLVM integrated assembler
 
 config AS_ADX
 	def_bool $(as-instr,adox %eax$(comma)%eax)
+	help
+	  Supported by binutils >= 2.23 and LLVM integrated assembler
-- 
2.17.1
