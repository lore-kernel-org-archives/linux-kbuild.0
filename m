Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:34098 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752580AbdGFWBv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 18:01:51 -0400
Received: by mail-pf0-f170.google.com with SMTP id q85so7202599pfq.1
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jul 2017 15:01:46 -0700 (PDT)
From: Greg Hackmann <ghackmann@google.com>
Subject: [PATCH 2/4] kasan: added functions for unpoisoning stack variables
Date: Thu,  6 Jul 2017 15:01:12 -0700
Message-Id: <20170706220114.142438-3-ghackmann@google.com>
In-Reply-To: <20170706220114.142438-1-ghackmann@google.com>
References: <20170706220114.142438-1-ghackmann@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

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
---
 mm/kasan/kasan.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/kasan/kasan.c b/mm/kasan/kasan.c
index 892b626f564b..89911e5c69f9 100644
--- a/mm/kasan/kasan.c
+++ b/mm/kasan/kasan.c
@@ -828,6 +828,21 @@ void __asan_allocas_unpoison(const void *stack_top, const void *stack_bottom)
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
 static int kasan_mem_notifier(struct notifier_block *nb,
 			unsigned long action, void *data)
-- 
2.13.2.725.g09c95d1e9-goog

