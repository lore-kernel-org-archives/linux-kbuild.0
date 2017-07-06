Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:33741 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752580AbdGFWBy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 18:01:54 -0400
Received: by mail-pg0-f52.google.com with SMTP id k14so7255226pgr.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jul 2017 15:01:49 -0700 (PDT)
From: Greg Hackmann <ghackmann@google.com>
Subject: [PATCH 3/4] kasan: support LLVM-style asan parameters
Date: Thu,  6 Jul 2017 15:01:13 -0700
Message-Id: <20170706220114.142438-4-ghackmann@google.com>
In-Reply-To: <20170706220114.142438-1-ghackmann@google.com>
References: <20170706220114.142438-1-ghackmann@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

Use cc-option to figure out whether the compiler's sanitizer uses
LLVM-style parameters ("-mllvm -asan-foo=bar") or GCC-style parameters
("--param asan-foo=bar").

Signed-off-by: Greg Hackmann <ghackmann@google.com>
---
 scripts/Makefile.kasan | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 9576775a86f6..b66ae4b4546b 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -9,11 +9,19 @@ KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
 CFLAGS_KASAN_MINIMAL := -fsanitize=kernel-address
 
-CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
+CFLAGS_KASAN_GCC := $(call cc-option, -fsanitize=kernel-address \
 		-fasan-shadow-offset=$(KASAN_SHADOW_OFFSET) \
 		--param asan-stack=1 --param asan-globals=1 \
 		--param asan-instrumentation-with-call-threshold=$(call_threshold))
 
+CFLAGS_KASAN_LLVM := $(call cc-option, -fsanitize=kernel-address \
+		-mllvm -asan-mapping-offset=$(KASAN_SHADOW_OFFSET) \
+		-mllvm -asan-stack=1 -mllvm -asan-globals=1 \
+		-mllvm -asan-use-after-scope=1 \
+		-mllvm -asan-instrumentation-with-call-threshold=$(call_threshold))
+
+CFLAGS_KASAN := $(CFLAGS_KASAN_GCC) $(CFLAGS_KASAN_LLVM)
+
 ifeq ($(call cc-option, $(CFLAGS_KASAN_MINIMAL) -Werror),)
    ifneq ($(CONFIG_COMPILE_TEST),y)
         $(warning Cannot use CONFIG_KASAN: \
-- 
2.13.2.725.g09c95d1e9-goog

