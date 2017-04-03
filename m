Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f48.google.com ([74.125.83.48]:33271 "EHLO
        mail-pg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752367AbdDCTrM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Apr 2017 15:47:12 -0400
Received: by mail-pg0-f48.google.com with SMTP id x125so129962012pgb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Apr 2017 12:47:11 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] frv: Use OFFSET macro in DEF_*REG()
Date: Mon,  3 Apr 2017 12:46:36 -0700
Message-Id: <20170403194636.96438-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>

Avoid code duplication by using OFFSET() in DEF_*REG() instead of
replicating the macro.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/frv/kernel/asm-offsets.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/frv/kernel/asm-offsets.c b/arch/frv/kernel/asm-offsets.c
index 8414293f213a..20c5b79b55f9 100644
--- a/arch/frv/kernel/asm-offsets.c
+++ b/arch/frv/kernel/asm-offsets.c
@@ -14,21 +14,10 @@
 #include <asm/thread_info.h>
 #include <asm/gdb-stub.h>
 
-#define DEF_PTREG(sym, reg) \
-        asm volatile("\n->" #sym " %0 offsetof(struct pt_regs, " #reg ")" \
-		     : : "i" (offsetof(struct pt_regs, reg)))
-
-#define DEF_IREG(sym, reg) \
-        asm volatile("\n->" #sym " %0 offsetof(struct user_context, " #reg ")" \
-		     : : "i" (offsetof(struct user_context, reg)))
-
-#define DEF_FREG(sym, reg) \
-        asm volatile("\n->" #sym " %0 offsetof(struct user_context, " #reg ")" \
-		     : : "i" (offsetof(struct user_context, reg)))
-
-#define DEF_0REG(sym, reg) \
-        asm volatile("\n->" #sym " %0 offsetof(struct frv_frame0, " #reg ")" \
-		     : : "i" (offsetof(struct frv_frame0, reg)))
+#define DEF_PTREG(sym, reg) OFFSET(sym, pt_regs, reg)
+#define DEF_IREG(sym, reg) OFFSET(sym, user_context, reg)
+#define DEF_FREG(sym, reg) OFFSET(sym, user_context, reg)
+#define DEF_0REG(sym, reg) OFFSET(sym, frv_frame0, reg)
 
 void foo(void)
 {
-- 
2.12.2.564.g063fe858b8-goog

