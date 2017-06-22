Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:57817 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753343AbdFVROr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 13:14:47 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 01/11] compiler: introduce noinline_if_stackbloat annotation
Date: Thu, 22 Jun 2017 19:13:45 +0200
Message-Id: <20170622171355.267192-2-arnd@arndb.de>
In-Reply-To: <20170622171355.267192-1-arnd@arndb.de>
References: <20170622171355.267192-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Arend van Spriel <arend.vanspriel@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-kbuild@vger.kernel.org, Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>

When CONFIG_KASAN is set, we can run into some code that uses incredible
amounts of kernel stack:

drivers/staging/dgnc/dgnc_neo.c:1056:1: error: the frame size of 11112 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
drivers/media/i2c/cx25840/cx25840-core.c:4960:1: error: the frame size of 94000 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
drivers/media/dvb-frontends/stv090x.c:3430:1: error: the frame size of 5312 bytes is larger than 3072 bytes [-Werror=frame-larger-than=]

This happens when a sanitizer uses stack memory each time an inline function
gets called. This introduces a new annotation for those functions to make
them either 'inline' or 'noinline' dependning on the CONFIG_KASAN symbol.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/compiler.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 219f82f3ec1a..a402c43c07d2 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -412,6 +412,17 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
  */
 #define noinline_for_stack noinline
 
+/*
+ * CONFIG_KASAN can lead to extreme stack usage with certain patterns when
+ * one function gets inlined many times and each instance requires a stack
+ * ckeck.
+ */
+#ifdef CONFIG_KASAN
+#define noinline_if_stackbloat noinline __maybe_unused
+#else
+#define noinline_if_stackbloat inline
+#endif
+
 #ifndef __always_inline
 #define __always_inline inline
 #endif
-- 
2.9.0

