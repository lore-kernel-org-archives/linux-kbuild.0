Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:39836 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbdK2VvT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 16:51:19 -0500
Received: by mail-it0-f67.google.com with SMTP id 68so5990849ite.4
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 13:51:19 -0800 (PST)
From: Paul Lawrence <paullawrence@google.com>
Subject: [PATCH v2 3/5] kasan: added functions for unpoisoning stack variables
Date: Wed, 29 Nov 2017 13:50:48 -0800
Message-Id: <20171129215050.158653-4-paullawrence@google.com>
In-Reply-To: <20171129215050.158653-1-paullawrence@google.com>
References: <20171129215050.158653-1-paullawrence@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Paul Lawrence <paullawrence@google.com>

From: Alexander Potapenko <glider@google.com>

As a code-size optimization, LLVM builds since r279383 may
bulk-manipulate the shadow region when (un)poisoning large memory
blocks.  This requires new callbacks that simply do an uninstrumented
memset().

This fixes linking the Clang-built kernel when using KASAN.

Signed-off-by: Alexander Potapenko <glider@google.com>
[ghackmann@google.com: fix memset() parameters, and tweak
 commit message to describe new callbacks]
Signed-off-by: Greg Hackmann <ghackmann@google.com>
Signed-off-by: Paul Lawrence <paullawrence@google.com>

---
 mm/kasan/kasan.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/kasan/kasan.c b/mm/kasan/kasan.c
index f86f862f41f8..89565a1ec417 100644
--- a/mm/kasan/kasan.c
+++ b/mm/kasan/kasan.c
@@ -768,6 +768,21 @@ void __asan_allocas_unpoison(const void *stack_top, const void *stack_bottom)
 }
 EXPORT_SYMBOL(__asan_allocas_unpoison);
 
+/* Emitted by the compiler to [un]poison local variables. */
+#define DEFINE_ASAN_SET_SHADOW(byte) \
+	void __asan_set_shadow_##byte(const void *addr, size_t size)	\
+	{								\
+		__memset((void *)addr, 0x##byte, size);			\
+	}								\
+	EXPORT_SYMBOL(__asan_set_shadow_##byte)
+
+DEFINE_ASAN_SET_SHADOW(00);
+DEFINE_ASAN_SET_SHADOW(f1);
+DEFINE_ASAN_SET_SHADOW(f2);
+DEFINE_ASAN_SET_SHADOW(f3);
+DEFINE_ASAN_SET_SHADOW(f5);
+DEFINE_ASAN_SET_SHADOW(f8);
+
 #ifdef CONFIG_MEMORY_HOTPLUG
 static int __meminit kasan_mem_notifier(struct notifier_block *nb,
 			unsigned long action, void *data)
-- 
2.15.0.531.g2ccb3012c9-goog

