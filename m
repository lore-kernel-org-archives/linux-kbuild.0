Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:18756 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbgCZIDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:03:54 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 02/16] x86: remove unneeded defined(__ASSEMBLY__) check from asm/dwarf2.h
Date: Thu, 26 Mar 2020 17:00:50 +0900
Message-Id: <20200326080104.27286-3-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, clang-built-linux@googlegroups.com, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org

This header file has the following check at the top:

  #ifndef __ASSEMBLY__
  #warning "asm/dwarf2.h should be only included in pure assembly files"
  #endif

So, we expect defined(__ASSEMBLY__) is always true.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v2: None

 arch/x86/include/asm/dwarf2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/dwarf2.h b/arch/x86/include/asm/dwarf2.h
index ae391f609840..5a0502212bc5 100644
--- a/arch/x86/include/asm/dwarf2.h
+++ b/arch/x86/include/asm/dwarf2.h
@@ -36,7 +36,7 @@
 #define CFI_SIGNAL_FRAME
 #endif
 
-#if defined(CONFIG_AS_CFI_SECTIONS) && defined(__ASSEMBLY__)
+#if defined(CONFIG_AS_CFI_SECTIONS)
 #ifndef BUILD_VDSO
 	/*
 	 * Emit CFI data in .debug_frame sections, not .eh_frame sections.
-- 
2.17.1
