Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:35276 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753710AbdCQAXp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Mar 2017 20:23:45 -0400
Received: by mail-pg0-f50.google.com with SMTP id b129so32608815pgc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Mar 2017 17:23:44 -0700 (PDT)
From: Michael Davidson <md@google.com>
Subject: [PATCH 4/7] x86, boot, LLVM: #undef memcpy etc in string.c
Date: Thu, 16 Mar 2017 17:15:17 -0700
Message-Id: <20170317001520.85223-5-md@google.com>
In-Reply-To: <20170317001520.85223-1-md@google.com>
References: <20170317001520.85223-1-md@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Kaehlcke <mka@chromium.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, Michael Davidson <md@google.com>

undef memcpy and friends in boot/string.c so that the functions
defined here will have the correct names, otherwise we end up
up trying to redefine __builtin_memcpy etc.
Surprisingly, gcc allows this (and, helpfully, discards the
__builtin_ prefix from the function name when compiling it),
but clang does not.

Adding these #undef's appears to preserve what I assume was
the original intent of the code.

Signed-off-by: Michael Davidson <md@google.com>
---
 arch/x86/boot/string.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 5457b02fc050..b40266850869 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -16,6 +16,15 @@
 #include "ctype.h"
 #include "string.h"
 
+/*
+ * Undef these macros so that the functions that we provide
+ * here will have the correct names regardless of how string.h
+ * may have chosen to #define them.
+ */
+#undef memcpy
+#undef memset
+#undef memcmp
+
 int memcmp(const void *s1, const void *s2, size_t len)
 {
 	bool diff;
-- 
2.12.0.367.g23dc2f6d3c-goog

