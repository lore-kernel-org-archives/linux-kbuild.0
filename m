Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38973 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730470AbgB1AW6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 19:22:58 -0500
Received: by mail-pg1-f195.google.com with SMTP id j15so542419pgm.6
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2020 16:22:54 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 6/9] arm64/build: Use common DISCARDS in linker script
Date: Thu, 27 Feb 2020 16:22:41 -0800
Message-Id: <20200228002244.15240-7-keescook@chromium.org>
In-Reply-To: <20200228002244.15240-1-keescook@chromium.org>
References: <20200228002244.15240-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>
Cc: Kees Cook <keescook@chromium.org>, "H.J. Lu" <hjl.tools@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter Collingbourne <pcc@google.com>, James Morse <james.morse@arm.com>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

Use the common DISCARDS rule for the linker script in an effort to
regularize the linker script to prepare for warning on orphaned
sections.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 497f9675071d..c61d9ab3211c 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -6,6 +6,7 @@
  */
 
 #define RO_EXCEPTION_TABLE_ALIGN	8
+#define RUNTIME_DISCARD_EXIT
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/cache.h>
@@ -19,7 +20,6 @@
 
 /* .exit.text needed in case of alternative patching */
 #define ARM_EXIT_KEEP(x)	x
-#define ARM_EXIT_DISCARD(x)
 
 OUTPUT_ARCH(aarch64)
 ENTRY(_text)
@@ -94,12 +94,8 @@ SECTIONS
 	 * matching the same input section name.  There is no documented
 	 * order of matching.
 	 */
+	DISCARDS
 	/DISCARD/ : {
-		ARM_EXIT_DISCARD(EXIT_TEXT)
-		ARM_EXIT_DISCARD(EXIT_DATA)
-		EXIT_CALL
-		*(.discard)
-		*(.discard.*)
 		*(.interp .dynamic)
 		*(.dynsym .dynstr .hash .gnu.hash)
 		*(.eh_frame)
-- 
2.20.1
