Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:36565 "EHLO
        mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933017AbcLPWIj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Dec 2016 17:08:39 -0500
Received: by mail-pf0-f173.google.com with SMTP id 189so15932035pfz.3
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Dec 2016 14:08:39 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v4 2/4] util: Move type casts into is_kernel_rodata
Date: Fri, 16 Dec 2016 14:06:22 -0800
Message-Id: <1481925984-98605-3-git-send-email-keescook@chromium.org>
In-Reply-To: <1481925984-98605-1-git-send-email-keescook@chromium.org>
References: <1481925984-98605-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel-hardening@lists.openwall.com
Cc: Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>, pageexec@freemail.hu, spender@grsecurity.net, mmarek@suse.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, minipli@ld-linux.so, linux@armlinux.org.uk, catalin.marinas@arm.com, linux@rasmusvillemoes.dk, david.brown@linaro.org, benh@kernel.crashing.org, tglx@linutronix.de, akpm@linux-foundation.org, jlayton@poochiereds.net, sam@ravnborg.org

From: Emese Revfy <re.emese@gmail.com>

This moves type casts into the is_kernel_rodata() function itself so that
parameters can be marked as "nocapture" in the coming initify gcc plugin.

Signed-off-by: Emese Revfy <re.emese@gmail.com>
[kees: expanded commit message]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 mm/util.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 1a41553db866..5606c6b74eee 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -17,10 +17,10 @@
 
 #include "internal.h"
 
-static inline int is_kernel_rodata(unsigned long addr)
+static inline int is_kernel_rodata(const void *addr)
 {
-	return addr >= (unsigned long)__start_rodata &&
-		addr < (unsigned long)__end_rodata;
+	return (unsigned long)addr >= (unsigned long)__start_rodata &&
+		(unsigned long)addr < (unsigned long)__end_rodata;
 }
 
 /**
@@ -31,7 +31,7 @@ static inline int is_kernel_rodata(unsigned long addr)
  */
 void kfree_const(const void *x)
 {
-	if (!is_kernel_rodata((unsigned long)x))
+	if (!is_kernel_rodata(x))
 		kfree(x);
 }
 EXPORT_SYMBOL(kfree_const);
@@ -68,7 +68,7 @@ EXPORT_SYMBOL(kstrdup);
  */
 const char *kstrdup_const(const char *s, gfp_t gfp)
 {
-	if (is_kernel_rodata((unsigned long)s))
+	if (is_kernel_rodata(s))
 		return s;
 
 	return kstrdup(s, gfp);
-- 
2.7.4

